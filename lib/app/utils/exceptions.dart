import 'package:dio/dio.dart';
import 'package:fetch_five/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void handleDioException(DioException e) {
  if (e.type == DioExceptionType.connectionError) {
    Get.snackbar('Connection Issue',
        'It seems you are offline. Please check your internet connection and try again.',
        backgroundColor: const Color(0xff22222b), colorText: Colors.white);
  } else if (e.type == DioExceptionType.sendTimeout) {
    Get.snackbar('Request Timeout', 'The request timed out while sending data.',
        backgroundColor: const Color(0xff22222b), colorText: Colors.white);
  } else if (e.type == DioExceptionType.receiveTimeout) {
    Get.snackbar(
      'Response Timeout',
      'The request timed out while receiving data.',
      backgroundColor: const Color(0xff22222b),
      colorText: Colors.white,
    );
  } else if (e.type == DioExceptionType.badResponse) {
    if (e.response != null) {
      int? statusCode = e.response?.statusCode;

      if (statusCode == 400) {
        Get.snackbar('Bad Request', 'The request was invalid.',
            backgroundColor: const Color(0xff22222b), colorText: Colors.white);
      } else if (statusCode == 401) {
        Get.snackbar('Session Expired', 'Please Login again',
            backgroundColor: const Color(0xff22222b), colorText: Colors.white);
        Future.delayed(const Duration(seconds: 1), () {
          Get.offAllNamed(AppRoutes.login);
        });
      } else if (statusCode == 403) {
        Get.snackbar(
            'Forbidden', 'Access to the requested resource is forbidden.',
            backgroundColor: const Color(0xff22222b), colorText: Colors.white);
      } else if (statusCode == 404) {
        Get.snackbar('Not Found', 'The requested resource was not found.',
            backgroundColor: const Color(0xff22222b), colorText: Colors.white);
      } else if (statusCode == 500) {
        Get.snackbar('Server Error', 'An error occurred on the server.',
            backgroundColor: const Color(0xff22222b), colorText: Colors.white);
      } else {
        Get.snackbar('HTTP Error', 'HTTP Error: $statusCode',
            backgroundColor: const Color(0xff22222b), colorText: Colors.white);
      }
    } else {
      Get.snackbar('Bad Response', 'Received an invalid response.',
          backgroundColor: const Color(0xff22222b), colorText: Colors.white);
    }
  } else if (e.type == DioExceptionType.cancel) {
    Get.snackbar('Request Cancelled', 'The request was cancelled.',
        backgroundColor: const Color(0xff22222b), colorText: Colors.white);
  } else {
    Get.snackbar('Error', 'An unknown error occurred.',
        backgroundColor: const Color(0xff22222b), colorText: Colors.white);
  }
}
