import 'dart:typed_data';

import 'package:blockvault_investment_flutter/controllers/auth_controller.dart';
import 'package:blockvault_investment_flutter/controllers/deposit_controller.dart';
import 'package:blockvault_investment_flutter/controllers/user_controller.dart';
import 'package:blockvault_investment_flutter/dashboard.dart';
import 'package:blockvault_investment_flutter/database/database.dart';
import 'package:blockvault_investment_flutter/model/deposit_model.dart';
import 'package:blockvault_investment_flutter/pages/authentication/widgets/scrolling_text.dart';
import 'package:blockvault_investment_flutter/utils/root.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:path/path.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

class DepositScreen extends StatefulWidget {
  const DepositScreen({super.key});

  @override
  State<DepositScreen> createState() => _DepositScreenState();
}

class _DepositScreenState extends State<DepositScreen> {
  @override
  void initState() {
    Get.put(DepositController());
    super.initState();
  }

  String? dropdownGenderValue;
  TextEditingController amountController = TextEditingController();
  // DepositController depositController = DepositController();
  UserController userController = UserController();

  XFile? image;

  String? imagePath;

  Reference? ref;

  bool? isLoading = false;

  var image_down_url;

  final firestoreinstance = FirebaseFirestore.instance;

  final ImagePicker _picker = ImagePicker();

  Future pickedImage() async {
    try {
      print("pass");
      final image = await _picker.pickImage(source: ImageSource.camera);
      print("pass");
      print(" image $image");
      if (image == null) return;

      final imageTemporary = XFile(image.path);
      print("pass");
      print(imageTemporary);
      //final imagePermanent = await saveImagePermanently(image.path);
      setState(() {
        this.image = imageTemporary;
        imagePath = basename(image.path);
        uploadImageFile(image, imagePath);
      });
      print("pass");
    } catch (e) {
      Get.snackbar('Error', 'failed to take image $e');
      print(e);
    }
  }

  Future<String> uploadImageFile(XFile image, String? imagePath) async {
    print("pass");
    ref = FirebaseStorage.instance.ref().child(imagePath!);
    Uint8List imageData = await XFile(image.path).readAsBytes();
    // print(imageData);
    print(imagePath);
    UploadTask uploadTask = ref!.putData(imageData);
    print("object");

    image_down_url = await (await uploadTask).ref.getDownloadURL();
    print("object");
    print(image_down_url);

    return image_down_url;
  }

  // Future<dynamic> finalUpload(context) async {
  //   if(image_down_url != null) {
  //     print(image_down_url);

  //     var data = {
  //       "image_url": image_down_url
  //     };

  //     firestoreinstance.collection('users').doc(uid).update(data)
  //     .whenComplete(() => Get.snackbar("success", "Profile picture uploaded successfully", snackPosition: SnackPosition.BOTTOM));
  //   } else {
  //     Get.snackbar("Error", "Please take a clearer picture or check your internet", snackPosition: SnackPosition.BOTTOM);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final ancestorScaffold = Scaffold.maybeOf(context);
    // 2. check if it has a drawer
    final hasDrawer = ancestorScaffold != null && ancestorScaffold.hasDrawer;
    final depositController = Get.put(DepositController());
    showDataAlert() {
      showDialog(
          context: context,
          builder: (context) {
            return StatefulBuilder(builder: (context, setState) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      20.0,
                    ),
                  ),
                ),
                contentPadding: EdgeInsets.only(
                  top: 10.0,
                ),
                titlePadding: EdgeInsets.only(left: 125, top: 20),
                titleTextStyle: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w900,
                ),
                title: Text(
                  "Confirm Payment",
                ),
                content: Container(
                  width: 350,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          "Pay with $dropdownGenderValue",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 20,
                          child: ScrollingText(
                            text:
                                "Please only pay $dropdownGenderValue to this wallet",
                            // style: TextStyle(
                            //     fontSize: 20.0, fontWeight: FontWeight.w700),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "$dropdownGenderValue address",
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Flexible(
                          child: Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Colors.black)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Center(
                                        child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Text(
                                        "Dshkdloewnshekm",
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    )),
                                  ),
                                  Container(
                                    height: 40,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                        color: Colors.black,
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(5),
                                            bottomRight: Radius.circular(5))),
                                    child: Center(
                                      child: Icon(
                                        Icons.copy,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              )),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Payment method",
                              style: TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "$dropdownGenderValue",
                              style: TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Amount",
                              style: TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "\$${amountController.text}",
                              style: TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Upload Payment proof after payment",
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Color.fromRGBO(28, 34, 55, 1),
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    await pickedImage();
                                    // await Future.delayed(Duration(seconds: 5));
                                    setState(() {});
                                    print(image_down_url);
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        border: Border.all(color: Colors.black),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Center(
                                        child: Text(
                                      'Choose file',
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    )),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Flexible(
                                  child: Text(
                                    imagePath != null
                                        ? "$imagePath"
                                        : 'No file chosen',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: double.infinity,
                          height: 60,
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () async {
                              setState(() {
                                isLoading = true;
                              });
                              var user = DepositModel(
                                  transactionId: "1234",
                                  amount: double.parse(amountController.text),
                                  method: dropdownGenderValue,
                                  imageUrl: image_down_url,
                                  status: false,
                                  date: DateTime.now());
                              var deposit =
                                  await depositController.deposit(user);
                              print(deposit);
                              Get.offAll(() => Root());
                              setState(() {
                                isLoading = false;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                              // fixedSize: Size(250, 50),
                            ),
                            child: Text(
                              isLoading == true
                                  ? 'Loading...'
                                  : "Comlete Payment",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            });
          });
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          GetX<UserController>(initState: (usercontroller) async {
            Get.find<UserController>().user = await DataBase().getUser();
          }, builder: (usercontroller) {
            return usercontroller.user.availableBalance != null
                ? Row(
                    children: [
                      Text(
                        "Total Balance:",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w800),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "\$${(usercontroller.user.availableBalance! + usercontroller.user.walletBalance!)}",
                        style: TextStyle(
                            color: Color.fromRGBO(243, 156, 18, 1),
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 50,
                      )
                    ],
                  )
                : Row(
                    children: [
                      Text(
                        "Total Balance:",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w800),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "\$0",
                        style: TextStyle(
                            color: Color.fromRGBO(243, 156, 18, 1),
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 50,
                      )
                    ],
                  );
          })
        ],
        leading: hasDrawer
            ? IconButton(
                icon: Icon(Icons.menu),
                // 4. open the drawer if we have one
                onPressed:
                    hasDrawer ? () => ancestorScaffold.openDrawer() : null,
              )
            : null,
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, bottom: 50),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Center(
                  child: Container(
                width: 500,
                height: 360,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(28, 34, 55, 1),
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Fund Wallet",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w900),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Enter Amount",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        cursorColor: const Color.fromRGBO(39, 39, 39, 1),
                        style: const TextStyle(
                            color: Color.fromRGBO(39, 39, 39, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: const Color.fromRGBO(237, 239, 245, 1),
                              ),
                            ),
                            hintText: "\$",
                            hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey),
                            filled: true,
                            fillColor: Colors.white),
                        controller: amountController,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Select Currency",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 56,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(255, 255, 255, 1),
                          borderRadius: BorderRadius.circular(3),
                          border: Border.all(
                            color: const Color.fromRGBO(237, 239, 245, 1),
                          ),
                        ),
                        child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: dropdownGenderValue,
                                icon: Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  color: Color.fromRGBO(159, 159, 159, 1),
                                ),
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                                hint: Text(
                                  'Currency',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(201, 201, 201, 1)),
                                ),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownGenderValue = newValue!;
                                  });
                                },
                                items: <String>[
                                  'Bitcoin',
                                  'Etherium',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Color.fromRGBO(39, 39, 39, 1)),
                                    ),
                                  );
                                }).toList(),
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () async {
                          showDataAlert();
                        },
                        child: Container(
                          width: 80,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                            child: Text(
                              "Deposit",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 900,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color.fromRGBO(28, 34, 55, 1),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Text(
                            "Deposit Transaction History",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                          thickness: 3,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: 900,
                          height: 80,
                          child: ListView(
                            children: [
                              Divider(
                                color: Colors.grey,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: 900,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 20, right: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "TRANSACTION ID",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      Text(
                                        "AMOUNT    ",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      Text(
                                        "METHOD                    ",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      Text(
                                        "STATUS                        ",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      Text(
                                        "CREATED                     ",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Divider(
                                color: Colors.grey,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                        Obx(() => Container(
                              height: 600,
                              width: 900,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color.fromRGBO(28, 34, 55, 1),
                              ),
                              child: ListView.builder(
                                physics: BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: depositController.deposits.length,
                                itemBuilder: (context, index) {
                                  Timestamp timestamp =
                                      depositController.deposits[index]["date"];
                                  DateTime dateTime = timestamp.toDate();
                                  return Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "${depositController.deposits[index]["transactionId"]}56",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              "${depositController.deposits[index]["amount"]}",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              depositController.deposits[index]
                                                          ["method"] ==
                                                      "Bitcoin"
                                                  ? "${depositController.deposits[index]["method"]}   "
                                                  : "${depositController.deposits[index]["method"]}",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            Container(
                                              width: 100,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                  color: depositController
                                                                      .deposits[
                                                                  index]
                                                              ["status"] ==
                                                          false
                                                      ? Colors.red
                                                      : Colors.green,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Center(
                                                child: Text(
                                                  depositController.deposits[
                                                                  index]
                                                              ["status"] ==
                                                          false
                                                      ? "Pending"
                                                      : "Approved",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              "${DateFormat('yyyy-MM-dd  kk:mm:ss').format(dateTime)}",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Divider(
                                        color: Colors.grey,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      )
                                    ],
                                  );
                                },
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
