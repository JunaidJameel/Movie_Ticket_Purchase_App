import 'dart:async';

import 'package:flutter/material.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:get/get.dart';
import '../home/home.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void finish() {
    Get.off(Home());
  }

  void initState() {
    super.initState();

    Timer(Duration(seconds: 1), () => Get.off(Home()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff46a392),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'images/splash.png',
              height: 50.sp,
              // height: 10.sp,
            ),
          ),
        ],
      ),
    );
  }
}
