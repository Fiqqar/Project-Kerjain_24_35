import 'package:get/get.dart';
import 'package:kerjain/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    checkLogin();
  }

  checkLogin() async {
    final pref = await SharedPreferences.getInstance();
    if(pref.getString('Email') != null)  {
      await Future.delayed(Duration(seconds: 3));
      Get.offAllNamed(AppRoutes.bottomNav);
    } else {
      await Future.delayed(Duration(seconds: 3));
      Get.offAllNamed(AppRoutes.login);
    }
  }
}