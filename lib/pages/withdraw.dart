import 'dart:typed_data';

import 'package:blockvault_investment_flutter/controllers/auth_controller.dart';
import 'package:blockvault_investment_flutter/controllers/deposit_controller.dart';
import 'package:blockvault_investment_flutter/controllers/user_controller.dart';
import 'package:blockvault_investment_flutter/controllers/withdrawal_controller.dart';
import 'package:blockvault_investment_flutter/dashboard.dart';
import 'package:blockvault_investment_flutter/database/database.dart';
import 'package:blockvault_investment_flutter/model/deposit_model.dart';
import 'package:blockvault_investment_flutter/model/withdrawal_model.dart';
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

class WithdrawalScreen extends StatefulWidget {
  const WithdrawalScreen({super.key});

  @override
  State<WithdrawalScreen> createState() => _WithdrawalScreenState();
}

class _WithdrawalScreenState extends State<WithdrawalScreen> {
  @override
  void initState() {
    Get.put(WithdrawalController());
    super.initState();
  }

  String? dropdownGenderValue;
  String? dropdownwalletNameValue;
  TextEditingController amountController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  bool? isLoading = false;
  int? walletBalance;
  int? availableBalance;

  @override
  Widget build(BuildContext context) {
    final withdrawalController = Get.put(WithdrawalController());
    final ancestorScaffold = Scaffold.maybeOf(context);
    // 2. check if it has a drawer
    final hasDrawer = ancestorScaffold != null && ancestorScaffold.hasDrawer;

    return Scaffold(
      appBar: AppBar(
        actions: [
          GetX<UserController>(initState: (usercontroller) async {
            Get.find<UserController>().user = await DataBase().getUser();
          }, builder: (usercontroller) {
            walletBalance = usercontroller.user.walletBalance;
            availableBalance = usercontroller.user.availableBalance;
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
                width: 900,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(28, 34, 55, 1),
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Start Request",
                        style: TextStyle(
                            color: Color.fromRGBO(243, 156, 18, 1),
                            fontSize: 20,
                            fontWeight: FontWeight.w900),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Amount",
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
                        "Wallet type",
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
                                  'Withdraw type',
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
                                  'Trading profit',
                                  'Account balance',
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
                      Text(
                        "Wallet name",
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
                                value: dropdownwalletNameValue,
                                icon: Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  color: Color.fromRGBO(159, 159, 159, 1),
                                ),
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                                hint: Text(
                                  'E.g Bitcoin',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(201, 201, 201, 1)),
                                ),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownwalletNameValue = newValue!;
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
                      Text(
                        "Wallet address",
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
                            hintText: "ahbdndkdmbgsgHJjdb76",
                            hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey),
                            filled: true,
                            fillColor: Colors.white),
                        controller: addressController,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              setState(() {
                                isLoading = true;
                              });
                              if (dropdownGenderValue == 'Trading profit') {
                                if (availableBalance! >=
                                    int.parse(amountController.text)) {
                                  var user = WithdrawalModel(
                                      walletAddress: addressController.text,
                                      amount:
                                          double.parse(amountController.text),
                                      type: dropdownwalletNameValue,
                                      status: false,
                                      date: DateTime.now());
                                  var withdrawal = await withdrawalController
                                      .withdrawal(user);
                                  print(withdrawal);
                                  Get.offAll(() => Root());
                                  setState(() {
                                    isLoading = false;
                                  });
                                } else {
                                  Get.snackbar("error", "Insufficient balance",
                                      snackPosition: SnackPosition.TOP);
                                }
                              } else {
                                if (walletBalance! >=
                                    int.parse(amountController.text)) {
                                  var user = WithdrawalModel(
                                      walletAddress: addressController.text,
                                      amount:
                                          double.parse(amountController.text),
                                      type: dropdownwalletNameValue,
                                      status: false,
                                      date: DateTime.now());
                                  var withdrawal = await withdrawalController
                                      .withdrawal(user);
                                  print(withdrawal);
                                  Get.offAll(() => Root());
                                  setState(() {
                                    isLoading = false;
                                  });
                                } else {
                                  Get.snackbar("error", "Insufficient balance",
                                      snackPosition: SnackPosition.TOP);
                                }
                              }
                              setState(() {
                                isLoading = false;
                              });
                            },
                            child: Container(
                              width: 80,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Center(
                                child: Text(
                                  isLoading == true ? 'Loading...' : "Submit",
                                  style: TextStyle(
                                      color: Color.fromRGBO(28, 34, 55, 1),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                        ],
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
                            "Cashout History",
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
                                        "AMOUNT",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      Text(
                                        "WALLET ADDRESS               ",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      Text(
                                        "TYPE           ",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      Text(
                                        "STATUS        ",
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
                                itemCount:
                                    withdrawalController.withdrawals.length,
                                itemBuilder: (context, index) {
                                  Timestamp timestamp = withdrawalController
                                      .withdrawals[index]["date"];
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
                                              "${withdrawalController.withdrawals[index]["amount"]}",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              "${withdrawalController.withdrawals[index]["walletAddress"]}",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              withdrawalController.withdrawals[
                                                          index]["type"] ==
                                                      "Bitcoin"
                                                  ? "${withdrawalController.withdrawals[index]["type"]}   "
                                                  : "${withdrawalController.withdrawals[index]["type"]}",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              withdrawalController.withdrawals[
                                                          index]["status"] ==
                                                      false
                                                  ? "Pending"
                                                  : "Approved",
                                              style: TextStyle(
                                                  color: Colors.white),
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
