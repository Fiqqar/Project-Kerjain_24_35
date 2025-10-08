import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kerjain/colors/app_colors.dart';
import 'package:kerjain/controllers/userprofile_controller.dart';
import 'package:kerjain/widgets/custom_button.dart';
import 'package:kerjain/widgets/custom_card.dart';
import 'package:kerjain/widgets/custom_text.dart';

class UserProfileWidescreenPage extends StatelessWidget {
  UserProfileWidescreenPage({super.key});

  final profileController = Get.find<UserProfileController>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: ColorPalette.backgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
          child: SizedBox(
            width: width > 900 ? 750 : width * 0.98,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 14),
                              child: CircleAvatar(
                                radius: 48,
                                backgroundImage: AssetImage("assets/images/fiqar.png"),
                                backgroundColor: ColorPalette.backgroundColor,
                              ),
                            ),
                            CircleAvatar(
                              radius: 48,
                              backgroundImage: AssetImage("assets/images/rayhan.png"),
                              backgroundColor: ColorPalette.backgroundColor,
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 24),
                          child: CustomText(
                            text: "Zulfiqar & Rayhan",
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            textColor: ColorPalette.textColor,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 6, bottom: 16),
                          child: CustomText(
                            fontWeight: FontWeight.w600,
                            text: "Kerjain Developer",
                            fontSize: 16,
                            textColor: ColorPalette.textColor.withAlpha(230),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: CustomCard(
                      color: ColorPalette.primaryColor,
                      hasShadow: false,
                      topRadius: 16,
                      bottomRadius: 16,
                      padding: const EdgeInsets.all(28),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: height * 0.8,
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomCard(
                                color: ColorPalette.accentColor.withAlpha(180),
                                padding: const EdgeInsets.all(15),
                                bottomRadius: 14,
                                hasShadow: false,
                                marginBottom: 24,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 10),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                            text: "Nickname:",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            textColor: ColorPalette.textColor,
                                          ),
                                          const SizedBox(width: 10),
                                          Expanded(
                                            child: CustomText(
                                              text: "pepeny & hanside",
                                              fontSize: 14,
                                              textColor: ColorPalette.backgroundColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 10),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                            text: "First Name:",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            textColor: ColorPalette.textColor,
                                          ),
                                          const SizedBox(width: 10),
                                          Expanded(
                                            child: CustomText(
                                              text: "Zul, Ray",
                                              fontSize: 14,
                                              textColor: ColorPalette.backgroundColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 10),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                            text: "Last Name:",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            textColor: ColorPalette.textColor,
                                          ),
                                          const SizedBox(width: 10),
                                          Expanded(
                                            child: CustomText(
                                              text: "Fiqar, Han",
                                              fontSize: 14,
                                              textColor: ColorPalette.backgroundColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 10),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                            text: "Birth Date:",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            textColor: ColorPalette.textColor,
                                          ),
                                          const SizedBox(width: 10),
                                          Expanded(
                                            child: CustomText(
                                              text: "01/02/1998, 02/03/1999",
                                              fontSize: 14,
                                              textColor: ColorPalette.backgroundColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 10),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                            text: "Country:",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            textColor: ColorPalette.textColor,
                                          ),
                                          const SizedBox(width: 10),
                                          Expanded(
                                            child: CustomText(
                                              text: "Indonesia, Indonesia",
                                              fontSize: 14,
                                              textColor: ColorPalette.backgroundColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 10),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                            text: "City:",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            textColor: ColorPalette.textColor,
                                          ),
                                          const SizedBox(width: 10),
                                          Expanded(
                                            child: CustomText(
                                              text: "Kudus, Palembang",
                                              fontSize: 14,
                                              textColor: ColorPalette.backgroundColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: CustomButton(
                                  label: "Logout",
                                  onPressed: () {
                                    profileController.logout();
                                  },
                                  color: ColorPalette.accentColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
