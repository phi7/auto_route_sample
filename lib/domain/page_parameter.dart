import 'package:cloud_firestore/cloud_firestore.dart';

class PageParameter {
  PageParameter(DocumentSnapshot doc) {
    //this.id = doc.data()!['pid'];
    this.id = doc.id;
  }
  String? id;
}