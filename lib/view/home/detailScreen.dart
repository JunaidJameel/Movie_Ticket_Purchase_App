import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tickett/controller/bottomsheetController.dart';
import 'package:tickett/controller/homeController.dart';
import 'package:tickett/model/MainModel.dart';
import 'package:tickett/view/home/ExtractedWidgets/DetailContainer.dart';

class DetailScreen extends StatefulWidget {
  final ProductModel item;
  DetailScreen({required this.item, Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final Homecontroller homecontroller = Get.put(Homecontroller());
  final BottomSheetController bottomSheetController =
      Get.put(BottomSheetController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getComment();
  }

  void getComment() async {
    await bottomSheetController.getComment(widget.item.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            height: 33.h,
            color: Color.fromARGB(255, 10, 51, 41),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.h),
            child: DetailContainer(item: widget.item),
          ),
          Positioned(
            top: 9.h,
            left: 4.w,
            child: Container(
              height: 24.h,
              width: 30.w,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 218, 218, 218),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image(
                  image: CachedNetworkImageProvider(
                    widget.item.image!,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 4.w, top: 1.h),
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                height: 5.h,
                width: 9.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.teal),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
