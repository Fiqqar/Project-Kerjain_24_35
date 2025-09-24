import 'package:get/get.dart';
import 'package:kerjain/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfileController extends GetxController {
  logout() async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove('Username');
    Get.offAllNamed(AppRoutes.splashPage);
  }
}
