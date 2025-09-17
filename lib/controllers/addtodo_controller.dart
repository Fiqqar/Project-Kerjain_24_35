import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kerjain/controllers/todo_controller.dart';
import 'package:kerjain/model/todo_model.dart';
import 'package:kerjain/routes/routes.dart';

class AddTodoController extends GetxController {
  final namaController = TextEditingController();
  final deskripsiController = TextEditingController();
  final deadlineController = TextEditingController();

  var kategori = ["Sekolah", "Pribadi", "Pekerjaan"];
  var selectedKategori = "".obs;
  var deadline = Rxn<DateTime>();

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
        deadline: deadline.value,
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
    deadlineController.clear();
  }

  @override
  void onClose() {
    namaController.dispose();
    deskripsiController.dispose();
    selectedKategori.value = "";
    deadlineController.dispose();
    super.onClose();
  }

  void onChanged(String? newValue) {
    if (newValue != null && newValue != "") {
      setKategori(newValue);
    }
  }

  Future pickDeadline(BuildContext context) async {
    var pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate == null) return;
    if (!context.mounted) return;

    var pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    var dateTime = pickedTime == null
        ? DateTime(pickedDate.year, pickedDate.month, pickedDate.day)
        : DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );

    deadline.value = dateTime;
    deadlineController.text =
        "${dateTime.day} ${todoController.months[dateTime.month - 1]} ${dateTime.year} ${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}";
  }
}
