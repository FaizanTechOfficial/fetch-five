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
        backgroundColor: Colors.black,
        // body: Center(
        //   child: SingleChildScrollView(
        //     child: Form(
        //       key: controller.formKey,
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           Image.asset(
        //             'assets/images/five_tile.png',
        //             width: 200,
        //           ),
        //           const Gap(80),
        //           SizedBox(
        //             height: 50,
        //             width: 400,
        //             child: CustomTextFormFieldDesktop(
        //               fontSize: 16,
        //               controller: controller.emailController,
        //               hintText: 'Email',
        //               icon: 'assets/icons/message.svg',
        //               validator: controller.validateEmail,
        //             ),
        //           ),
        //           const Gap(40),
        //           SizedBox(
        //             height: 50,
        //             width: 400,
        //             child: Obx(
        //               () => CustomTextFormFieldDesktop(
        //                 controller: controller.passwordController,
        //                 hintText: 'Password',
        //                 icon: 'assets/icons/lock.svg',
        //                 isPassword: true,
        //                 onSuffixIconTap: controller.togglePasswordVisibility,
        //                 isObscured: controller.isObscured.value,
        //                 validator: controller.validatePassword,
        //               ),
        //             ),
        //           ),
        //           const Gap(32),
        //           GestureDetector(
        //             onTap: () {
        //               print('Forgot Password');
        //               Get.toNamed(AppRoutes.forgotPassword);
        //             },
        //             child: const Text(
        //               'Forgot Password?',
        //               style: TextStyle(fontSize: 16, color: Colors.white),
        //             ),
        //           ),
        //           const Gap(32),
        //           CustomButton(
        //             height: 50,
        //             width: 400,
        //             onTap: controller.login,
        //             child: Row(
        //               mainAxisAlignment: MainAxisAlignment.center,
        //               children: [
        //                 SvgPicture.asset(
        //                   'assets/icons/game.svg',
        //                   height: 25,
        //                   width: 20,
        //                 ),
        //                 const Gap(10),
        //                 const Text(
        //                   'Login to Play',
        //                   style: TextStyle(fontSize: 16, color: Colors.white),
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
