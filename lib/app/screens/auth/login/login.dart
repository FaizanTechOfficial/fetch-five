import 'package:fetch_five/app/data/gen/assets.gen.dart';
import 'package:fetch_five/app/routes/routes.dart';
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
                          Assets.images.fiveTile.path,
                          width: 200.w,
                        ),
                      ],
                    ),
                    Gap(80.h),
                    CustomTextFormField(
                      controller: controller.emailController,
                      hintText: 'Email',
                      autofillHints: const [AutofillHints.email],
                      icon: Assets.icons.message.path,
                      validator: controller.validateEmail,
                    ),
                    Gap(10.h),
                    Obx(
                      () => CustomTextFormField(
                        controller: controller.passwordController,
                        hintText: 'Password',
                        autofillHints: const [AutofillHints.password],
                        icon: Assets.icons.lock.path,
                        isPassword: true,
                        onSuffixIconTap: controller.togglePasswordVisibility,
                        isObscured: controller.isObscured.value,
                        validator: controller.validatePassword,
                      ),
                    ),
                    Gap(32.h),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.forgotPassword);
                      },
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                    Gap(32.h),
                    Obx(
                      () => CustomButton(
                        onTap: controller.login,
                        child: controller.isLoading.value
                            ? const CircularProgressIndicator()
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    Assets.icons.game.path,
                                    height: 24.h,
                                    width: 24.w,
                                  ),
                                  Gap(10.w),
                                  Text(
                                    'Login to Play',
                                    style: TextStyle(
                                        fontSize: 16.sp, color: Colors.white),
                                  ),
                                ],
                              ),
                      ),
                    ),
                    Gap(32.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoutes.createAccount);
                          },
                          child: Text(
                            'Create an Account.',
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
        ),
      ),
      desktop: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: SizedBox(
            width: 428,
            child: SingleChildScrollView(
              child: Form(
                key: controller.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      Assets.images.fiveTile.path,
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
                        autofillHints: const [AutofillHints.email],
                        icon: Assets.icons.message.path,
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
                          autofillHints: const [AutofillHints.password],
                          icon: Assets.icons.lock.path,
                          isPassword: true,
                          onSuffixIconTap: controller.togglePasswordVisibility,
                          isObscured: controller.isObscured.value,
                          validator: controller.validatePassword,
                        ),
                      ),
                    ),
                    const Gap(32),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.forgotPassword);
                        },
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                    const Gap(32),
                    Obx(
                      () => CustomButtonDesktop(
                        height: 50,
                        width: 400,
                        onTap: controller.login,
                        child: controller.isLoading.value
                            ? const CircularProgressIndicator()
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    Assets.icons.game.path,
                                    height: 25,
                                    width: 20,
                                  ),
                                  const Gap(10),
                                  const Text(
                                    'Login to Play',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                ],
                              ),
                      ),
                    ),
                    const Gap(32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account? ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoutes.createAccount);
                          },
                          child: const Text(
                            'Create an Account.',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
