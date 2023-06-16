import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  String? userName;
  String? firstName;
  String? lastName;
  String? email;
  String? imageUrl;
  int? walletBalance;
  int? availableBalance;

  UserModel(
      {this.id,
      this.userName,
      this.firstName,
      this.lastName,
      this.email,
      this.imageUrl,
      this.walletBalance,
      this.availableBalance});

  UserModel.fromDocumentSnapshot({DocumentSnapshot? doc}) {
    id = doc!.id;
    userName = doc["userName"];
    firstName = doc["firstName"];
    lastName = doc["lastName"];
    email = doc["email"];
    imageUrl = doc["imageUrl"];
    walletBalance = doc["walletBalance"];
    availableBalance = doc["availableBalance"];
  }
}
