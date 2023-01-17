import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';
import 'package:tickett/model/bottomSheetModel.dart';

class BottomSheetController extends GetxController {
  RxList<BottomSheetModel> bottomSheetList = <BottomSheetModel>[].obs;
  TextEditingController comentController = TextEditingController();
  void onReady() {
    // TODO: implement onReady
    super.onReady();

    print("Length of BottomSheet List ${bottomSheetList.length}");
  }

  Future<void> getComment(id) async {
    bottomSheetList.bindStream(getSheetList(id));
  }

  Future AddButton(item) async {
    await await FirebaseFirestore.instance
        .collection('product')
        .doc(item.id)
        .collection('comment')
        .add({
      "comment": comentController.text,
    });
    comentController.clear();
  }
}

Stream<List<BottomSheetModel>> getSheetList(id) {
  //  print("enter in all product stream funtion");
  return FirebaseFirestore.instance
      .collection('product')
      .doc(id)
      .collection(
        'comment',
      )
      .snapshots()
      .map((QuerySnapshot query) {
    List<BottomSheetModel> retVal = [];

    for (var element in query.docs) {
      retVal.add(BottomSheetModel.fromMap(element));
    }

    print('Length of BottomSheet List ${retVal.length}');
    return retVal;
  });
}
