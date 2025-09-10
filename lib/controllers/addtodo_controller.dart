import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kerjain/controllers/todo_controller.dart';
import 'package:kerjain/model/todo_model.dart';
import 'package:kerjain/routes/routes.dart';

class AddTodoController extends GetxController {
  final namaController = TextEditingController();
  final deskripsiController = TextEditingController();

  var kategori = ["Sekolah", "Pribadi", "Pekerjaan",];
  var selectedKategori = "".obs;

  final TodoController todoController = Get.find<TodoController>();

  void setKategori(String kategori) {
    selectedKategori.value = kategori;
  }

  void addTodo() {
    if (namaController.text.isEmpty || selectedKategori.value.isEmpty) {
      Get.snackbar(
        "Error",
        "Nama kegiatan dan kategori wajib diisi!",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    todoController.todos.add(
      TodoModel(
        namaTodo: namaController.text,
        deskripsiTodo: deskripsiController.text,
        kategori: selectedKategori.value,
      ),
    );
    Get.snackbar(
      "Berhasil",
      "Kegiatan berhasil ditambahkan!",
      snackPosition: SnackPosition.BOTTOM,
    );
    Get.toNamed(AppRoutes.bottomNav);
  }

  void clearFields() {
    namaController.clear();
    deskripsiController.clear();
    selectedKategori.value = "";
  }

  @override
  void onClose() {
    namaController.dispose();
    deskripsiController.dispose();
    super.onClose();
  }

  void onChanged(String? newValue) {
    if (newValue != null && newValue != "") {
      setKategori(newValue);
    }
  }
}
