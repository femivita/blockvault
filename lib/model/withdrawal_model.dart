import 'package:cloud_firestore/cloud_firestore.dart';

class WithdrawalModel {
  String? userName;
  String? firstName;
  String? lastName;
  String? email;
  String? walletAddress;
  double? amount;
  String? type;
  bool? status;
  DateTime? date;

  WithdrawalModel(
      {
      this.userName,
      this.firstName,
      this.lastName,
      this.email,
      this.walletAddress,
      this.amount,
      this.type,
      this.status,
      this.date});

  WithdrawalModel.fromDocumentSnapshot({DocumentSnapshot<Map<String, dynamic>>? doc}) {
    userName = doc!.data()!["userName"];
    firstName = doc.data()!["firstName"];
    lastName = doc.data()!["lastName"];
    email = doc.data()!["email"];
    walletAddress = doc.data()!["walletAddress"];
    amount = doc.data()!["amount"];
    type = doc.data()!["type"];
    status = doc.data()!["status"];
    date = doc.data()!["date"];
  }
}