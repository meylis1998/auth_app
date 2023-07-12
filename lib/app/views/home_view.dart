import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class HomeView extends GetView<AuthController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Obx(
          () => Text(
            controller.isLoggedIn.value ? 'Welcome Home!' : 'Please login',
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
