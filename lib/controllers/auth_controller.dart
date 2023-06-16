import 'package:blockvault_investment_flutter/controllers/user_controller.dart';
import 'package:blockvault_investment_flutter/dashboard.dart';
import 'package:blockvault_investment_flutter/database/database.dart';
import 'package:blockvault_investment_flutter/model/user.dart';
import 'package:blockvault_investment_flutter/pages/authentication/landingpage.dart';
import 'package:blockvault_investment_flutter/utils/admin_root.dart';
import 'package:blockvault_investment_flutter/utils/root.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  Rxn<User> firebaseUser = Rxn<User>();
  var admin = FirebaseFirestore.instance.collection('admin');

  User? get user => firebaseUser.value;

  @override
  void onInit() {
    firebaseUser.bindStream(auth.userChanges());
    super.onInit();
  }

  void createUser(String email, String password, String userName,
      String firstName, String lastName) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password.trim());

      UserModel user = UserModel(
        id: userCredential.user!.uid,
        email: userCredential.user!.email,
        userName: userName,
        firstName: firstName,
        lastName: lastName,
        imageUrl: "",
        walletBalance: 0,
        availableBalance: 0,
      );

      if (await DataBase().createNewUser(user)) {
        Get.find<UserController>().user = user;
        Get.snackbar("Success", "account created",
            snackPosition: SnackPosition.TOP);
        Get.offAll(() => Root());
      }
    } on FirebaseAuthException catch (e) {
      Get.snackbar("error", "${e.message}", snackPosition: SnackPosition.TOP);
      print(e.message.toString());
    }
  }

  void login(String email, String password) async {
    try {
      UserCredential authResult = await auth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      Get.find<UserController>().user =
          await DataBase().getUser();
      Get.snackbar("Success", "login", snackPosition: SnackPosition.TOP);
      Get.offAll(() => Root());
    } on FirebaseAuthException catch (e) {
      Get.snackbar("error", "${e.message}", snackPosition: SnackPosition.TOP);
      print(e.message.toString());
    }
  }

  void adminLogin(String email, String password) async {
    print("object");
    await FirebaseFirestore.instance
        .collection('admin')
        .doc('admin')
        .snapshots()
        .forEach((element) {
      if (element.data()?['email'] == email &&
          element.data()?['password'] == password) {
        print("object");
        Get.offAll(() => AdminMyApp());
        print("object");
      }
      print("object");
    }).catchError((e) {
      Get.snackbar("error", "${e.message}", snackPosition: SnackPosition.TOP);
    });
  }

  void signOut() async {
    try {
      await auth.signOut();
      Get.find<UserController>().clear();
      Get.offAll(() => const LandingPage());
    } on FirebaseAuthException catch (e) {
      print(e.message.toString());
    }
  }
}
