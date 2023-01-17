import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tickett/model/Date&TimeModel.dart';

class Date_TimeController extends GetxController {
  RxList<Date_TimeModel> date = <Date_TimeModel>[].obs;
  RxList<Date_TimeModel> time = <Date_TimeModel>[].obs;
  //
  RxInt DateIndex = 0.obs;
  RxInt TimeIndex = 1.obs;
  //
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    DateFun();
    TimeFun();
  }

  void DateFun() {
    var DateResult = [
      Date_TimeModel(Date: 16, Days: 'MON'),
      Date_TimeModel(Date: 17, Days: 'TUE'),
      Date_TimeModel(Date: 18, Days: 'WED'),
      Date_TimeModel(Date: 19, Days: 'THR'),
      Date_TimeModel(Date: 20, Days: 'FRI'),
      Date_TimeModel(Date: 21, Days: 'SAT'),
      Date_TimeModel(Date: 22, Days: 'SUN'),
    ];
    date.value = DateResult;
  }

  void TimeFun() {
    var TimeResult = [
      Date_TimeModel(Time: '09:30 AM'),
      Date_TimeModel(Time: '12:30 pM'),
      Date_TimeModel(Time: '03:30 pM'),
      Date_TimeModel(Time: '06:30 pM'),
    ];
    time.value = TimeResult;
  }
}
