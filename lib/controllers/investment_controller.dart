import 'dart:async';

import 'package:blockvault_investment_flutter/model/investment_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:blockvault_investment_flutter/database/database.dart';
import 'package:blockvault_investment_flutter/model/deposit_model.dart';
import 'package:get/get.dart';

class InvestmentController extends GetxController {
  DataBase dataBase = DataBase();
  var investment = [].obs;
  InvestmentModel investmentModel = InvestmentModel();
  var isLoading = true.obs;

  @override
  void onInit() async {
    super.onInit();
    await getInvestment();
  }

  Future<bool> investments(InvestmentModel investmentModel) async {
    return await dataBase.createInvestment(investmentModel);
  }

  Future<void> getInvestment() async {
    try {
      isLoading(true);
      investment.clear();
      print("pass");
      var result = await dataBase.getInvestment();
      if (result.isNotEmpty) {
        investment.assignAll(result);
        print(investment.length);
      }
    } finally {
      isLoading(false);
    }
  }
}