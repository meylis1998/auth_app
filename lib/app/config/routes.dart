import 'package:get/get.dart';

import '../views/home_view.dart';
import '../views/login_view.dart';

class AppRoutes {
  static const String home = '/home';
  static const String login = '/login';

  static final routes = [
    GetPage(name: home, page: () => HomeView()),
    GetPage(name: login, page: () => LoginView()),
  ];
}
