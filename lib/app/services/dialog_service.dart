import 'package:auth_app/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SnackbarService {
  static void showErrorSnackbar(String message) {
    // Get.snackbar(
    //   'Error',
    //   message,
    //   backgroundColor: Colors.red,
    //   colorText: Colors.white,
    //   snackPosition: SnackPosition.BOTTOM,
    // );

    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        backgroundColor: AppConstants.whiteColor,
        content: Text(
          message,
          style: GoogleFonts.rubik(
            textStyle: Theme.of(Get.context!).primaryTextTheme.bodyMedium?.copyWith(
                  fontSize: 20,
                  color: AppConstants.accentColor,
                ),
          ),
        ),
      ),
    );
  }

  static void showSuccessSnackbar(String message) {
    // Get.snackbar(
    //   'Success',
    //   message,
    //   backgroundColor: Colors.green,
    //   colorText: Colors.white,
    //   snackPosition: SnackPosition.BOTTOM,
    // );
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        backgroundColor: AppConstants.whiteColor,
        content: Text(
          message,
          style: GoogleFonts.rubik(
            textStyle: Theme.of(Get.context!).primaryTextTheme.bodyMedium?.copyWith(
                  fontSize: 20,
                  color: Colors.green,
                ),
          ),
        ),
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
