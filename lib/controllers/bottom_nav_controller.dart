import 'package:get/get.dart';

class BottomNavController extends GetxController {
  var currIndex = 0.obs;

  // final List<String> pages = [
  //   HomePage(),
  //   HistoryPage(),
  //   ProfilePage(),
  // ];

  void changePage(int index) {
    currIndex.value = index;
  }
}