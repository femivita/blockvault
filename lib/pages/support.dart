import 'dart:typed_data';

import 'package:blockvault_investment_flutter/controllers/auth_controller.dart';
import 'package:blockvault_investment_flutter/controllers/deposit_controller.dart';
import 'package:blockvault_investment_flutter/controllers/support_controller.dart';
import 'package:blockvault_investment_flutter/controllers/user_controller.dart';
import 'package:blockvault_investment_flutter/dashboard.dart';
import 'package:blockvault_investment_flutter/database/database.dart';
import 'package:blockvault_investment_flutter/model/deposit_model.dart';
import 'package:blockvault_investment_flutter/model/support_model.dart';
import 'package:blockvault_investment_flutter/pages/authentication/widgets/scrolling_text.dart';
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

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  @override
  void initState() {
    Get.put(DepositController());
    super.initState();
  }

  String? dropdownGenderValue;
  TextEditingController subjectController = TextEditingController();
  TextEditingController detailsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final supportController = Get.put(SupportController());
    final ancestorScaffold = Scaffold.maybeOf(context);
    // 2. check if it has a drawer
    final hasDrawer = ancestorScaffold != null && ancestorScaffold.hasDrawer;
    showDataAlert() {
      showDialog(
          context: context,
          builder: (context) {
            return StatefulBuilder(builder: (context, setState) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      5.0,
                    ),
                  ),
                ),
                contentPadding: EdgeInsets.only(
                  top: 10.0,
                ),
                content: Container(
                  width: 450,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          "Subject",
                          style: TextStyle(
                              color: Colors.black,
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
                              hintText: "",
                              hintStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey),
                              filled: true,
                              fillColor: Colors.white),
                          controller: subjectController,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Priority",
                          style: TextStyle(
                              color: Colors.black,
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
                              color: Colors.black,
                            ),
                          ),
                          child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: dropdownGenderValue,
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_outlined,
                                    color: Colors.black,
                                  ),
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                  hint: Text(
                                    'Priority',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color:
                                            Color.fromRGBO(201, 201, 201, 1)),
                                  ),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownGenderValue = newValue!;
                                    });
                                  },
                                  items: <String>[
                                    'Low',
                                    'Mid',
                                    'High',
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color:
                                                Color.fromRGBO(39, 39, 39, 1)),
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
                          "Details",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          keyboardType: TextInputType.multiline,
                          minLines: 1, //Normal textInputField will be displayed
                          maxLines: 5,
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
                              hintText: "",
                              hintStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey),
                              filled: true,
                              fillColor: Colors.white),
                          controller: detailsController,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                var user = SupportModel(
                                  subject: subjectController.text,
                                  priority: dropdownGenderValue,
                                  details: detailsController.text,
                                );
                                var withdrawal =
                                    await supportController.support(user);
                                print(withdrawal);
                                Get.offAll(() => MainView());
                              },
                              child: Container(
                                width: 80,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Center(
                                  child: Text(
                                    "Submit",
                                    style: TextStyle(
                                        color: Colors.white,
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
                ),
              );
            });
          });
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          GetX<UserController>(
            initState: (usercontroller) async {
               Get.find<UserController>().user = await DataBase().getUser();
            },
            builder: (usercontroller) {
              return usercontroller.user.availableBalance != null ? Row(
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
              ) : Row(
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
            }
          )
        ],
        leading: hasDrawer
            ? IconButton(
                icon: Icon(Icons.menu),
                // 4. open the drawer if we have one
                onPressed:
                    hasDrawer ? () => ancestorScaffold.openDrawer() : null,
              )
            : null,
            iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.transparent,
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
                width: MediaQuery.of(context).size.width,
                height: 100,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(28, 34, 55, 1),
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Customer support",
                        style: TextStyle(
                            color: Color.fromRGBO(243, 156, 18, 1),
                            fontSize: 15,
                            fontWeight: FontWeight.w900),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          showDataAlert();
                        },
                        child: Container(
                          width: 150,
                          height: 30,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.blue,
                                  size: 15,
                                ),
                                Text(
                                  "Create request",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
