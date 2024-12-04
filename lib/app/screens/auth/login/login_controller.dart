import 'package:fetch_five/app/models/response_model.dart';
import 'package:fetch_five/app/routes/routes.dart';
import 'package:fetch_five/app/services/dio_client.dart';
import 'package:fetch_five/app/services/local/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class LoginController extends GetxController {
  final SharedPref pref = SharedPref();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final isObscured = true.obs;
  final _dio = Get.find<DioClient>();
  final RxBool isLoading = false.obs;

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

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      try {
        isLoading.value = true;

        final result = await _dio.post(
          'game-login',
          data: {
            "user_email": emailController.text.trim(),
            "user_passwd": passwordController.text.trim(),
          },
        );

        final data = ResponseModel.fromJson(result.data);
        if (data.sessionId != null && data.sessionId!.isNotEmpty) {
          await pref.putString(SharedPref.tokenKey, data.sessionId.toString());

          Get.offAndToNamed(AppRoutes.game);
        }
      } catch (e) {
        Logger().e(e.toString());
      } finally {
        isLoading.value = false;
      }
    }
  }
}
