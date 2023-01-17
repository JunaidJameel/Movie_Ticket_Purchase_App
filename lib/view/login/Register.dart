import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tickett/controller/loginController.dart';
import 'package:tickett/view/home/home.dart';

class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);
  LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            Text(
              'Register your Account',
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: loginController.RegisterNameTextField,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter your Name';
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  hintText: 'Enter your Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
            //
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: loginController.RegisterEmailTextField,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter your Email';
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  hintText: 'Email',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
            //
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: loginController.RegisterPasswordTextField,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter your Password';
                  } else {
                    return null;
                  }
                },
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            MaterialButton(
              color: Colors.teal,
              onPressed: () {
                loginController.Register();
              },
              child: Text('Register'),
            )
          ],
        ),
      ),
    );
  }
}
