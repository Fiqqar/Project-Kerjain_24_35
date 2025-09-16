class TodoModel {
  final String namaTodo;
  final String deskripsiTodo;
  final String kategori;
  bool isCompleted;
  DateTime? completedAt;
  DateTime? deadline;

  TodoModel({
    required this.namaTodo,
    required this.deskripsiTodo,
    required this.kategori,
    this.isCompleted = false, 
    this.completedAt,
    this.deadline,
  });
}