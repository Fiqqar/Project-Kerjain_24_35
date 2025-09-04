import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kerjain/controllers/bottom_nav_controller.dart';


class BottomNav extends StatelessWidget {
  BottomNav({super.key});
  
  final BottomNavController bottomNavController = Get.put(BottomNavController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: IndexedStack(
          index: bottomNavController.selectedIndex.value,
          children: bottomNavController.pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: bottomNavController.selectedIndex.value,
          onTap: bottomNavController.changeIndex,
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.grey,
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
              label: "Profile"
            ),
          ],
        ),
      ),
    );
  }
}