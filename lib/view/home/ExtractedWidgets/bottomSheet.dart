import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tickett/controller/bottomsheetController.dart';
import 'package:tickett/controller/homeController.dart';

import '../../../model/MainModel.dart';

class BottomSheett extends StatelessWidget {
  final ProductModel item;
  BottomSheett({
    required this.item,
    Key? key,
  }) : super(key: key);
  BottomSheetController bottomSheetController =
      Get.put(BottomSheetController());

  Homecontroller homecontroller = Get.put(Homecontroller());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Get.bottomSheet(
          Container(
              height: 45.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 2.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.w),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          } else {
                            return null;
                          }
                        },
                        controller: bottomSheetController.comentController,
                        decoration: InputDecoration(
                          hintText: 'Add comment',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                    ),
                    TextButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await bottomSheetController.AddButton(item);
                          }
                        },
                        child: Text('Add Comment')),
                    Expanded(
                        child: Obx(
                      () => ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount:
                              bottomSheetController.bottomSheetList.length,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30)),
                              child: Column(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: 1.h, left: 4.w),
                                    child: Row(
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 2.w,
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.grey,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12)),
                                              child: Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    2.w, 1.w, 2.w, 1.w),
                                                child: Text(
                                                  bottomSheetController
                                                      .bottomSheetList[index]
                                                      .comment!,
                                                  style: TextStyle(
                                                      fontSize: 20.sp,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ))
                  ],
                ),
              )),
        );
      },
      child: Obx(
        () => Text('Comments : ${bottomSheetController.bottomSheetList.length}',
            style: GoogleFonts.secularOne(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 19.sp)),
      ),
    );
  }
}
