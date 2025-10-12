import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kerjain/colors/app_colors.dart';
import 'package:kerjain/widgets/custom_card.dart';
import 'package:kerjain/widgets/custom_text.dart';
import 'package:kerjain/controllers/todo_controller.dart';
import 'package:kerjain/model/todo_model.dart';

class HistoryWidescreenPage extends StatelessWidget {
  HistoryWidescreenPage({super.key});

  final TodoController controller = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final sideBarWidth = width > 1200 ? 300.0 : width * 0.23;
    final contentPadding = width > 1000 ? 40.0 : 24.0;

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
                    text: "Riwayat",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    textColor: ColorPalette.backgroundColor,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: CustomText(
                    text: "Kegiatan yang telah selesai",
                    fontSize: 14,
                    textColor: ColorPalette.backgroundColor.withValues(
                      alpha: 0.7,
                    ),
                  ),
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
                    text: "Riwayat Kegiatan",
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    textColor: ColorPalette.primaryColor,
                  ),
                  Container(margin: const EdgeInsets.only(top: 20)),

                  Expanded(
                    child: Obx(() {
                      final List<TodoModel> historyTodos = controller.history;

                      if (historyTodos.isEmpty) {
                        return Center(
                          child: CustomText(
                            text: "Belum ada kegiatan di history",
                            fontSize: 16,
                            textColor: ColorPalette.textColor.withValues(
                              alpha: 0.7,
                            ),
                          ),
                        );
                      }

                      return ListView.builder(
                        padding: const EdgeInsets.all(10),
                        itemCount: historyTodos.length,
                        itemBuilder: (context, index) {
                          final todo = historyTodos[index];
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            child: CustomCard(
                              padding: EdgeInsets.zero,
                              hasShadow: false,
                              color: controller.getDoneColor(todo),
                              topRadius: 15,
                              bottomRadius: 15,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.history,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CustomText(
                                            text: controller.getTodoName(todo),
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          CustomText(
                                            text:
                                                controller.getCompleted(todo),
                                            fontSize: 12,
                                            textColor: ColorPalette.textColor
                                                .withValues(alpha: 0.7),
                                          ),
                                          CustomText(
                                            text: controller.getDeadline(todo),
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            textColor: ColorPalette.textColor
                                                .withValues(alpha: 0.5),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 12),
                                      padding: const EdgeInsets.symmetric(
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
                                        textColor:
                                            ColorPalette.backgroundColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        Icons.delete,
                                        color: ColorPalette.r,
                                      ),
                                      tooltip: "Hapus",
                                      onPressed: () =>
                                          controller.deleteHistory(index),
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
