import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kerjain/colors/app_colors.dart';
import 'package:kerjain/widgets/custom_card.dart';
import 'package:kerjain/widgets/custom_text.dart';
import 'package:kerjain/controllers/todo_controller.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});

  final TodoController controller = Get.find<TodoController>();

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
            padding: EdgeInsets.only(top: 25, left: 16, right: 16, bottom: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 4),
                      child: CustomText(
                        text: "History",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        textColor: ColorPalette.backgroundColor,
                      ),
                    ),

                    CustomText(
                      text: "Riwayat dari kegiatanmu",
                      fontSize: 14,
                      textColor: ColorPalette.backgroundColor.withValues(
                        alpha: 0.7,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Expanded(
            child: Obx(() {
              final historyTodos = controller.history;

              if (historyTodos.isEmpty) {
                return Center(
                  child: CustomText(
                    text: "Belum ada kegiatan di history",
                    fontSize: 14,
                    textColor: ColorPalette.textColor.withValues(alpha: 0.7),
                  ),
                );
              }

              return ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: historyTodos.length,
                itemBuilder: (context, index) {
                  final todo = historyTodos[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 6),
                    child: CustomCard(
                      padding: EdgeInsets.zero,
                      hasShadow: false,
                      color: controller.getDoneColor(todo),
                      topRadius: 15,
                      bottomRadius: 15,
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        leading: Icon(
                          Icons.history,
                          color: ColorPalette.backgroundColor,
                        ),
                        title: CustomText(
                          text: controller.getTodoName(todo),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: controller.getCompleted(todo),
                              fontSize: 10,
                              textColor: ColorPalette.textColor.withValues(
                                alpha: 0.7,
                              ),
                            ),
                            CustomText(
                              text: controller.getDeadline(todo),
                              fontSize: 10,
                              textColor: ColorPalette.textColor.withValues(
                                alpha: 0.5,
                              ),
                              fontWeight: FontWeight.bold,
                            ),
                          ],
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
                                color: controller.getCategoryColor(
                                  todo.kategori,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: CustomText(
                                text: todo.kategori,
                                textColor: ColorPalette.backgroundColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.delete, color: ColorPalette.r),
                              onPressed: () {
                                controller.deleteHistory(index);
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
    );
  }
}
