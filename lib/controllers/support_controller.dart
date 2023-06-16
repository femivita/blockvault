import 'package:blockvault_investment_flutter/database/database.dart';
import 'package:blockvault_investment_flutter/model/support_model.dart';
import 'package:get/get.dart';

class SupportController extends GetxController {
  DataBase dataBase = DataBase();

  Future<bool> support(SupportModel supportModel) async {
    return await dataBase.createSupport(supportModel);
  }
}