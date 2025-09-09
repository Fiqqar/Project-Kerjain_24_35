import 'package:get/get.dart';
import 'package:kerjain/controllers/bottom_nav_controller.dart';
import 'package:kerjain/controllers/todo_controller.dart';
import 'package:kerjain/controllers/userprofile_controller.dart';

class BottomNavBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavController>(() => BottomNavController());
    Get.lazyPut<TodoController>(() => TodoController());
    Get.lazyPut<UserProfileController>(() => UserProfileController());
  }
}