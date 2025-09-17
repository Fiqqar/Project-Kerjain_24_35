import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:kerjain/colors/app_colors.dart';
import 'package:kerjain/controllers/userprofile_controller.dart';
import 'package:kerjain/widgets/custom_button.dart';
import 'package:kerjain/widgets/custom_card.dart';
import 'package:kerjain/widgets/custom_text.dart';

class UserProfilePage extends StatelessWidget {
  UserProfilePage({super.key});

  final UserProfileController profileController =
      Get.find<UserProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.backgroundColor,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 50, bottom: 10, left: 5, right: 5),
            child: CustomCard(
              hasShadow: false,
              topRadius: 15,
              bottomRadius: 15,
              color: ColorPalette.primaryColor,
              padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10, right: 7),
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage("assets/images/fiqar.png"),
                          backgroundColor: ColorPalette.backgroundColor,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage("assets/images/rayhan.png"),
                          backgroundColor: ColorPalette.backgroundColor,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 1),
                    child: CustomText(
                      text: "Zulfiqar & Rayhan",
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      textColor: ColorPalette.backgroundColor,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: CustomText(
                      fontWeight: FontWeight.w600,
                      text: "Kerjain Developer",
                      fontSize: 14,
                      textColor: ColorPalette.textColor.withValues(
                        alpha: 0.9,
                      ),
                    ),
                  ),
                  CustomCard(
                    marginBottom: 20,
                    color: ColorPalette.accentColor.withValues(alpha: 0.7),
                    padding: EdgeInsets.all(12),
                    bottomRadius: 15,
                    hasShadow: false,
                    child: Column(
                      children: [
                        buildInfoRow("Nickname", "pepeny & hanside"),
                        buildInfoRow("First Name", "Zul, Ray"),
                        buildInfoRow("Last Name", "Fiqar, Han"),
                        buildInfoRow("Birth Date", "01/02/1998, 02/03/1999"),
                        buildInfoRow("Country", "Indonesia, Indonesia"),
                        buildInfoRow("City", "Kudus, Palembang"),
                      ],
                    ),
                  ),
                  CustomButton(
                    label: "Logout",
                    onPressed: () {
                      profileController.logout();
                    },
                    color: ColorPalette.accentColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
