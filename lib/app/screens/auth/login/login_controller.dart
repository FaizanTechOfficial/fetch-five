import 'package:fetch_five/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final isObscured = true.obs;

  final formKey = GlobalKey<FormState>();

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    }
    if (!GetUtils.isEmail(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  void togglePasswordVisibility() {
    isObscured.value = !isObscured.value;
  }

  void login() {
    if (formKey.currentState!.validate()) {
      Get.offNamed(AppRoutes.game);
      //   Get.snackbar(
      //     "Login Success",
      //     "Welcome!",
      //     snackPosition: SnackPosition.BOTTOM,
      //     backgroundColor: const Color(0xff04AA6D),
      //     colorText: Colors.white,
      //   );
      // } else {
      //   Get.snackbar(
      //     "Login Failed",
      //     "Please check your credentials",
      //     snackPosition: SnackPosition.BOTTOM,
      //     backgroundColor: Colors.red,
      //     colorText: Colors.white,
      //   );
      // }
      // }

      // void forgotPassword() {
      //   Get.snackbar(
      //     "Forgot Password",
      //     "Reset link sent to your email",
      //     snackPosition: SnackPosition.BOTTOM,
      //     backgroundColor: Colors.blue,
      //     colorText: Colors.white,
      //   );
      // }
    }
  }
}
