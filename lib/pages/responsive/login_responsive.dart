import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kerjain/controllers/auth_controller.dart';
import 'package:kerjain/pages/login_page.dart';
import 'package:kerjain/pages/widescreen/login_widescreen_page.dart';

class LoginResponsive extends StatelessWidget {
  LoginResponsive({super.key});

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        controller.updateLayout(constraints);
        return Obx(() => controller.isMobile.value ? LoginPage() : LoginWidescreenPage());
      }),
    );
  }
}