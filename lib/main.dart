import 'package:auth_app/app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app/config/routes.dart';
import 'app/controllers/auth_controller.dart';
import 'app/utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());
    Get.put(AuthService());
    return GetMaterialApp(
      title: 'AuthApp',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.login,
      getPages: AppRoutes.routes,
      theme: ThemeData(
        primaryTextTheme: TextTheme(
          bodyMedium: GoogleFonts.rubik(
            textStyle: Theme.of(context).primaryTextTheme.bodyMedium?.copyWith(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
