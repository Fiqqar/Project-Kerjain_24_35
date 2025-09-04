import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:kerjain/pages/history_page.dart';
import 'package:kerjain/pages/home_page.dart';
import 'package:kerjain/pages/user_profile_page.dart';

class BottomNavController extends GetxController {
  var selectedIndex = 0.obs;

  final List<Widget> pages = [
    HomePage(),
    HistoryPage(),
    UserProfilePage(),
  ];

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}