// ignore_for_file: must_be_immutable

import 'package:auth_app/app/services/auth_service.dart';
import 'package:auth_app/app/utils/constants.dart';
import 'package:auth_app/app/widgets/form_input_decoration.dart';
import 'package:auth_app/app/widgets/login_method_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/auth_controller.dart';
import '../widgets/button copy.dart';

class LoginView extends GetView<AuthController> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;

  LoginView({super.key});
  final AuthService authService = Get.find<AuthService>();
  final AuthController authController = Get.find<AuthController>();

  var formKey = GlobalKey<FormState>();
  String loginText = 'Вход';
  String loginSubText = 'Введите данные, чтобы войти в личный кабинет.';
  String emailText = 'E-mail';
  String passwordText = 'Пароль';
  String forgotPasswordText = 'Забыли пароль?';
  String signIn = 'Войти';
  String signInMethods = 'Или войдите с помощью:';
  String noAccount = 'Ещё нет акаунта?';
  String signUp = 'Зарегистрируйтесь';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background.png'),
              filterQuality: FilterQuality.high,
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white.withOpacity(0.6),
            ),
            child: Form(
              key: formKey,
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
                              fontWeight: FontWeight.w400,
                              color: AppConstants.blackColor.withOpacity(0.6),
                            ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                 
                  MyTextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    inputFormatters: const [],
                    label: emailText,
                    hasPrefixIcon: false,
                  ),
                  Obx(
                    () => MyTextFormField(
                      controller: _passwordController,
                      inputFormatters: const [],
                      label: passwordText,
                      isPassword: true,
                      obscureText: authService.obscureText.value,
                      hasPrefixIcon: false,
                      suffix: IconButton(
                        onPressed: () {
                          authService.togglePasswordVisibility();
                        },
                        color: AppConstants.primaryColor,
                        icon: Icon(authService.obscureText.value ? Icons.visibility_outlined : Icons.visibility_off_outlined),
                      ),
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
                  isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: AppConstants.whiteColor,
                          ),
                        )
                      : MyButton(
                          color: AppConstants.primaryColor,
                          height: MediaQuery.of(context).size.height / 16,
                          text: signIn,
                          inProgress: isLoading,
                          indicatorSize: 10,
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              String email = _emailController.text;
                              String password = _passwordController.text;

                              controller.login(email, password);
                            }
                          },
                        ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 50,
                        height: 1,
                        color: AppConstants.blackColor.withOpacity(0.6),
                      ),
                      Text(
                        signInMethods,
                        style: GoogleFonts.rubik(
                          textStyle: Theme.of(context).primaryTextTheme.bodyMedium?.copyWith(
                                fontSize: 18,
                                color: AppConstants.blackColor.withOpacity(0.6),
                              ),
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 1,
                        color: AppConstants.blackColor.withOpacity(0.6),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      LoginMethodButton(asset: 'assets/icons/yandex.png', width: 100),
                      LoginMethodButton(asset: 'assets/icons/google.png', width: 70),
                      LoginMethodButton(asset: 'assets/icons/vk.png', width: 70),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        noAccount,
                        style: GoogleFonts.rubik(
                          textStyle: Theme.of(context).primaryTextTheme.bodyMedium?.copyWith(
                                fontSize: 17,
                                color: AppConstants.blackColor.withOpacity(0.7),
                              ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          signUp,
                          style: GoogleFonts.rubik(
                            textStyle: Theme.of(context).primaryTextTheme.bodyMedium?.copyWith(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: AppConstants.accentColor,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
