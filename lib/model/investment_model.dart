import 'package:cloud_firestore/cloud_firestore.dart';

class InvestmentModel {
  String? userName;
  String? firstName;
  String? lastName;
  String? email;
  String? plan;
  double? deposit;
  double? dailyPercentage;
  double? profit;
  bool? status;
  DateTime? date;

  InvestmentModel(
      {
      this.userName,
      this.firstName,
      this.lastName,
      this.email,
      this.plan,
      this.deposit,
      this.dailyPercentage,
      this.profit,
      this.status,
      this.date});

  InvestmentModel.fromDocumentSnapshot({DocumentSnapshot<Map<String, dynamic>>? doc}) {
    userName = doc!.data()!["userName"];
    firstName = doc.data()!["firstName"];
    lastName = doc.data()!["lastName"];
    email = doc.data()!["email"];
    plan = doc.data()!["plan"];
    deposit = doc.data()!["deposit"];
    dailyPercentage = doc.data()!["dailyPercentage"];
    profit = doc.data()!["profit"];
    status = doc.data()!["status"];
    date = doc.data()!["date"];
  }
}
