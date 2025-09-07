import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kerjain/routes/routes.dart';

class AuthController extends GetxController {
  final String email = 'kerjain@gmail.com';
  final String pass = 'kerjain123';

  final emailController = TextEditingController();
  final passController = TextEditingController();


  void login() {
    if (emailController.text == email && passController.text == pass ) {
      Get.snackbar('Berhasil', 'Login Berhasil!');
      Get.offAllNamed(AppRoutes.bottomNav);
  
    } 
    else {
      Get.snackbar('Error', 'Email atau Password salah!');
    }
  }

  void logout() {
    Get.snackbar('Berhasil', 'Log out berhasil!');
  }
}