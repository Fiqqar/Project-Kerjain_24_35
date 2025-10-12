import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kerjain/controllers/addtodo_controller.dart';
import 'package:kerjain/pages/add_todo_page.dart';
import 'package:kerjain/pages/widescreen/add_widescreen_page.dart';


class AddResponsive extends StatelessWidget {
  AddResponsive({super.key});

  final controller = Get.find<AddTodoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        controller.updateLayout(constraints);
        return Obx(() => controller.isMobile.value ? AddTodoPage() : AddTodoWidescreenPage());
      }),
    );
  }
}