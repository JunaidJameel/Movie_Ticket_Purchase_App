import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tickett/model/MainModel.dart';
import 'package:tickett/model/profileModel.dart';
import 'package:tickett/services/firebase_storage_services.dart';
import 'package:tickett/view/login/profilePic.dart';

class Homecontroller extends GetxController {
  // static Homecontroller instance = Get.find();

  RxList<ProductModel> Product = <ProductModel>[].obs;

  String? img = '';
  String? Email = '';
  String? name = '';
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    Product.bindStream(getAllProducts());

    print("Length ${Product.length}");
  }

  Stream<List<ProductModel>> getAllProducts() {
    //  print("enter in all product stream funtion");
    return FirebaseFirestore.instance
        .collection('product')
        .orderBy('likes', descending: false)
        .snapshots()
        .map((QuerySnapshot query) {
      List<ProductModel> retVal = [];

      for (var element in query.docs) {
        retVal.add(ProductModel.fromMap(element));
      }

      debugPrint('producr lenght is ${retVal.length}');
      return retVal;
    });
  }

  // profile img

}
