import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileModel {
  String? profile;

  ProfileModel({
    this.profile,
  });
  ProfileModel.fromMap(DocumentSnapshot data) {
    profile = data['image'];
  }
}
