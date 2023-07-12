import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogService {
  static void showErrorDialog(String errorMessage) {
    Get.dialog(
      AlertDialog(
        title: const Text('Error'),
        content: Text(errorMessage),
        actions: [
          ElevatedButton(
            child: const Text('OK'),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      ),
    );
  }

  static void showSuccessDialog(String message) {
    Get.dialog(
      AlertDialog(
        title: const Text('Success'),
        content: Text(message),
        actions: [
          ElevatedButton(
            child: const Text('OK'),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      ),
    );
  }
}

class NavigationService {
  static void toHome() {
    Get.offNamed('/home');
  }

  static void toLogin() {
    Get.offNamed('/login');
  }
}
