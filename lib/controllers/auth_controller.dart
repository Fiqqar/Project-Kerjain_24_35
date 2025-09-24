import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kerjain/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final String email = 'kerjain@gmail.com';
  final String pass = 'kerjain123';

  final emailController = TextEditingController();
  final passController = TextEditingController();

  var isPasswordHidden = true.obs;

  login() async {
    if (emailController.text == email && passController.text == pass ) {
      final pref = await SharedPreferences.getInstance();
      await pref.setString('Email', emailController.text.toString());
      Get.snackbar('Berhasil', 'Login Berhasil!');
      Get.offNamed(AppRoutes.bottomNav);
  
    } 
    else {
      Get.snackbar('Error', 'Email atau Password salah!');
      passController.clear();
    }
  }

  void logout() {
    Get.snackbar('Berhasil', 'Log out berhasil!');
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passController.dispose();
  }

  void togglePasswordVisibility() {
  isPasswordHidden.value = !isPasswordHidden.value;
  }
  
  IconData get passwordIcon {
    if (isPasswordHidden.value) {
      return Icons.visibility_off;
    } else {
      return Icons.visibility;
    }
  }
}