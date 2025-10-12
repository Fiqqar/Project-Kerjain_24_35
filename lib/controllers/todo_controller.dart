import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:kerjain/colors/app_colors.dart';
import 'package:kerjain/helper/db_helper.dart';
import 'package:kerjain/model/todo_model.dart';

class TodoController extends GetxController {
  var todos = <TodoModel>[].obs;
  var history = <TodoModel>[].obs;
  final dbHelper = DBHelper();

  final editNamaController = TextEditingController();
  final editDeskripsiController = TextEditingController();
  var selectedKategori = ''.obs;
  var selectedDeadline = Rxn<DateTime>();
  var isSaving = false.obs;
  var isMobile = true.obs;

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

  void updateLayout(BoxConstraints constraints) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        isMobile.value = constraints.maxWidth < 600;
      });
  }
  TodoModel? editingTodo;

  Future<void> fetchTodos() async {
    final list = await dbHelper.getTodos();
    todos.value = list
        .map(
          (e) => TodoModel(
            id: e['id'],
            namaTodo: e['namatodo'],
            deskripsiTodo: e['deskripsitodo'],
            kategori: e['kategori'],
            isCompleted: e['iscompleted'] == 1,
            completedAt: e['completedat'] != null
                ? DateTime.tryParse(e['completedat'])
                : null,
            deadline: e['deadline'] != null
                ? DateTime.tryParse(e['deadline'])
                : null,
          ),
        )
        .toList();
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
    final todo = todos.firstWhereOrNull((t) => t.id == id);
    if (todo == null) return;

    todo.completedAt ??= DateTime.now();
    history.add(todo);

    await dbHelper.deleteTodo(id);
    await fetchTodos();
  }

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

  void addToHistory(TodoModel todo) {
    history.add(todo);
    history.refresh();
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
        ? "Diselesaikan pada : ${c!.day} ${months[c.month - 1]} ${c.year} ${c.hour.toString().padLeft(2, '0')}:${c.minute.toString().padLeft(2, '0')}"
        : "Dihapus pada : ${c!.day} ${months[c.month - 1]} ${c.year} ${c.hour.toString().padLeft(2, '0')}:${c.minute.toString().padLeft(2, '0')}";
  }

  String getDeadline(TodoModel todo) {
    return (todo.isCompleted && todo.completedAt != null)
        ? (todo.completedAt!.isAfter(todo.deadline!)
              ? "Selesai tepat waktu"
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
    return "Deadline: ${d.day} ${months[d.month - 1]} ${d.year} ${d.hour.toString().padLeft(2, '0')}:${d.minute.toString().padLeft(2, '0')}";
  }

  void startEditing(TodoModel todo) {
    editingTodo = todo;
    editNamaController.text = todo.namaTodo;
    editDeskripsiController.text = todo.deskripsiTodo;
    selectedKategori.value = todo.kategori;
    selectedDeadline.value = todo.deadline;
  }

  void setKategori(String kategori) {
    selectedKategori.value = kategori;
  }

  void setDeadline(DateTime? deadline) {
    selectedDeadline.value = deadline;
  }

  void clearEditing() {
    editingTodo = null;
    editNamaController.clear();
    editDeskripsiController.clear();
    selectedKategori.value = '';
    selectedDeadline.value = null;
  }

  Future<void> saveEditing() async {
    if (isSaving.value) return;
    isSaving.value = true;

    if (editNamaController.text.trim().isEmpty) {
      Get.snackbar('Error', 'Nama kegiatan tidak boleh kosong');
      isSaving.value = false;
      return;
    }

    if (editingTodo == null) {
      isSaving.value = false;
      return;
    }

    TodoModel updatedTodo = TodoModel(
      id: editingTodo!.id,
      namaTodo: editNamaController.text,
      deskripsiTodo: editDeskripsiController.text,
      kategori: selectedKategori.value,
      isCompleted: editingTodo!.isCompleted,
      completedAt: editingTodo!.completedAt,
      deadline: selectedDeadline.value,
    );

    await updateTodo(updatedTodo);
    clearEditing();
    Get.back();
    Get.snackbar('Berhasil', 'Kegiatan berhasil diperbarui');
    isSaving.value = false;
  }

  @override
  void onInit() {
    super.onInit();
    fetchTodos();
  }

  @override
  void onClose() {
    editNamaController.dispose();
    editDeskripsiController.dispose();
    super.onClose();
  }
}
