import 'package:auth_app/app/services/auth_service.dart';
import 'package:auth_app/app/utils/constants.dart';
import 'package:auth_app/app/widgets/button.dart';
import 'package:auth_app/app/widgets/login_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/auth_controller.dart';

class LoginView extends GetView<AuthController> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginView({super.key});
  final AuthService authService = Get.find<AuthService>();

  String loginText = 'Вход';
  String loginSubText = 'Введите данные, чтобы войти в личный кабинет.';
  String emailText = 'E-mail';
  String passwordText = 'Пароль';
  String forgotPasswordText = 'Забыли пароль?';
  String signIn = 'Войти';
  String signInMethods = 'Или войдите с помощью:';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/background.png'), filterQuality: FilterQuality.high, fit: BoxFit.cover),
          ),
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 150),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white.withOpacity(0.6)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    loginText,
                    textAlign: TextAlign.left,
                    style: GoogleFonts.rubik(
                      textStyle: Theme.of(context).primaryTextTheme.bodyMedium?.copyWith(
                            fontSize: 39,
                            fontWeight: FontWeight.bold,
                            color: AppConstants.blackColor,
                          ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    loginSubText,
                    textAlign: TextAlign.left,
                    style: GoogleFonts.rubik(
                      textStyle: Theme.of(context).primaryTextTheme.bodyMedium?.copyWith(
                            fontSize: 17,
                            color: AppConstants.blackColor.withOpacity(0.7),
                          ),
                    ),
                  ),
                ),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: emailText,
                    labelStyle: GoogleFonts.rubik(
                      textStyle: Theme.of(context).primaryTextTheme.bodyMedium?.copyWith(
                            fontSize: 18,
                            color: AppConstants.textFieldColor,
                          ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: AppConstants.textFieldColor,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: AppConstants.textFieldColor,
                        width: 2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: AppConstants.textFieldColor,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: passwordText,
                      labelStyle: GoogleFonts.rubik(
                        textStyle: Theme.of(context).primaryTextTheme.bodyMedium?.copyWith(
                              fontSize: 18,
                              color: AppConstants.textFieldColor,
                            ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: AppConstants.textFieldColor,
                          width: 2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: AppConstants.textFieldColor,
                          width: 2,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: AppConstants.textFieldColor,
                          width: 2,
                        ),
                      ),
                      // a method to toggle password visibility
                      // suffix: IconButton(
                      //   icon: const Icon(Icons.remove_red_eye_outlined),
                      //   color: AppConstants.primaryColor,
                      //   onPressed: () => authService.togglePasswordVisibility(),
                      // ),
                    ),
                    obscureText: authService.obscureText.value,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      forgotPasswordText,
                      textAlign: TextAlign.right,
                      style: GoogleFonts.rubik(
                        textStyle: Theme.of(context).primaryTextTheme.bodyMedium?.copyWith(
                              fontSize: 16,
                              decoration: TextDecoration.underline,
                              color: AppConstants.accentColor,
                            ),
                      ),
                    ),
                  ),
                ),
                LoginButton(
                  onPressed: () {
                    String email = _emailController.text;
                    String password = _passwordController.text;
                    controller.login(email, password);
                  },
                  text: signIn,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('––––––'),
                    Text(
                      signInMethods,
                      style: GoogleFonts.rubik(
                        textStyle: Theme.of(context).primaryTextTheme.bodyMedium?.copyWith(
                              fontSize: 18,
                              color: AppConstants.blackColor.withOpacity(0.6),
                            ),
                      ),
                    ),
                    const Text('––––––'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    LoginMethodButton(
                      asset: 'assets/icons/yandex.png',
                      width: 100,
                    ),
                    LoginMethodButton(asset: 'assets/icons/google.png', width: 70),
                    LoginMethodButton(
                      asset: 'assets/icons/vk.png',
                      width: 70,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
