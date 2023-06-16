import 'package:cloud_firestore/cloud_firestore.dart';

class DepositModel {
  String? userName;
  String? firstName;
  String? lastName;
  String? email;
  String? transactionId;
  double? amount;
  String? method;
  String? imageUrl;
  bool? status;
  DateTime? date;

  DepositModel(
      {
        this.userName,
      this.firstName,
      this.lastName,
      this.email,
      this.transactionId,
      this.amount,
      this.method,
      this.imageUrl,
      this.status,
      this.date});

  DepositModel.fromDocumentSnapshot({DocumentSnapshot<Map<String, dynamic>>? doc}) {
    userName = doc!.data()!["userName"];
    firstName = doc.data()!["firstName"];
    lastName = doc.data()!["lastName"];
    email = doc.data()!["email"];
    transactionId = doc.data()!["transactionId"];
    amount = doc.data()!["amount"];
    method = doc.data()!["method"];
    imageUrl = doc.data()!["imageUrl"];
    status = doc.data()!["status"];
    date = doc.data()!["date"];
  }
}
