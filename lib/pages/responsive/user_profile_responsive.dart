import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kerjain/controllers/userprofile_controller.dart';
import 'package:kerjain/pages/user_profile_page.dart';
import 'package:kerjain/pages/widescreen/user_profile_widescreen_page.dart';

class UserProfileResponsive extends StatelessWidget {
  UserProfileResponsive({super.key});

  final controller = Get.find<UserProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        controller.updateLayout(constraints);
        return Obx(() => controller.isMobile.value ? UserProfilePage() : UserProfileWidescreenPage());
      }),
    );
  }
}