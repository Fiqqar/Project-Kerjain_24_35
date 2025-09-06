import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kerjain/colors/app_colors.dart';
import 'package:kerjain/controllers/bottom_nav_controller.dart';
import 'package:kerjain/widgets/custom_card.dart';

class BottomNav extends StatelessWidget {
  BottomNav({super.key});

  final BottomNavController bottomNavController = Get.find<BottomNavController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: IndexedStack(
          index: bottomNavController.selectedIndex.value,
          children: bottomNavController.pages,
        ),

        
       bottomNavigationBar: CustomCard(
  color: ColorPalette.primaryColor,
  topRadius: 20,
  bottomRadius: 0,
  hasShadow: true,
  customShadow: const [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 10,
      spreadRadius: 2,
      offset: Offset(0, -2), 
    ),
  ],
  padding: EdgeInsets.zero, 
  child: BottomNavigationBar(
    backgroundColor: Colors.transparent, 
    elevation: 0,
    currentIndex: bottomNavController.selectedIndex.value,
    onTap: bottomNavController.changeIndex,
    selectedItemColor: ColorPalette.accentColor,
    unselectedItemColor:
        ColorPalette.backgroundColor.withValues(alpha: 0.7),
    items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.check_box),
        label: "To Do",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.history),
        label: "History",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: "Profile",
      ),
    ],
  ),
),

      ),
    );
  }
}
