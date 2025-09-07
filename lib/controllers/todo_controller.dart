import 'dart:ui';

import 'package:get/get.dart';
import 'package:kerjain/colors/app_colors.dart';
import 'package:kerjain/model/todo_model.dart';

class TodoController extends GetxController {
  var todos = <TodoModel>[].obs;

  @override
  void onInit() {
    super.onInit();

    todos.addAll([
      TodoModel(
        namaTodo: "Tugas B. Inggris",
        deskripsiTodo: "Tugas video iklan",
        kategori: "Sekolah",
      ),
      TodoModel(
        namaTodo: "Belajar 3D Modelling",
        deskripsiTodo: "Belajar UV Mapping",
        kategori: "Pribadi",
      ),
      TodoModel(
        namaTodo: "Meeting dengan client",
        deskripsiTodo: "ACC BOSQUE",
        kategori: "Pekerjaan",
      ),
      TodoModel(
        namaTodo: "Meeting dengan client",
        deskripsiTodo: "ACC BOSQUE",
        kategori: "Pekerjaan",
      ),
      TodoModel(
        namaTodo: "Meeting dengan client",
        deskripsiTodo: "ACC BOSQUE",
        kategori: "Pekerjaan",
      ),
      TodoModel(
        namaTodo: "Meeting dengan client",
        deskripsiTodo: "ACC BOSQUE",
        kategori: "Pekerjaan",
      ),
    ]);
  }

  void toggleCompleted(int index) {
    todos[index].isCompleted = !todos[index].isCompleted;
    todos.refresh();
  }

  Map<String, Color> categoryColors = {
    "Sekolah": ColorPalette.b,
    "Pribadi": ColorPalette.g,
    "Pekerjaan": ColorPalette.r,
  };
  getCategoryColor(String kategori) {
    return categoryColors[kategori] ?? ColorPalette.textColor;
  }

  void deleteTodo(int index) {
    todos.removeAt(index);
  }
}
