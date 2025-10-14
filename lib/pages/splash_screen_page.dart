import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kerjain/colors/app_colors.dart';
import 'package:kerjain/controllers/splash_controller.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashScreenPage extends StatelessWidget {
  SplashScreenPage({super.key});

  final controller = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LoadingAnimationWidget.inkDrop(color: ColorPalette.primaryColor, size: 100),
      ),
    );
  }
}