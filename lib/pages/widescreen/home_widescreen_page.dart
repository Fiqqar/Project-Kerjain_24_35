import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kerjain/colors/app_colors.dart';
import 'package:kerjain/routes/routes.dart';
import 'package:kerjain/widgets/custom_button.dart';
import 'package:kerjain/widgets/custom_card.dart';
import 'package:kerjain/widgets/custom_text.dart';
import 'package:kerjain/controllers/todo_controller.dart';
import 'package:kerjain/widgets/dialog.dart';

class HomeWidescreenPage extends StatelessWidget {
  HomeWidescreenPage({super.key});

  final todoController = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final sideBarWidth = width > 1200 ? 300.0 : width * 0.23;
    final contentPadding = width > 1000 ? 40.0 : 24.0;
    final gridCrossAxisCount = width > 1400
        ? 3
        : width > 1000
            ? 2
            : 1;

    return Scaffold(
      backgroundColor: ColorPalette.backgroundColor,
      body: Row(
        children: [
          Container(
            width: sideBarWidth,
            color: ColorPalette.primaryColor,
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "Kerjain",
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  textColor: ColorPalette.backgroundColor,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: CustomText(
                    text: "Beranda",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    textColor: ColorPalette.backgroundColor,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: CustomText(
                    text: "Selamat datang kembali, Admin!",
                    fontSize: 14,
                    textColor: ColorPalette.backgroundColor.withValues(
                      alpha: 0.7,
                    ),
                  ),
                ),
                const Spacer(),
                CustomFloatingButton(
                  backgroundColor: ColorPalette.primaryColor,
                  iconColor: Colors.white,
                  borderRadius: 12,
                  size: 45,
                  hasShadow: false,
                  icon: Icons.add,
                  onPressed: () {
                    Get.toNamed(AppRoutes.addResponsive);
                  },
                ),
              ],
            ),
          ),

          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: contentPadding,
                vertical: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "Daftar Kegiatan",
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    textColor: ColorPalette.primaryColor,
                  ),
                  Container(margin: const EdgeInsets.only(top: 20)),

                  Expanded(
                    child: Obx(() {
                      final todos = todoController.todos;
                      if (todos.isEmpty) {
                        return Center(
                          child: CustomText(
                            text: "Belum ada kegiatan",
                            fontSize: 16,
                            textColor: ColorPalette.textColor.withValues(
                              alpha: 0.7,
                            ),
                          ),
                        );
                      }

                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: gridCrossAxisCount,
                          crossAxisSpacing: 25,
                          mainAxisSpacing: 20,
                          childAspectRatio: 3.5,
                        ),
                        itemCount: todos.length,
                        itemBuilder: (context, index) {
                          final todo = todos[index];
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 4),
                            child: CustomCard(
                              padding: EdgeInsets.zero,
                              hasShadow: false,
                              color: ColorPalette.primaryColorShade100,
                              topRadius: 15,
                              bottomRadius: 15,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Checkbox(
                                      value: todo.isCompleted,
                                      activeColor: ColorPalette.accentColor,
                                      checkColor:
                                          ColorPalette.backgroundColor,
                                      side: BorderSide(
                                        color: ColorPalette.primaryColor,
                                        width: 1.5,
                                      ),
                                      onChanged: (_) => todoController
                                          .toggleCompleted(index),
                                    ),
                                    Container(width: 12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CustomText(
                                            text: todo.namaTodo,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            isLineThrough: todo.isCompleted,
                                          ),
                                          if (todo.deskripsiTodo.isNotEmpty)
                                            Container(
                                              margin:
                                                  const EdgeInsets.only(top: 4),
                                              child: CustomText(
                                                text: todo.deskripsiTodo,
                                                fontSize: 12,
                                                textColor: ColorPalette
                                                    .textColor
                                                    .withValues(alpha: 0.7),
                                              ),
                                            ),
                                          Container(
                                            margin:
                                                const EdgeInsets.only(top: 2),
                                            child: CustomText(
                                              text: todoController
                                                  .getDeadlineDate(todo),
                                              fontSize: 12,
                                              textColor: ColorPalette.textColor
                                                  .withValues(alpha: 0.5),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 12,right: 12),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color:
                                            todoController.getCategoryColor(
                                          todo.kategori,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12),
                                      ),
                                      child: CustomText(
                                        text: todo.kategori,
                                        textColor:
                                            ColorPalette.backgroundColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                    Container(width: 6),
                                    IconButton(
                                      icon: Icon(
                                        Icons.delete,
                                        color: ColorPalette.r,
                                      ),
                                      tooltip: "Hapus",
                                      onPressed: () => todoController
                                          .deleteTodo(todo.id!),
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        Icons.edit,
                                        color: ColorPalette.o,
                                      ),
                                      tooltip: "Edit",
                                      onPressed: () {
                                        todoController.startEditing(todo);
                                        Get.dialog(
                                          EditKegiatanDialog(
                                            todoController: todoController,
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
