import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tickett/controller/Date&TimeController.dart';
import 'package:tickett/controller/SeatController.dart';

import '../../model/MainModel.dart';

SeatController seatController = Get.put(SeatController());

class Buy extends StatelessWidget {
  final ProductModel item;
  Buy({required this.item, Key? key}) : super(key: key);
  Date_TimeController date_timeController = Get.put(Date_TimeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 239, 238, 238),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Color.fromARGB(255, 239, 238, 238),
        elevation: 0,
        title: Text(
          item.name!,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 1.h,
            ),
            Container(
              height: 10.h,
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: date_timeController.date.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(left: 3.w),
                      child: InkWell(
                        onTap: () {
                          date_timeController.DateIndex.value = index;
                          print('The value of index is ${index}');
                        },
                        child: Obx(
                          () => Container(
                            height: 4.5.h,
                            width: 15.w,
                            decoration: BoxDecoration(
                              color:
                                  date_timeController.DateIndex.value == index
                                      ? Colors.amber
                                      : Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  date_timeController.date[index].Days!,
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  date_timeController.date[index].Date
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),

            //time
            SizedBox(
              height: 3.h,
            ),
            Container(
              height: 4.5.h,
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: date_timeController.time.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(left: 3.w),
                      child: InkWell(
                        onTap: () {
                          date_timeController.TimeIndex.value = index;
                        },
                        child: Obx(
                          () => Container(
                            height: 2.h,
                            width: 25.w,
                            decoration: BoxDecoration(
                              color:
                                  date_timeController.TimeIndex.value == index
                                      ? Colors.amber
                                      : Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                date_timeController.time[index].Time!,
                                style: TextStyle(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),

            // seats
            Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(
                  3,
                  2,
                  0.0012,
                )
                ..rotateX(55 / 180 * pi),
              child: Container(
                height: 28.h,
                width: 80.w,
                child: Image(
                  image: CachedNetworkImageProvider(item.image!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              // height: 37.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Obx(
                  () => GridView.builder(
                    // physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 8,
                    ),
                    itemCount: seatController.seatList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: InkWell(
                            onTap: () {
                              seatController.indexx.value = index;
                              if (seatController.indexx.value == index) {
                                seatController.val.value = true;
                                seatController
                                        .seatList[index].isSelected.value =
                                    !seatController
                                        .seatList[index].isSelected.value;
                              }

                              print('The value of Index is ${index}');
                              print('The Value is ${seatController.val}');
                            },
                            child: Obx(
                              () => Container(
                                color:
                                    seatController.seatList[index].isSelected ==
                                            true
                                        ? Colors.amber
                                        : Colors.white,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),

            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              color: Colors.amber,
              onPressed: () {},
              child: Padding(
                padding: EdgeInsets.fromLTRB(4.w, 2.h, 4.w, 2.h),
                child: Text(
                  'Pay ${item.price}',
                  style:
                      TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w700),
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
          ],
        ),
      ),
    );
  }
}
