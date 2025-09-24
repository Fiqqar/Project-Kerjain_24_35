import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kerjain/controllers/splash_controller.dart';
import 'package:kerjain/widgets/custom_text.dart';

class SplashScreenPage extends StatelessWidget {
  SplashScreenPage({super.key});

  final controller = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomText(text: "Kerjain Loading...", fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}