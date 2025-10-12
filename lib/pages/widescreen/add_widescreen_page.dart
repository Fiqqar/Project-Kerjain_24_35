import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kerjain/colors/app_colors.dart';
import 'package:kerjain/controllers/addtodo_controller.dart';
import 'package:kerjain/widgets/custom_button.dart';
import 'package:kerjain/widgets/custom_dropdown.dart';
import 'package:kerjain/widgets/custom_text.dart';
import 'package:kerjain/widgets/custom_txtfield.dart';
import 'package:kerjain/widgets/custom_card.dart';

class AddTodoWidescreenPage extends StatelessWidget {
  AddTodoWidescreenPage({super.key});

  final addTodoController = Get.find<AddTodoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.backgroundColor,
      appBar: AppBar(
        title: CustomText(
          text: "Tambah Kegiatan",
          textColor: ColorPalette.backgroundColor,
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
        backgroundColor: ColorPalette.primaryColor,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 800),
          margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: CustomCard(
              hasShadow: false,
              color: ColorPalette.primaryColorShade100,
              topRadius: 12,
              bottomRadius: 12,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "Detail Kegiatan",
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    textColor: ColorPalette.textColor,
                  ),
                  const SizedBox(height: 12),
                  CustomTxtfield(
                    hintText: "Nama kegiatan",
                    controller: addTodoController.namaController,
                    textColor: ColorPalette.textColor,
                    hintTextColor:
                        ColorPalette.textColor.withValues(alpha: 0.5),
                    borderColor: ColorPalette.primaryColor,
                    focusedBorderColor: ColorPalette.accentColor,
                  ),
                  const SizedBox(height: 12),
                  CustomTxtfield(
                    hintText: "Deskripsi (opsional)",
                    controller: addTodoController.deskripsiController,
                    textColor: ColorPalette.textColor,
                    hintTextColor:
                        ColorPalette.textColor.withValues(alpha: 0.5),
                    borderColor: ColorPalette.primaryColor,
                    focusedBorderColor: ColorPalette.accentColor,
                  ),
                  const SizedBox(height: 12),
                  Obx(
                    () => CustomDropdown(
                      value: addTodoController.selectedKategori.value,
                      hint: "Pilih kategori",
                      items: addTodoController.kategori,
                      onChanged: (newValue) {
                        addTodoController.onChanged(newValue);
                      },
                    ),
                  ),
                  const SizedBox(height: 24),
                  CustomText(
                    text: "Deadline & Aksi",
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    textColor: ColorPalette.textColor,
                  ),
                  const SizedBox(height: 12),
                  CustomTxtfield(
                    readOnly: true,
                    hintText: "Pilih Deadline",
                    controller: addTodoController.deadlineController,
                    textColor: ColorPalette.textColor,
                    suffixIcon: Icon(
                      Icons.calendar_month_rounded,
                      color: ColorPalette.textColor,
                      size: 20,
                    ),
                    hintTextColor:
                        ColorPalette.textColor.withValues(alpha: 0.5),
                    borderColor: ColorPalette.primaryColor,
                    focusedBorderColor: ColorPalette.accentColor,
                    onTap: () {
                      addTodoController.pickDeadline(context);
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
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
                      const SizedBox(width: 12),
                      Expanded(
                        child: CustomButton(
                          label: "Tambahkan",
                          onPressed: () {
                            addTodoController.addTodo();
                            addTodoController.clearFields();
                          },
                          color: ColorPalette.accentColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
