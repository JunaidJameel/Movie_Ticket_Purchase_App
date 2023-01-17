import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tickett/controller/homeController.dart';

class ProfilePicDisplay extends StatefulWidget {
  const ProfilePicDisplay({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfilePicDisplay> createState() => _ProfilePicDisplayState();
}

class _ProfilePicDisplayState extends State<ProfilePicDisplay> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetImg();
  }

  File? imageXFile;
  Homecontroller homecontroller = Get.put(Homecontroller());
  Future GetImg() async {
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then(
      (snapshot) async {
        if (snapshot.exists) {
          setState(() {
            homecontroller.img = snapshot.data()!['image'];
            homecontroller.Email = snapshot.data()!['email'];
            homecontroller.name = snapshot.data()!['name'];
          });
        }
      },
    );
    print('profile picture has been dected');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
        backgroundColor: Colors.grey,
        radius: 30,
        //
        backgroundImage: homecontroller.img! == ''
            ? NetworkImage(
                'https://cdn.iconscout.com/icon/free/png-128/user-1556-528036.png',
              )
            : NetworkImage(homecontroller.img!),
      ),
    );
  }
}
