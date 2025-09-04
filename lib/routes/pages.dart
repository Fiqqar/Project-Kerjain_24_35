
import 'package:get/get.dart';
import 'package:kerjain/pages/add_todo_page.dart';
import 'package:kerjain/pages/bottom_nav.dart';
import 'package:kerjain/pages/history_page.dart';
import 'package:kerjain/pages/home_page.dart';
import 'package:kerjain/pages/login_page.dart';
import 'package:kerjain/pages/user_profile_page.dart';

class AppPage{
  static final pages = [
    GetPage(name: '/home', page: () => const HomePage()),
    GetPage(name: '/add-todo', page: () => const AddTodoPage()),
    GetPage(name: '/history', page: () => const HistoryPage()),
    GetPage(name: '/userprofile', page: () => const UserProfilePage()),
    GetPage(name: '/bottom-nav', page: () => const BottomNav()),
    GetPage(name: '/login', page: () => const LoginPage()),
  ];
}