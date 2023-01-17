import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tickett/model/seatModel.dart';

class SeatController extends GetxController {
  RxBool val = false.obs;
  RxInt indexx = 100.obs;

  RxList<SeatModel> seatList = <SeatModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    seat();
  }

  void seat() {
    for (int i = 0; i < 40; i++) {
      seatList.add(SeatModel(isSelected: false.obs));
    }
  }
}
