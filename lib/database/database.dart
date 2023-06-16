import 'package:blockvault_investment_flutter/model/deposit_model.dart';
import 'package:blockvault_investment_flutter/model/investment_model.dart';
import 'package:blockvault_investment_flutter/model/support_model.dart';
import 'package:blockvault_investment_flutter/model/user.dart';
import 'package:blockvault_investment_flutter/model/withdrawal_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:collection/collection.dart';

class DataBase {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  var firebaseUser = FirebaseAuth.instance.currentUser;

  Future<bool> createNewUser(UserModel userModel) async {
    try {
      await firebaseFirestore.collection("users").doc(userModel.email).set({
        "userName": userModel.userName,
        "email": userModel.email,
        "firstName": userModel.firstName,
        "lastName": userModel.lastName,
        "imageUrl": "",
        "walletBalance": 0,
        "availableBalance": 0,
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<UserModel> getUser() async {
    try {
      DocumentSnapshot doc = await firebaseFirestore
          .collection("users")
          .doc(firebaseUser!.email)
          .get();
      return UserModel.fromDocumentSnapshot(doc: doc);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> createDeposit(DepositModel depositModel) async {
    try {
      var user = await firebaseFirestore
          .collection("users")
          .doc(firebaseUser!.email)
          .get();
      var doc = await firebaseFirestore
          .collection("deposit")
          .doc(firebaseUser!.email)
          .get();
      print(firebaseUser!.email);
      print(doc.data());
      if (doc.data() != null) {
        if (doc.data()!['deposit'] != null ||
            doc.data()!['withdrawal'] != null ||
            doc.data()!['support'] != null) {
          print("object");
          await firebaseFirestore
              .collection("deposit")
              .doc(firebaseUser!.email)
              .set({
            "deposit": FieldValue.arrayUnion([
              {
                "userName": user['userName'],
                "email": firebaseUser!.email,
                "firstName": user['firstName'],
                "lastName": user['lastName'],
                "transactionId": depositModel.transactionId,
                "amount": depositModel.amount,
                "method": depositModel.method,
                "imageUrl": depositModel.imageUrl,
                "status": depositModel.status,
                "date": depositModel.date
              }
            ])
          }, SetOptions(merge: true));
          print("object");
        } else {
          print("object");
          await firebaseFirestore
              .collection("deposit")
              .doc(firebaseUser!.email)
              .set({
            "deposit": ([
              {
                "userName": user['userName'],
                "email": firebaseUser!.email,
                "firstName": user['firstName'],
                "lastName": user['lastName'],
                "transactionId": depositModel.transactionId,
                "amount": depositModel.amount,
                "method": depositModel.method,
                "imageUrl": depositModel.imageUrl,
                "status": depositModel.status,
                "date": depositModel.date
              }
            ])
          }, SetOptions(merge: true));
          print("object");
        }
      } else {
        print("object");
        await firebaseFirestore
            .collection("deposit")
            .doc(firebaseUser!.email)
            .set({
          "deposit": ([
            {
              "userName": user['userName'],
              "email": firebaseUser!.email,
              "firstName": user['firstName'],
              "lastName": user['lastName'],
              "transactionId": depositModel.transactionId,
              "amount": depositModel.amount,
              "method": depositModel.method,
              "imageUrl": depositModel.imageUrl,
              "status": depositModel.status,
              "date": depositModel.date
            }
          ])
        }, SetOptions(merge: true));
        print("object");
      }
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<List<dynamic>> getDeposit() async {
    var list = <DepositModel>[];
    var doc = await firebaseFirestore
        .collection("deposit")
        .doc(firebaseUser!.email)
        .get();
    if (doc.exists) {
      List deposits = await firebaseFirestore
          .collection("deposit")
          .doc(firebaseUser!.email)
          .get()
          .then((value) => value.data()!["deposit"]);
      print(deposits.length);
      return deposits;
    } else {
      return [];
    }
  }

  Future<bool> createWithdrawal(WithdrawalModel withdrawalModel) async {
    try {
      var user = await firebaseFirestore
          .collection("users")
          .doc(firebaseUser!.email)
          .get();
      var doc = await firebaseFirestore
          .collection("withdrawal")
          .doc(firebaseUser!.email)
          .get();
      print(firebaseUser!.email);
      print(doc.data());
      if (doc.data() != null) {
        if (doc.data()!['deposit'] != null ||
            doc.data()!['support'] != null ||
            doc.data()!['withdrawal'] != null) {
          print("object");
          await firebaseFirestore
              .collection("withdrawal")
              .doc(firebaseUser!.email)
              .update({
            "withdrawal": FieldValue.arrayUnion([
              {
                "userName": user['userName'],
                "email": firebaseUser!.email,
                "firstName": user['firstName'],
                "lastName": user['lastName'],
                "walletAddress": withdrawalModel.walletAddress,
                "amount": withdrawalModel.amount,
                "type": withdrawalModel.type,
                "status": withdrawalModel.status,
                "date": withdrawalModel.date
              }
            ])
          });
          print("object");
        } else {
          print("object");
          await firebaseFirestore
              .collection("withdrawal")
              .doc(firebaseUser!.email)
              .set({
            "withdrawal": FieldValue.arrayUnion([
              {
                "userName": user['userName'],
                "email": firebaseUser!.email,
                "firstName": user['firstName'],
                "lastName": user['lastName'],
                "walletAddress": withdrawalModel.walletAddress,
                "amount": withdrawalModel.amount,
                "type": withdrawalModel.type,
                "status": withdrawalModel.status,
                "date": withdrawalModel.date
              }
            ])
          });
          print("object");
        }
      } else {
        print("object");
        await firebaseFirestore
            .collection("withdrawal")
            .doc(firebaseUser!.email)
            .set({
          "withdrawal": FieldValue.arrayUnion([
            {
              "userName": user['userName'],
              "email": firebaseUser!.email,
              "firstName": user['firstName'],
              "lastName": user['lastName'],
              "walletAddress": withdrawalModel.walletAddress,
              "amount": withdrawalModel.amount,
              "type": withdrawalModel.type,
              "status": withdrawalModel.status,
              "date": withdrawalModel.date
            }
          ])
        });
        print("object");
      }
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<List<dynamic>> getWithdrawal() async {
    var list = <WithdrawalModel>[];
    var doc = await firebaseFirestore
        .collection("withdrawal")
        .doc(firebaseUser!.email)
        .get();
    if (doc.exists) {
      List withdrawals = await firebaseFirestore
          .collection("withdrawal")
          .doc(firebaseUser!.email)
          .get()
          .then((value) => value.data()!["withdrawal"]);
      print(withdrawals.length);
      return withdrawals;
    } else {
      return [];
    }
  }

  Future<bool> changeStatusWithdrawal(String email, index) async {
    var doc = await firebaseFirestore.collection("withdrawal");
    await firebaseFirestore
        .collection("withdrawal")
        .doc(email)
        .get()
        .then((value) {
      var objects = value.data()!['withdrawal'];
      var objectToUpdate = objects[index];
      firebaseFirestore.collection("withdrawal").doc(email).update({
        "withdrawal": FieldValue.arrayRemove([objects[index]])
      });
      objectToUpdate['status'] = true;
      objects[index] = objectToUpdate;

      firebaseFirestore.collection("withdrawal").doc(email).update({
        "withdrawal": FieldValue.arrayUnion([objects[index]])
      });
      subtractBalance(email, objectToUpdate['amount']);
    });
    return true;
  }

  Future<bool> changeStatusDeposit(String email, index) async {
    var doc = await firebaseFirestore.collection("deposit").doc(email).get();
    var user = await firebaseFirestore.collection("users").doc(email).get();
    await firebaseFirestore
        .collection("deposit")
        .doc(email)
        .get()
        .then((value) {
      var objects = value.data()!['deposit'];
      var objectToUpdate = objects[index];
      firebaseFirestore.collection("deposit").doc(email).update({
        "deposit": FieldValue.arrayRemove([objects[index]])
      });
      objectToUpdate['status'] = true;
      objects[index] = objectToUpdate;

      firebaseFirestore.collection("deposit").doc(email).update({
        "deposit": FieldValue.arrayUnion([objects[index]])
      });
      addBalance(email, objectToUpdate['amount']);
    });
    return true;
  }

  Future<bool> addBalance(String email, int amount) async {
    var user = await firebaseFirestore.collection("users").doc(email).get();
    firebaseFirestore.collection("users").doc(email).update({
      "walletBalance": user['walletBalance'] + amount,
    });
    return true;
  }

  Future<bool> addProfitBalance(String email, int amount) async {
    var user = await firebaseFirestore.collection("users").doc(email).get();
    firebaseFirestore.collection("users").doc(email).update({
      "walletBalance": user['availableBalance'] + amount,
    });
    return true;
  }

  Future<bool> substractProfitBalance(String email, int amount) async {
    var user = await firebaseFirestore.collection("users").doc(email).get();
    firebaseFirestore.collection("users").doc(email).update({
      "walletBalance": user['availableBalance'] - amount,
    });
    return true;
  }

  Future<bool> subtractBalance(String email, amount) async {
    var user = await firebaseFirestore.collection("users").doc(email).get();
    firebaseFirestore.collection("users").doc(email).update({
      "walletBalance": user['walletBalance'] - amount,
    });
    return true;
  }

  Future<bool> createSupport(SupportModel supportModel) async {
    try {
      var doc = await firebaseFirestore
          .collection("support")
          .doc(firebaseUser!.email)
          .get();
      print(firebaseUser!.email);
      print(doc.data());
      if (doc.data() != null) {
        if (doc.data()!['deposit'] != null ||
            doc.data()!['support'] != null ||
            doc.data()!['withdrawal'] != null) {
          print("object");
          await firebaseFirestore
              .collection("support")
              .doc(firebaseUser!.email)
              .update({
            "support": FieldValue.arrayUnion([
              {
                "subject": supportModel.subject,
                "priority": supportModel.priority,
                "details": supportModel.details,
              }
            ])
          });
          print("object");
        } else {
          print("object");
          await firebaseFirestore
              .collection("support")
              .doc(firebaseUser!.email)
              .set({
            "support": FieldValue.arrayUnion([
              {
                "subject": supportModel.subject,
                "priority": supportModel.priority,
                "details": supportModel.details,
              }
            ])
          });
          print("object");
        }
      } else {
        print("object");
        await firebaseFirestore
            .collection("support")
            .doc(firebaseUser!.email)
            .set({
          "support": FieldValue.arrayUnion([
            {
              "subject": supportModel.subject,
              "priority": supportModel.priority,
              "details": supportModel.details,
            }
          ])
        });
        print("object");
      }
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<bool> createInvestment(InvestmentModel investmentModel) async {
    try {
      var user = await firebaseFirestore
          .collection("users")
          .doc(firebaseUser!.email)
          .get();
      var doc = await firebaseFirestore
          .collection("investment")
          .doc(firebaseUser!.email)
          .get();
      print(firebaseUser!.email);
      print(doc.data());
      if (doc.data() != null) {
        if (doc.data()!['plan'] != null ||
            doc.data()!['deposit'] != null ||
            doc.data()!['dailyPercentage'] != null ||
            doc.data()!['deposit'] != null ||
            doc.data()!['profit'] != null ||
            doc.data()!['status'] != null ||
            doc.data()!['date'] != null) {
          print("object");
          await firebaseFirestore
              .collection("investment")
              .doc(firebaseUser!.email)
              .update({
            "investment": FieldValue.arrayUnion([
              {
                "userName": user['userName'],
                "email": firebaseUser!.email,
                "firstName": user['firstName'],
                "lastName": user['lastName'],
                "plan": investmentModel.plan,
                "deposit": investmentModel.deposit,
                "dailyPercentage": investmentModel.dailyPercentage,
                "profit": investmentModel.profit,
                "status": investmentModel.status,
                "date": investmentModel.date,
              }
            ])
          });
          subtractBalance(firebaseUser!.email!, investmentModel.deposit);
          print("object");
        } else {
          print("object");
          await firebaseFirestore
              .collection("investment")
              .doc(firebaseUser!.email)
              .set({
            "investment": FieldValue.arrayUnion([
              {
                "userName": user['userName'],
                "email": firebaseUser!.email,
                "firstName": user['firstName'],
                "lastName": user['lastName'],
                "plan": investmentModel.plan,
                "deposit": investmentModel.deposit,
                "dailyPercentage": investmentModel.dailyPercentage,
                "profit": investmentModel.profit,
                "status": investmentModel.status,
                "date": investmentModel.date,
              }
            ])
          });
          subtractBalance(firebaseUser!.email!, investmentModel.deposit);
          print("object");
        }
      } else {
        print("object");
        await firebaseFirestore
            .collection("investment")
            .doc(firebaseUser!.email)
            .set({
          "investment": FieldValue.arrayUnion([
            {
              "userName": user['userName'],
              "email": firebaseUser!.email,
              "firstName": user['firstName'],
              "lastName": user['lastName'],
              "plan": investmentModel.plan,
              "deposit": investmentModel.deposit,
              "dailyPercentage": investmentModel.dailyPercentage,
              "profit": investmentModel.profit,
              "status": investmentModel.status,
              "date": investmentModel.date,
            }
          ])
        });
        subtractBalance(firebaseUser!.email!, investmentModel.deposit);
        print("object");
      }
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<List<dynamic>> getInvestment() async {
    var list = <InvestmentModel>[];
    var doc = await firebaseFirestore
        .collection("investment")
        .doc(firebaseUser!.email)
        .get();
    if (doc.exists) {
      List investment = await firebaseFirestore
          .collection("users")
          .doc(firebaseUser!.email)
          .get()
          .then((value) => value.data()!["investment"]);
      print(investment.length);
      return investment;
    } else {
      return [];
    }
  }
}
