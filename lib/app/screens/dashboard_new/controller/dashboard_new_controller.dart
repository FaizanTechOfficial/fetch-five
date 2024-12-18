import 'package:dio/dio.dart';
import 'package:fetch_five/app/routes/routes.dart';
import 'package:fetch_five/app/services/dio_client.dart';
import 'package:fetch_five/app/services/local/shared_pref.dart';
import 'package:fetch_five/app/utils/exceptions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class DashboardNewController extends GetxController {
  final key = GlobalKey<ScaffoldState>();
  RxInt currentIndex = 0.obs;
  RxBool isLoading = false.obs;
  RxBool isDrawerVisible = false.obs;

  final SharedPref pref = SharedPref();
  final _dio = Get.find<DioClient>();

  void openDrawer() {
    isDrawerVisible.value = true;
  }

  void closeDrawer() {
    isDrawerVisible.value = false;
  }

  void startLoading() {
    isLoading.value = true;
  }

  void stopLoading() {
    isLoading.value = false;
  }

  void updateIndex(int newIndex) {
    currentIndex.value = newIndex;
    update();
  }

  Future<dynamic> logout() async {
    try {
      isLoading.value = true;
      final sessionId = await pref.getString('session_id');
      await _dio.logout('game-logout', sessionId: sessionId);
      await pref.clear();
      Get.offAllNamed(AppRoutes.login);
    } on DioException catch (e) {
      handleDioException(e);
    } catch (e) {
      Logger().e(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
