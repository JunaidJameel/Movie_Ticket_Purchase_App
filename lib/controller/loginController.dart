import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tickett/services/firebase_storage_services.dart';
import 'package:tickett/view/home/home.dart';
import 'package:tickett/view/login/login.dart';
import 'package:tickett/view/login/profilePic.dart';

class LoginController extends GetxController {
  TextEditingController emailTextField = TextEditingController();
  TextEditingController passwordTextField = TextEditingController();
  TextEditingController RegisterEmailTextField = TextEditingController();
  TextEditingController RegisterPasswordTextField = TextEditingController();
  TextEditingController RegisterNameTextField = TextEditingController();
  //

  Future SignIn() async {
    Get.dialog(Center(
      child: CircularProgressIndicator(),
    ));
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: emailTextField.text.trim(),
        password: passwordTextField.text.trim(),
      )
          .then((value) {
        Get.to(Home());
        emailTextField.clear();
        passwordTextField.clear();
      });
    } catch (e) {
      Get.back();
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Color.fromARGB(255, 219, 219, 219),
      );
    }
  }

  Future Register() async {
    try {
      Get.dialog(Center(
        child: CircularProgressIndicator(),
      ));
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: RegisterEmailTextField.text.trim(),
              password: RegisterPasswordTextField.text.trim())
          .then((value) async {
        await FirebaseFirestore.instance
            .collection("users")
            .doc(value.user!.uid)
            .set({
          "name": RegisterNameTextField.text,
          "email": RegisterEmailTextField.text,
          "uid": value.user!.uid,
          "image": "",
          "cart": []
        }).then((value) {
          RegisterEmailTextField.clear();
          RegisterPasswordTextField.clear();
          RegisterNameTextField.clear();
        });
      });
    } catch (e) {
      Get.back();
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Color.fromARGB(255, 219, 219, 219),
      );
    }
  }

//
  File selectedImagePath = File('');

  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagePath = File(pickedFile.path);
      log('selected ${selectedImagePath.path}');
      update();
    } else {
      print('Image not Selected');
    }
  }

//
  Future<void> saveitem() async {
    try {
      Get.dialog(Center(
        child: CircularProgressIndicator(),
      ));
      final ref = FirebaseStorage.instance.ref().child('users');

      await ref.putFile(
        selectedImagePath,
      );
      final url = await ref.getDownloadURL();
      await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({
        "image": url,
      }).then((value) => Get.to(Home()));
    } catch (e) {
      print(e);

      Get.snackbar("Erorr", e.toString());
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
