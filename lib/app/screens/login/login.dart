import 'package:fetch_five/app/utilities/responsive_class.dart';
import 'package:fetch_five/app/widget/c_button.dart';
import 'package:fetch_five/app/widget/c_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'login_controller.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Responsive(
      mobile: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/five_tile.png',
                          width: 200.w,
                        ),
                      ],
                    ),
                    Gap(80.h),
                    CustomTextFormField(
                      controller: controller.emailController,
                      hintText: 'Email',
                      icon: 'assets/icons/message.svg',
                      validator: controller.validateEmail,
                    ),
                    Gap(10.h),
                    Obx(
                      () => CustomTextFormField(
                        controller: controller.passwordController,
                        hintText: 'Password',
                        icon: 'assets/icons/lock.svg',
                        isPassword: true,
                        onSuffixIconTap: controller.togglePasswordVisibility,
                        isObscured: controller.isObscured.value,
                        validator: controller.validatePassword,
                      ),
                    ),
                    Gap(32.h),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(fontSize: 16.sp, color: Colors.white),
                      ),
                    ),
                    Gap(32.h),
                    CustomButton(
                      onTap: controller.login,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/game.svg',
                            height: 24.h,
                            width: 24.w,
                          ),
                          Gap(10.w),
                          Text(
                            'Login to Play',
                            style:
                                TextStyle(fontSize: 16.sp, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      desktop: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: SingleChildScrollView(
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/five_tile.png',
                    width: 200,
                  ),
                  const Gap(80),
                  SizedBox(
                    height: 50,
                    width: 400,
                    child: CustomTextFormFieldDesktop(
                      fontSize: 16,
                      controller: controller.emailController,
                      hintText: 'Email',
                      icon: 'assets/icons/message.svg',
                      validator: controller.validateEmail,
                    ),
                  ),
                  const Gap(40),
                  SizedBox(
                    height: 50,
                    width: 400,
                    child: Obx(
                      () => CustomTextFormFieldDesktop(
                        controller: controller.passwordController,
                        hintText: 'Password',
                        icon: 'assets/icons/lock.svg',
                        isPassword: true,
                        onSuffixIconTap: controller.togglePasswordVisibility,
                        isObscured: controller.isObscured.value,
                        validator: controller.validatePassword,
                      ),
                    ),
                  ),
                  const Gap(32),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  const Gap(32),
                  CustomButton(
                    height: 50,
                    width: 400,
                    onTap: controller.login,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/game.svg',
                          height: 25,
                          width: 20,
                        ),
                        const Gap(10),
                        const Text(
                          'Login to Play',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ],
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
