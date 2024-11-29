import 'package:fetch_five/app/widget/c_button.dart';
import 'package:fetch_five/app/widget/c_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Form(
            // key: controller.formKey,
            child: Column(
              children: [
                Gap(69.h),
                Image.asset(
                  'assets/images/five_tile.png',
                ),
                Gap(42.h),
                Text(
                  'Create Account',
                  style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Gap(42.h),
                CustomTextFormField(
                  controller: TextEditingController(),
                  //controller: controller.emailController,
                  hintText: 'Enter user name',
                  icon: 'assets/icons/message.svg',
                  //validator: controller.validateEmail,
                ),
                Gap(5.h),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 9.w),
                  height: 24.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xffFF5050).withOpacity(0.25),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Center(
                    child: Text(
                      'Username: Maximum 8 characters allowed.',
                      style:
                          TextStyle(color: Color(0xffFF5050), fontSize: 10.sp),
                    ),
                  ),
                ),
                Gap(10.h),
                CustomTextFormField(
                  controller: TextEditingController(),
                  //controller: controller.emailController,
                  hintText: 'Email',
                  icon: 'assets/icons/message.svg',
                  //validator: controller.validateEmail,
                ),
                Gap(5.h),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 9.w),
                  height: 24.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xff04AA6D).withOpacity(0.25),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Center(
                    child: Text(
                      'Email will only be used for password recovery purposes.',
                      style:
                          TextStyle(color: Color(0xff04AA6D), fontSize: 10.sp),
                    ),
                  ),
                ),
                Gap(10.h),
                CustomTextFormField(
                  controller: TextEditingController(),
                  //controller: controller.passwordController,
                  hintText: 'Password',
                  icon: 'assets/icons/lock.svg',

                  // onSuffixIconTap: controller.togglePasswordVisibility,
                  // isObscured: controller.isObscured.value,
                  // validator: controller.validatePassword,
                ),
                Gap(10.h),
                CustomTextFormField(
                  controller: TextEditingController(),
                  //controller: controller.passwordController,
                  hintText: 'Confirm Password',
                  icon: 'assets/icons/lock.svg',
                  isPassword: true,
                  // onSuffixIconTap: controller.togglePasswordVisibility,
                  // isObscured: controller.isObscured.value,
                  // validator: controller.validatePassword,
                ),
                // Obx(
                //   () => CustomTextFormField(
                //     controller: TextEditingController(),
                //     //controller: controller.passwordController,
                //     hintText: 'Password',
                //     icon: 'assets/icons/lock.svg',
                //     isPassword: true,
                //     // onSuffixIconTap: controller.togglePasswordVisibility,
                //     // isObscured: controller.isObscured.value,
                //     // validator: controller.validatePassword,
                //   ),
                // ),
                Gap(72.h),
                CustomButton(
                  //onTap: controller.login,
                  child: Text(
                    'Create Account',
                    style: TextStyle(fontSize: 16.sp, color: Colors.white),
                  ),
                ),
                Gap(72.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account ? Please ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.green,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
