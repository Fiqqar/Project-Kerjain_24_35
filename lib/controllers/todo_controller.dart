import 'dart:ui';

import 'package:get/get.dart';
import 'package:kerjain/colors/app_colors.dart';
import 'package:kerjain/model/todo_model.dart';

class TodoController extends GetxController {
  var todos = <TodoModel>[].obs;
  var history = <TodoModel>[].obs;


  final List<String> months = const [
    "Januari",
    "Februari",
    "Maret",
    "April",
    "Mei",
    "Juni",
    "Juli",
    "Agustus",
    "September",
    "Oktober",
    "November",
    "Desember",
  ];

  @override
  void onInit() {
    super.onInit();

    todos.addAll([
      TodoModel(
        namaTodo: "Tugas B. Inggris",
        deskripsiTodo: "Tugas video iklan",
        kategori: "Sekolah",
        deadline: DateTime.now().add(Duration(days: 2)),
      ),
      TodoModel(
        namaTodo: "Belajar 3D Modelling",
        deskripsiTodo: "Belajar UV Mapping",
        kategori: "Pribadi",
        deadline: DateTime.now().add(Duration(days: 5)),
      ),
      TodoModel(
        namaTodo: "Meeting dengan client",
        deskripsiTodo: "Rapat Kesepakatan Harga Web",
        kategori: "Pekerjaan",
        deadline: DateTime.now().add(Duration(days: 1)),
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
    "Pekerjaan": ColorPalette.o,
  };

  getCategoryColor(String kategori) {
    return categoryColors[kategori] ?? ColorPalette.textColor;
  }

  void deleteTodo(int index) {
    todos[index].completedAt = DateTime.now();
    history.add(todos[index]);
    todos.removeAt(index);
  }

  void deleteHistory(int index) {
    history.removeAt(index);
    Get.snackbar('Berhasil', 'Kegiatan berhasil di hapus');
  }

  String getCompleted(todo) {
    var c = todo.completedAt;
    return (todo.isCompleted && todo.completedAt != null)
        ? "Diselesaikan pada : ${c.day} ${months[c.month - 1]} ${c.year} ${c.hour.toString().padLeft(2,'0')}:${c.minute.toString().padLeft(2,'0')}"
        : "Dihapus pada : ${c.day} ${months[c.month - 1]} ${c.year} ${c.hour.toString().padLeft(2,'0')}:${c.minute.toString().padLeft(2,'0')}"
;
  }

  String getDeadline(todo) {
    return (todo.isCompleted && todo.completedAt != null)
        ? (todo.completedAt!.isAfter(todo.deadline!)
            ? "Tidak selesai tepat waktu"
            : "Selesai tepat waktu")
        : "Tidak selesai";
  }
  Color getDoneColor(todo) {
    return todo.isCompleted == true
        ? ColorPalette.history
        : ColorPalette.notCheckedHistory;
  }
  String getTodoName(todo) {
    return todo.deskripsiTodo.trim() == ''
        ? todo.namaTodo
        : "${todo.namaTodo} - ${todo.deskripsiTodo}";
  }
  String getDeadlineDate(todo) {
    if (todo.deadline == null) return "Belum ditentukan";

    final d = todo.deadline!;
    return "Deadline: ${d.day} ${months[d.month - 1]} ${d.year} ${d.hour.toString().padLeft(2,'0')}:${d.minute.toString().padLeft(2,'0')}";
  }
}
