import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:kerjain/routes/pages.dart';
import 'package:kerjain/routes/routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Kerjain',
      initialRoute: AppRoutes.login,
      getPages: AppPage.pages,
    );
  }
}
