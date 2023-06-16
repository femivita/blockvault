import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:blockvault_investment_flutter/database/database.dart';
import 'package:blockvault_investment_flutter/model/deposit_model.dart';
import 'package:get/get.dart';

class DepositController extends GetxController {
  DataBase dataBase = DataBase();
  var deposits = [].obs;
  DepositModel depositModel = DepositModel();
  var isLoading = true.obs;

  @override
  void onInit() async {
    super.onInit();
    await getDeposit();
  }

  Future<bool> deposit(DepositModel depositModel) async {
    return await dataBase.createDeposit(depositModel);
  }

  Future<void> getDeposit() async {
    try {
      isLoading(true);
      deposits.clear();
      print("pass");
      var result = await dataBase.getDeposit();
      if (result.isNotEmpty) {
        deposits.assignAll(result);
        print(deposits.length);
      }
    } finally {
      isLoading(false);
    }
  }
}
