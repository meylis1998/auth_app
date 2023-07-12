import 'package:get/get.dart';

class NavigationService {
  static void toHome() {
    Get.toNamed('/home');
  }

  static void toLogin() {
    Get.offNamed('/login');
  }

  static void toSignup() {
    Get.offNamed('/signup');
  }

  static void goBack() {
    Get.back();
  }
}
