import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateAccountController extends GetxController {
  final passwordController = TextEditingController();
  final isObscured = true.obs;
  void togglePasswordVisibility() {
    isObscured.value = !isObscured.value;
  }
}
