
import 'package:get/get.dart';
import 'package:kerjain/pages/add_todo_page.dart';
import 'package:kerjain/pages/bottom_nav.dart';
import 'package:kerjain/pages/history_page.dart';
import 'package:kerjain/pages/home_page.dart';
import 'package:kerjain/pages/login_page.dart';
import 'package:kerjain/pages/user_profile_page.dart';
import 'package:kerjain/routes/routes.dart';

class AppPage{
  static final pages = [
    GetPage(name: AppRoutes.home, page: () =>  HomePage()),
    GetPage(name: AppRoutes.addTodo, page: () =>  AddTodoPage()),
    GetPage(name: AppRoutes.history, page: () =>  HistoryPage()),
    GetPage(name: AppRoutes.userProfile, page: () =>  UserProfilePage()),
    GetPage(name: AppRoutes.bottomNav, page: () =>  BottomNav()),
    GetPage(name: AppRoutes.login, page: () =>  LoginPage()),
  ];
}