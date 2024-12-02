import 'package:fetch_five/app/utilities/responsive_class.dart';
import 'package:fetch_five/app/widget/c_button.dart';
import 'package:fetch_five/app/widget/c_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios_sharp,
              color: Colors.white,
            ),
          ),
          title: Text(
            'Reset Password',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              Gap(50.h),
              Text(
                'Lost your way? ',
                style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Gap(10.h),
              Text(
                textAlign: TextAlign.center,
                "Enter your email, and we'll help you get back into the game!",
                style: TextStyle(fontSize: 16.sp, color: Colors.white),
              ),
              Gap(80.h),
              CustomTextFormField(
                controller: TextEditingController(),
                hintText: 'Enter Email Address',
                icon: 'assets/icons/message.svg',
              ),
              Gap(50.h),
              CustomButton(
                child: Text(
                  'Send Me rest Instructions',
                  style: TextStyle(fontSize: 16.sp, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
      desktop: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        body: Center(
          child: SizedBox(
            width: 428,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_sharp,
                          color: Colors.white,
                        ),
                      ),
                      Gap(80),
                      Text(
                        'Reset Password',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Gap(50),
                  Text(
                    'Lost your way? ',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Gap(10),
                  Text(
                    textAlign: TextAlign.center,
                    "Enter your email, and we'll help you get back into the game!",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  Gap(80),
                  CustomTextFormFieldDesktop(
                    controller: TextEditingController(),
                    hintText: 'Enter Email Address',
                    icon: 'assets/icons/message.svg',
                  ),
                  Gap(50),
                  CustomButtonDesktop(
                    child: Text(
                      'Send Me rest Instructions',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
