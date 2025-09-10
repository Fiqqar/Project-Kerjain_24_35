import 'package:get/get.dart';
import 'package:kerjain/routes/routes.dart';

class UserProfileController extends GetxController{
  void logout () {
   Get.offAllNamed(AppRoutes.login);
  }
}