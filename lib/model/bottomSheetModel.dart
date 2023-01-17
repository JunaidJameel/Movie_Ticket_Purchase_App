import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BottomSheetModel {
  static const Comment = 'comment';

  String? comment;

  BottomSheetModel({
    this.comment,
  });

  BottomSheetModel.fromMap(DocumentSnapshot data) {
    comment = data['comment'];
  }
}
