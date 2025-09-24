
import 'package:get/get.dart';
import 'package:kerjain/bindings/add_todo_binding.dart';
import 'package:kerjain/bindings/auth_binding.dart';
import 'package:kerjain/bindings/bottom_nav_binding.dart';
import 'package:kerjain/bindings/splash_binding.dart';
import 'package:kerjain/pages/add_todo_page.dart';
import 'package:kerjain/pages/bottom_nav.dart';
import 'package:kerjain/pages/history_page.dart';
import 'package:kerjain/pages/home_page.dart';
import 'package:kerjain/pages/login_page.dart';
import 'package:kerjain/pages/splash_screen_page.dart';
import 'package:kerjain/pages/user_profile_page.dart';
import 'package:kerjain/routes/routes.dart';

class AppPage{
  static final pages = [
    GetPage(name: AppRoutes.home, page: () =>  HomePage()),
    GetPage(name: AppRoutes.addTodo, page: () =>  AddTodoPage(), binding: AddTodoBinding()),
    GetPage(name: AppRoutes.history, page: () =>  HistoryPage()),
    GetPage(name: AppRoutes.userProfile, page: () =>  UserProfilePage()),
    GetPage(name: AppRoutes.bottomNav, page: () =>  BottomNav(), binding: BottomNavBinding()),
    GetPage(name: AppRoutes.login, page: () =>  LoginPage(), binding: AuthBinding()),
    GetPage(name: AppRoutes.splashPage, page: () =>  SplashScreenPage(), binding: SplashBinding()),
  ];
}