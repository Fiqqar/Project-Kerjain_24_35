import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kerjain/routes/routes.dart';

class AuthController extends GetxController {
  final String email = 'kerjain@gmail.com';
  final String pass = 'kerjain123';

  final emailController = TextEditingController();
  final passController = TextEditingController();

  var isPasswordHidden = true.obs;

  void login() {
    if (emailController.text == email && passController.text == pass ) {
      Get.snackbar('Berhasil', 'Login Berhasil!');
      Get.offNamed(AppRoutes.bottomNav);
  
    } 
    else {
      Get.snackbar('Error', 'Email atau Password salah!');
      emailController.clear();
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