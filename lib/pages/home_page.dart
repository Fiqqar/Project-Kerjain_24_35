import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kerjain/colors/app_colors.dart';
import 'package:kerjain/routes/routes.dart';
import 'package:kerjain/widgets/custom_button.dart';
import 'package:kerjain/widgets/custom_card.dart';
import 'package:kerjain/widgets/custom_text.dart';
import 'package:kerjain/controllers/todo_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TodoController todoController = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.backgroundColor,
      body: Column(
        children: [
          CustomCard(
            color: ColorPalette.primaryColor,
            topRadius: 0,
            bottomRadius: 15,
            hasShadow: false,
            padding: const EdgeInsets.only(
              top: 25,
              left: 16,
              right: 16,
              bottom: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Beranda",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      textColor: ColorPalette.backgroundColor,
                    ),
                    const SizedBox(height: 4),
                    CustomText(
                      text: "Selamat datang kembali, Fiqar!",
                      fontSize: 14,
                      textColor: ColorPalette.backgroundColor.withValues(
                        alpha: 0.7,
                      ),
                    ),
                  ],
                ),

                CustomFloatingButton(
                  backgroundColor: ColorPalette.accentColor,
                  iconColor: Colors.white,
                  borderRadius: 12,
                  size: 45,
                  icon: Icons.add,
                  onPressed: () {
                    Get.toNamed(AppRoutes.addTodo);
                  },
                ),
              ],
            ),
          ),

          Expanded(
            child: Obx(
              () => ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: todoController.todos.length,
                itemBuilder: (context, index) {
                  final todo = todoController.todos[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 6),
                    child: CustomCard(
                      padding: EdgeInsets.zero,
                      hasShadow: false,
                      color: ColorPalette.primaryColorShade100,
                      topRadius: 15,
                      bottomRadius: 15,
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        leading: Checkbox(
                          value: todo.isCompleted,
                          activeColor: ColorPalette.accentColor,
                          checkColor: ColorPalette.backgroundColor,
                          side: BorderSide(
                            color: ColorPalette.primaryColor,
                            width: 1.5,
                          ),
                          onChanged: (_) {
                            todoController.toggleCompleted(index);
                          },
                        ),
                        title: CustomText(
                          text: todo.namaTodo,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          isLineThrough: todo.isCompleted,
                        ),
                        subtitle: CustomText(
                          text: todo.deskripsiTodo,
                          fontSize: 13,
                          textColor: ColorPalette.textColor.withValues(
                            alpha: 0.7,
                          ),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: todoController.getCategoryColor(
                                  todo.kategori,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: CustomText(
                                text: todo.kategori,
                                textColor: ColorPalette.backgroundColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 8),
                            IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                todoController.deleteTodo(index);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
