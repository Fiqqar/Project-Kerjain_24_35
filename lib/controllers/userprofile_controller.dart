import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kerjain/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfileController extends GetxController {
  var isMobile = true.obs;
  void updateLayout(BoxConstraints constraints) {
    isMobile.value = constraints.maxWidth < 600;
  }

  logout() async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove('Email');
    Get.offAllNamed(AppRoutes.splashPage);
  }
}
