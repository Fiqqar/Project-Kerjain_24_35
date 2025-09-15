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
          Container(
            margin: EdgeInsets.only(top: 80, bottom: 16),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/LOGO.png'),
              radius: 48,
            ),
          ),
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
                  Container(
                    margin: EdgeInsets.only(bottom: 25),
                    child: CustomText(
                      text: "Selamat Datang Kembali!",
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      textColor: ColorPalette.backgroundColor,
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(bottom: 12),
                    child: CustomTxtfield(
                      controller: loginController.emailController,
                      hintText: "Email",
                      hintTextColor: ColorPalette.backgroundColor.withValues(
                        alpha: 0.7,
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(bottom: 30),
                    child: Obx(
                      () => CustomTxtfield(
                        controller: loginController.passController,
                        hintText: "Password",
                        hintTextColor: ColorPalette.backgroundColor.withValues(
                          alpha: 0.7,
                        ),
                        obscureText: loginController
                            .isPasswordHidden
                            .value, 
                        suffixIcon: IconButton(
                          icon: Icon(
                            loginController.isPasswordHidden.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: ColorPalette.backgroundColor,
                          ),
                          onPressed: () {
                            loginController.togglePasswordVisibility();
                          },
                        ),
                      ),
                    ),
                  ),

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
