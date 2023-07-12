import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/config/routes.dart';
import 'app/controllers/auth_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     Get.put(AuthController());
    return GetMaterialApp(
      title: 'Your App',
      initialRoute: AppRoutes.login,
      getPages: AppRoutes.routes,
    );
  }
}
