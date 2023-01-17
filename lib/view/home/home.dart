import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tickett/controller/bottomsheetController.dart';
import 'package:tickett/controller/homeController.dart';
import 'package:tickett/controller/loginController.dart';
import 'package:tickett/model/MainModel.dart';

import 'package:tickett/view/home/ProfilePisDisplay.dart';

import 'package:tickett/view/home/detailScreen.dart';
import 'package:tickett/view/login/login.dart';
import 'package:tickett/view/login/profilePic.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final LoginController loginController = Get.put(LoginController());
  final Homecontroller homeController = Get.find();

  final BottomSheetController bottomSheetController =
      Get.put(BottomSheetController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 234, 234, 234),
        toolbarHeight: 70.2,
        title: Text(
          'MOVIES',
          style: GoogleFonts.josefinSans(
              fontSize: 22.sp,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
              color: Colors.black),
        ),
        actions: [
          // CachedNetworkImage),

          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut().then((value) {
                Get.off(Login());
              });
            },
            icon: Icon(Icons.logout),
            color: Colors.black,
          )
        ],
      ),
      backgroundColor: Color.fromARGB(255, 234, 234, 234),
      body: SafeArea(
        child: Column(children: [
          SizedBox(
            height: 1.h,
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 4.5.w),
                child: Text(
                  'Now Popular',
                  style:
                      TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Obx(
                () => ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: homeController.Product.length,
                  itemBuilder: (context, index) {
                    final item = homeController.Product[index];
                    return Padding(
                        padding: EdgeInsets.only(top: 1.h),
                        child: Stack(children: [
                          Container(
                            height: 22.h,
                            // color: Colors.amber,
                            // child: Image.asset(),
                          ),
                          Positioned(
                            left: 1.w,
                            top: 5.h,
                            child: InkWell(
                              onTap: () async {
                                await bottomSheetController.getComment(item.id);
                                Get.to(DetailScreen(
                                  item: item,
                                ));
                              },
                              child: Container(
                                height: 16.5.h,
                                width: 90.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 32.w, top: 1.h),
                                      child: Row(
                                        children: [
                                          Text(
                                            homeController.Product[index].name!,
                                            style: TextStyle(
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Spacer(),
                                          Text(
                                            '8.0',
                                            style: TextStyle(
                                                color: Colors.amber,
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 32.w, top: 1.h),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 2.5.h,
                                            width: 8.w,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                              border: Border.all(
                                                  color: Colors.teal),
                                            ),
                                            child: Center(
                                              child: Text(
                                                '3D',
                                                style: TextStyle(
                                                    color: Colors.teal),
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
                                                borderRadius:
                                                    BorderRadius.circular(7),
                                                border: Border.all(
                                                    color: Colors.amber)),
                                            child: Center(
                                              child: Text(
                                                'IMAX',
                                                style: TextStyle(
                                                    color: Colors.amber),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 32.w, top: 1.h),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Director: Nates',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 32.w, top: 1.h),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Starring: Eddie / Therine',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 5.w,
                            top: 2.h,
                            child: InkWell(
                              onTap: () {
                                Get.to(DetailScreen(
                                  item: item,
                                ));
                              },
                              child: Container(
                                height: 17.h,
                                width: 23.5.w,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 213, 213, 213),
                                    borderRadius: BorderRadius.circular(12)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  // child: Image.network(
                                  //   homeController.Product[index].image!,
                                  //   fit: BoxFit.cover,
                                  // ),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        homeController.Product[index].image!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ]));
                  },
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
