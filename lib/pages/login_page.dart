import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kerjain/controllers/auth_controller.dart';
import 'package:kerjain/widgets/custom_button.dart';
import 'package:kerjain/widgets/custom_card.dart';
import 'package:kerjain/colors/app_colors.dart';
import 'package:kerjain/widgets/custom_text.dart';
import 'package:kerjain/widgets/custom_txtfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final loginController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.backgroundColor,
      body: Column(
        children: [
          const SizedBox(height: 80),
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/LOGO.png'),
            radius: 48,
          ),
          const SizedBox(height: 16),
          CustomText(
            text: "Kerjain",
            fontSize: 24,
            fontWeight: FontWeight.bold,
            textColor: ColorPalette.primaryColor,
          ),
          Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomCard(
              topRadius: 16,
              height: MediaQuery.of(context).size.height * 0.55,
              color: ColorPalette.primaryColor,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomText(
                    text: "Selamat Datang Kembali!",
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    textColor: ColorPalette.backgroundColor,
                  ),
                  const SizedBox(height: 25),
                  CustomTxtfield(
                    controller: loginController.emailController,
                    hintText: "Email",
                    hintTextColor: ColorPalette.backgroundColor.withValues(
                      alpha: 0.7,
                    ),
                  ),
                  const SizedBox(height: 12),
                  CustomTxtfield(
                    controller: loginController.passController,
                    hintText: "Password",
                    hintTextColor: ColorPalette.backgroundColor.withValues(
                      alpha: 0.7,
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 30),
                  CustomButton(
                    label: "Login",
                    onPressed: () {
                      loginController.login();
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
