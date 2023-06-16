import 'package:blockvault_investment_flutter/model/user.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  Rx<UserModel> userModel = UserModel().obs;
  RxBool isLoading = false.obs;

  UserModel get user => userModel.value;

  set user(UserModel value) => userModel.value = value;

  void clear() {
    userModel.value = UserModel();
    isLoading.value = false;
  }
}
