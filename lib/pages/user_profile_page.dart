import 'package:flutter/material.dart';
import 'package:kerjain/colors/app_colors.dart';
import 'package:kerjain/widgets/custom_card.dart';
import 'package:kerjain/widgets/custom_text.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.backgroundColor,
      body: Column(
        children: [
          CustomCard(
            topRadius: 40,
            bottomRadius: 40,
            color: ColorPalette.primaryColor,
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey.shade200,
                  child: Icon(Icons.person, size: 40, color: Colors.grey),
                ),
                SizedBox(height: 12),
                CustomText(
                  text: "Namauser",
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  textColor: ColorPalette.textColor,
                ),
                CustomText(
                  text: "Pekerjaan",
                  fontSize: 14,
                  textColor: ColorPalette.textColor.withValues(alpha: 0.7),
                ),
                SizedBox(height: 20),

                buildInfoRow("Username", "pepeny"),
                buildInfoRow("First Name", "Zul"),
                buildInfoRow("Last Name", "Fiqar"),
                buildInfoRow("Birth Date", "01/02/1998"),
                buildInfoRow("Country", "Indonesia"),
                buildInfoRow("City", "Kudus"),

                SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade700,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text("Log Out"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
