import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:kerjain/pages/responsive/history_responsive.dart';
import 'package:kerjain/pages/responsive/home_responsive.dart';
import 'package:kerjain/pages/responsive/user_profile_responsive.dart';

class BottomNavController extends GetxController {
  var selectedIndex = 0.obs;

  final List<Widget> pages = [HomeResponsive(), HistoryResponsive(), UserProfileResponsive()];

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}
