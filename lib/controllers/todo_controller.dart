import 'dart:ui';
import 'package:get/get.dart';
import 'package:kerjain/colors/app_colors.dart';
import 'package:kerjain/helper/db_helper.dart';
import 'package:kerjain/model/todo_model.dart';

class TodoController extends GetxController {
  var todos = <TodoModel>[].obs;
  var history = <TodoModel>[].obs;
  final dbHelper = DBHelper();

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

  // Ambil semua todo dari DB
  Future<void> fetchTodos() async {
    final list = await dbHelper.getTodos();
    todos.value = list.map((e) => TodoModel(
      id: e['id'],
      namaTodo: e['namatodo'],
      deskripsiTodo: e['deskripsitodo'],
      kategori: e['kategori'],
      isCompleted: e['iscompleted'] == 1,
      completedAt: e['completedat'] != null ? DateTime.tryParse(e['completedat']) : null,
      deadline: e['deadline'] != null ? DateTime.tryParse(e['deadline']) : null,
    )).toList();
  }

  Future<void> addTodo(TodoModel todo) async {
    await dbHelper.insertTodo({
      'namatodo': todo.namaTodo,
      'deskripsitodo': todo.deskripsiTodo,
      'kategori': todo.kategori,
      'iscompleted': todo.isCompleted ? 1 : 0,
      'completedat': todo.completedAt?.toIso8601String(),
      'deadline': todo.deadline?.toIso8601String(),
    });
    await fetchTodos();
  }

  Future<void> updateTodo(TodoModel todo) async {
    await dbHelper.updateTodo(todo.id!, {
      'namatodo': todo.namaTodo,
      'deskripsitodo': todo.deskripsiTodo,
      'kategori': todo.kategori,
      'iscompleted': todo.isCompleted ? 1 : 0,
      'completedat': todo.completedAt?.toIso8601String(),
      'deadline': todo.deadline?.toIso8601String(),
    });
    await fetchTodos();
  }

  Future<void> deleteTodo(int id) async {
    await dbHelper.deleteTodo(id);
    await fetchTodos();
  }

  // Toggle status selesai, update DB
  Future<void> toggleCompleted(int index) async {
    final todo = todos[index];
    todo.isCompleted = !todo.isCompleted;
    todo.completedAt = todo.isCompleted ? DateTime.now() : null;
    await updateTodo(todo);
  }

  Future<void> moveToHistory(int index) async {
    final todo = todos[index];
    todo.completedAt = DateTime.now();
    history.add(todo);
    await deleteTodo(todo.id!);
  }

  void deleteHistory(int index) {
    history.removeAt(index);
    Get.snackbar('Berhasil', 'Kegiatan berhasil dihapus');
  }

  Map<String, Color> categoryColors = {
    "Sekolah": ColorPalette.b,
    "Pribadi": ColorPalette.g,
    "Pekerjaan": ColorPalette.o,
  };

  getCategoryColor(String kategori) {
    return categoryColors[kategori] ?? ColorPalette.textColor;
  }

  String getCompleted(TodoModel todo) {
    var c = todo.completedAt;
    return (todo.isCompleted && todo.completedAt != null)
        ? "Diselesaikan pada : ${c!.day} ${months[c.month - 1]} ${c.year} ${c.hour.toString().padLeft(2,'0')}:${c.minute.toString().padLeft(2,'0')}"
        : "Dihapus pada : ${c!.day} ${months[c.month - 1]} ${c.year} ${c.hour.toString().padLeft(2,'0')}:${c.minute.toString().padLeft(2,'0')}";
  }

  String getDeadline(TodoModel todo) {
    return (todo.isCompleted && todo.completedAt != null)
        ? (todo.completedAt!.isAfter(todo.deadline!)
            ? "Tidak selesai tepat waktu"
            : "Selesai tepat waktu")
        : "Tidak selesai";
  }

  Color getDoneColor(TodoModel todo) {
    return todo.isCompleted == true
        ? ColorPalette.history
        : ColorPalette.notCheckedHistory;
  }

  String getTodoName(TodoModel todo) {
    return todo.deskripsiTodo.trim() == ''
        ? todo.namaTodo
        : "${todo.namaTodo} - ${todo.deskripsiTodo}";
  }

  String getDeadlineDate(TodoModel todo) {
    if (todo.deadline == null) return "Belum ditentukan";
    final d = todo.deadline!;
    return "Deadline: ${d.day} ${months[d.month - 1]} ${d.year} ${d.hour.toString().padLeft(2,'0')}:${d.minute.toString().padLeft(2,'0')}";
  }

  @override
  void onInit() {
    super.onInit();
    fetchTodos();
  }
}
