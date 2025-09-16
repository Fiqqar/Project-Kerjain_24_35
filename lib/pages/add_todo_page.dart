import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kerjain/colors/app_colors.dart';

import 'package:kerjain/controllers/addtodo_controller.dart';
import 'package:kerjain/widgets/custom_button.dart';
import 'package:kerjain/widgets/custom_dropdown.dart';
import 'package:kerjain/widgets/custom_text.dart';
import 'package:kerjain/widgets/custom_txtfield.dart';
import 'package:kerjain/widgets/custom_card.dart';

class AddTodoPage extends StatelessWidget {
  const AddTodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AddTodoController addTodoController = Get.find<AddTodoController>();

    return Scaffold(
      backgroundColor: ColorPalette.backgroundColor,
      appBar: AppBar(
        title: CustomText(
          text: "Tambah Kegiatan",
          textColor: ColorPalette.backgroundColor,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        backgroundColor: ColorPalette.primaryColor,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: CustomCard(
            hasShadow: false,
            color: ColorPalette.primaryColorShade100,
            topRadius: 15,
            bottomRadius: 15,
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 16),
                  child: CustomTxtfield(
                    hintText: "Nama kegiatan",
                    controller: addTodoController.namaController,
                    textColor: ColorPalette.textColor,
                    hintTextColor: ColorPalette.textColor.withValues(
                      alpha: 0.5,
                    ),
                    borderColor: ColorPalette.primaryColor,
                    focusedBorderColor: ColorPalette.accentColor,
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(bottom: 16),
                  child: CustomTxtfield(
                    hintText: "Deskripsi (opsional)",
                    controller: addTodoController.deskripsiController,
                    textColor: ColorPalette.textColor,
                    hintTextColor: ColorPalette.textColor.withValues(
                      alpha: 0.5,
                    ),
                    borderColor: ColorPalette.primaryColor,
                    focusedBorderColor: ColorPalette.accentColor,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 24),
                  child: Obx(
                    () => CustomDropdown(
                      value: addTodoController.selectedKategori.value,
                      hint: "Pilih kategori",
                      items: addTodoController.kategori,
                      onChanged: (newValue) {
                        addTodoController.onChanged(newValue);
                      },
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 16),
                  child: CustomTxtfield(
                    readOnly: true,
                    hintText: "Pilih Deadline",
                    controller: addTodoController.deadlineController,
                    textColor: ColorPalette.textColor,
                    suffixIcon: Icon(
                      Icons.calendar_month_rounded,
                      color: ColorPalette.textColor,
                    ),
                    hintTextColor: ColorPalette.textColor.withValues(
                      alpha: 0.5,
                    ),
                    borderColor: ColorPalette.primaryColor,
                    focusedBorderColor: ColorPalette.accentColor,
                    onTap: () {
                      addTodoController.pickDeadline(context);
                    },
                  ),
                ),
                Center(
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          label: "Clear",
                          onPressed: () {
                            addTodoController.clearFields();
                          },
                          color: ColorPalette.textColor,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 16),
                          child: CustomButton(
                            label: "Tambahkan",
                            onPressed: () {
                              addTodoController.addTodo();
                              addTodoController.clearFields();
                            },
                            color: ColorPalette.accentColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
