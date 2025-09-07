import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kerjain/colors/app_colors.dart';

import 'package:kerjain/controllers/addtodo_controller.dart';
import 'package:kerjain/widgets/custom_button.dart';
import 'package:kerjain/widgets/custom_text.dart';
import 'package:kerjain/widgets/custom_txtfield.dart';
import 'package:kerjain/widgets/custom_radio.dart';
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: CustomCard(
          hasShadow: false,
          color: ColorPalette.primaryColorShade100,
          topRadius: 15,
          bottomRadius: 15,
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTxtfield(
                hintText: "Nama kegiatan",
                controller: addTodoController.namaController,
                textColor: ColorPalette.textColor,
                hintTextColor: ColorPalette.textColor.withValues(alpha: 0.5),
                borderColor: ColorPalette.primaryColor,
                focusedBorderColor: ColorPalette.accentColor,
              ),
              SizedBox(height: 16),

              CustomTxtfield(
                hintText: "Deskripsi (opsional)",
                controller: addTodoController.deskripsiController,
                textColor: ColorPalette.textColor,
                hintTextColor: ColorPalette.textColor.withValues(alpha: 0.5),
                borderColor: ColorPalette.primaryColor,
                focusedBorderColor: ColorPalette.accentColor,
              ),
              SizedBox(height: 16),

              CustomText(
                text: "Kategori",
                fontSize: 16,
                textColor: ColorPalette.textColor,
              ),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 2,
                  children: [
                    CustomRadio(
                      value: "Sekolah",
                      groupValue: addTodoController.selectedKategori.value,
                      label: "Sekolah",
                      onChanged: (val) => addTodoController.setKategori(val!),
                    ),
                    CustomRadio(
                      value: "Pribadi",
                      groupValue: addTodoController.selectedKategori.value,
                      label: "Pribadi",
                      onChanged: (val) => addTodoController.setKategori(val!),
                    ),
                    CustomRadio(
                      value: "Pekerjaan",
                      groupValue: addTodoController.selectedKategori.value,
                      label: "Pekerjaan",
                      onChanged: (val) => addTodoController.setKategori(val!),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),

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
                    SizedBox(width: 16),
                    Expanded(
                      child: CustomButton(
                        label: "Tambahkan",
                        onPressed: () {
                          addTodoController.addTodo();
                          addTodoController.clearFields();
                          Get.back();
                        },
                        color: ColorPalette.accentColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
