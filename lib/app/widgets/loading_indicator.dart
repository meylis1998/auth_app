import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Material(
      color: Colors.transparent,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  static void show() {
    Get.dialog(const LoadingIndicator(), barrierDismissible: false);
  }

  static void hide() {
    if (Get.isDialogOpen!) {
      Get.back();
    }
  }
}
