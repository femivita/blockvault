import 'package:cloud_firestore/cloud_firestore.dart';

class SupportModel {
  String? subject;
  String? priority;
  String? details;

  SupportModel({
    this.subject,
    this.priority,
    this.details,
  });

  SupportModel.fromDocumentSnapshot(
      {DocumentSnapshot<Map<String, dynamic>>? doc}) {
    subject = doc!.data()!["subject"];
    priority = doc.data()!["priority"];
    details = doc.data()!["details"];
  }
}
