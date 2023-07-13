import 'package:get/get.dart';

class AuthService extends GetxController {
  var obscureText = true.obs;

  void togglePasswordVisibility() {
    obscureText.toggle();
  }
}
