import 'package:blockvault_investment_flutter/database/database.dart';
import 'package:blockvault_investment_flutter/model/withdrawal_model.dart';
import 'package:get/get.dart';

class WithdrawalController extends GetxController {
  DataBase dataBase = DataBase();
  var withdrawals = [].obs;
  WithdrawalModel withdrawalModel = WithdrawalModel();
  var isLoading = true.obs;

  @override
  void onInit() async {
    super.onInit();
    await getWithdrawal();
  }

  Future<bool> withdrawal(WithdrawalModel withdrawalModel) async {
    return await dataBase.createWithdrawal(withdrawalModel);
  }

  Future<void> getWithdrawal() async {
    try {
      isLoading(true);
      withdrawals.clear();
      print("pass");
      var result = await dataBase.getWithdrawal();
      if (result.isNotEmpty) {
        withdrawals.assignAll(result);
        print(withdrawals.length);
      }
    } finally {
      isLoading(false);
    }
  }
}