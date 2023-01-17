import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tickett/controller/loginController.dart';
import 'package:tickett/view/login/Register.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 240, 240),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Ready to watch?',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.sp),
              ),
              SizedBox(
                height: 4.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: TextFormField(
                  controller: loginController.emailTextField,
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
              SizedBox(
                height: 5.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: TextFormField(
                  controller: loginController.passwordTextField,
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
                height: 1.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 56.w),
                child: TextButton(
                    onPressed: () {
                      Get.to(Register());
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                          fontSize: 18.sp,
                          color: Color.fromARGB(255, 107, 107, 107),
                          fontWeight: FontWeight.w700),
                    )),
              ),
              SizedBox(
                height: 3.h,
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                color: Colors.teal,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    loginController.SignIn();
                  }
                },
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 35.w, vertical: 4.w),
                  child: Text(
                    'Login',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 19.5.sp,
                        color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member?',
                    style: TextStyle(
                        color: Color.fromARGB(255, 43, 43, 43),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700),
                  ),
                  TextButton(
                      onPressed: () {
                        Get.to(Register());
                      },
                      child: Text(
                        'Register now',
                        style: TextStyle(fontSize: 18.sp),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
