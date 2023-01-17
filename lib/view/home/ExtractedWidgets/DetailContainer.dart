import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:tickett/controller/homeController.dart';
import 'package:tickett/view/home/Buy.dart';
import 'package:tickett/view/home/ExtractedWidgets/bottomSheet.dart';

import '../../../model/MainModel.dart';

class DetailContainer extends StatelessWidget {
  DetailContainer({
    Key? key,
    required this.item,
  }) : super(key: key);

  final ProductModel item;

  Homecontroller homecontroller = Get.put(Homecontroller());
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        color: Colors.white,
      ),
      height: 90.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 38.w, top: 1.h),
            child: Row(
              children: [
                Text(
                  item.name!,
                  style:
                      TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  ' 8.0',
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.amber),
                ),
                SizedBox(
                  width: 6.w,
                ),
              ],
            ),
          ),
          //
          Padding(
            padding: EdgeInsets.only(left: 38.w, top: 1.5.h),
            child: Row(
              children: [
                Container(
                  height: 2.5.h,
                  width: 8.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(color: Colors.teal),
                  ),
                  child: Center(
                    child: Text(
                      '3D',
                      style: TextStyle(color: Colors.teal),
                    ),
                  ),
                ),
                SizedBox(
                  width: 2.w,
                ),
                Container(
                  height: 2.5.h,
                  width: 12.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(color: Colors.amber),
                  ),
                  child: Center(
                    child: Text(
                      'IMAX',
                      style: TextStyle(color: Colors.amber),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 1.5.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 38.w,
              ),
              Text(
                'Direction Nates',
                style: TextStyle(fontSize: 18.sp),
              )
            ],
          ),
          SizedBox(
            height: 1.5.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 38.w,
              ),
              Text(
                'Starring: Eddie / Therine',
                style: TextStyle(fontSize: 18.sp),
              )
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 4.w,
              ),
              Text(
                'Introduction',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w900),
              ),
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 4.w,
            ),
            child: Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry. when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
              style: TextStyle(
                  fontSize: 19.sp,
                  color: Color.fromARGB(255, 156, 156, 156),
                  wordSpacing: 1),
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                color: Color.fromARGB(255, 212, 212, 212),
                onPressed: () {},
                child: Padding(
                  padding: EdgeInsets.fromLTRB(5.w, 2.h, 5.w, 2.h),
                  child: Text(
                    'Collect',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 19.sp,
                        color: Color.fromARGB(255, 103, 103, 103)),
                  ),
                ),
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                color: Colors.amber,
                onPressed: () {
                  Get.to(() => Buy(
                        item: item,
                      ));
                },
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15.w, 2.h, 15.w, 2.h),
                  child: Text(
                    'Buy now',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 19.sp),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 4.w,
              ),
              Text(
                'Actor',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w900),
              ),
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          //Actor Images from firebase.
          Container(
            margin: EdgeInsets.only(left: 1.5.h),
            height: 10.h,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: item.actor!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(left: 3.w),
                    child: CircleAvatar(
                      backgroundColor: Colors.amber,
                      backgroundImage:
                          CachedNetworkImageProvider(item.actor![index]),
                      radius: 4.5.h,
                    ),
                  );
                }),
          ),

          // Padding(
          //   padding: EdgeInsets.only(top: 1.h),
          //   child: Container(
          //     height: 8.6.h,
          //     decoration: BoxDecoration(
          //         color: Colors.white,
          //         borderRadius: BorderRadius.only(
          //             topLeft: Radius.circular(20),
          //             topRight: Radius.circular(20)),
          //         boxShadow: [
          //           BoxShadow(blurRadius: 12, color: Colors.grey),
          //         ]),
          //     child: Padding(
          //       padding: EdgeInsets.only(top: 1.h),
          //       child: Column(
          //         children: [
          //           Container(
          //             height: 1.h,
          //             width: 15.w,
          //             decoration: BoxDecoration(
          //                 color: Colors.grey,
          //                 borderRadius: BorderRadius.circular(12)),
          //           ),
          //           // Row(
          //           //   children: [
          //           //     SizedBox(
          //           //       width: 5.w,
          //           //     ),

          //           //     //Extracted Widget bottom Sheet
          //           //     BottomSheett(
          //           //       item: item,
          //           //     ),
          //           //   ],
          //           // ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
