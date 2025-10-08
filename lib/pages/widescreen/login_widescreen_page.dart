import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kerjain/controllers/auth_controller.dart';
import 'package:kerjain/widgets/custom_button.dart';
import 'package:kerjain/widgets/custom_card.dart';
import 'package:kerjain/colors/app_colors.dart';
import 'package:kerjain/widgets/custom_text.dart';
import 'package:kerjain/widgets/custom_txtfield.dart';

class LoginWidescreenPage extends StatelessWidget {
  LoginWidescreenPage({super.key});
  final loginController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: ColorPalette.backgroundColor,
      body: Center(
        child: SizedBox(
          width: width > 900 ? 700 : width * 0.95,
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Center(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/images/LOGO.png'),
                            radius: 60,
                          ),
                          SizedBox(height: 24),
                          CustomText(
                            text: "Kerjain",
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            textColor: ColorPalette.primaryColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Center(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: CustomCard(
                      color: ColorPalette.primaryColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 32),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 32),
                              child: CustomText(
                                text: "Selamat Datang!",
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                textColor: ColorPalette.backgroundColor,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 18),
                              child: CustomTxtfield(
                                controller: loginController.emailController,
                                hintText: "Email",
                                hintTextColor: ColorPalette.backgroundColor.withAlpha(160),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 24),
                              child: Obx(
                                () => CustomTxtfield(
                                  controller: loginController.passController,
                                  hintText: "Password",
                                  hintTextColor: ColorPalette.backgroundColor.withAlpha(160),
                                  obscureText: loginController.isPasswordHidden.value,
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      loginController.passwordIcon,
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
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
