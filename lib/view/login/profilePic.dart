import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tickett/controller/homeController.dart';
import 'package:tickett/controller/loginController.dart';

import 'package:tickett/view/home/home.dart';
import 'package:tickett/view/login/login.dart';

class ProfilePic extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());
  final Homecontroller homecontroller = Get.put(Homecontroller());

  ProfilePic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Center(
                child: GetBuilder<LoginController>(
                    init: loginController,
                    builder: (con) {
                      return Card(
                          elevation: 20,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.w)),
                          child: GestureDetector(
                              onTap: () {
                                con.getImage(ImageSource.gallery);
                                print('Image has been recived');
                              },
                              child: con.selectedImagePath.path.isEmpty
                                  ? CircleAvatar(
                                      radius: 100,
                                      backgroundColor:
                                          Color.fromARGB(255, 210, 210, 210),
                                      backgroundImage: homecontroller.img! == ''
                                          ? NetworkImage(
                                              'https://cdn.iconscout.com/icon/free/png-128/user-1556-528036.png',
                                            )
                                          : NetworkImage(homecontroller.img!))
                                  : Container(
                                      height: 35.h,
                                      width: 64.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50.w)),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(50.w),
                                        child: Image.file(
                                          File(con.selectedImagePath.path),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    )));
                    })),
            SizedBox(
              height: 5.h,
            ),
            Text(
              'Add your Profile Picture',
              style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 8.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: () {
                    Get.to(Home());
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2.0),
                          side: BorderSide(color: Colors.black)),
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 2.h, horizontal: 8.w),
                    child: const Text(
                      "Skip",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                MaterialButton(
                  color: Colors.black,
                  onPressed: () async {
                    await loginController.saveitem();
                  },
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                    child: Text(
                      'Save',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
