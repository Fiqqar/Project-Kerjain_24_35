import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kerjain/colors/app_colors.dart';
import 'package:kerjain/controllers/todo_controller.dart';
import 'custom_dropdown.dart';
import 'custom_button.dart';
import 'custom_txtfield.dart';

class EditKegiatanDialog extends StatelessWidget {
  final TodoController todoController;

  const EditKegiatanDialog({super.key, required this.todoController});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AlertDialog(
        backgroundColor: ColorPalette.backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Text(
          'Edit Kegiatan',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: ColorPalette.textColor,
          ),
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTxtfield(
                hintText: 'Nama Kegiatan',
                controller: todoController.editNamaController,
                borderColor: ColorPalette.primaryColor,
                focusedBorderColor: ColorPalette.primaryGradientColor,
                hintTextColor: ColorPalette.primaryColor.withOpacity(0.7),
                textColor: ColorPalette.textColor,
              ),
              const SizedBox(height: 12),
              CustomTxtfield(
                hintText: 'Deskripsi Kegiatan',
                controller: todoController.editDeskripsiController,
                borderColor: ColorPalette.primaryColor,
                focusedBorderColor: ColorPalette.primaryGradientColor,
                hintTextColor: ColorPalette.primaryColor.withOpacity(0.7),
                textColor: ColorPalette.textColor,
              ),
              const SizedBox(height: 12),
              CustomDropdown(
                value: todoController.selectedKategori.value.isEmpty
                    ? null
                    : todoController.selectedKategori.value,
                hint: 'Pilih Kategori',
                items: ['Sekolah', 'Pribadi', 'Pekerjaan'],
                onChanged: (value) {
                  if (value != null) todoController.setKategori(value);
                },
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      todoController.selectedDeadline.value != null
                          ? "${todoController.selectedDeadline.value!.day} ${todoController.months[todoController.selectedDeadline.value!.month - 1]} ${todoController.selectedDeadline.value!.year} ${todoController.selectedDeadline.value!.hour.toString().padLeft(2, '0')}:${todoController.selectedDeadline.value!.minute.toString().padLeft(2, '0')}"
                          : "Belum ditentukan",
                      style: TextStyle(fontSize: 12, color: ColorPalette.textColor),
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      final pickedDate = await showDatePicker(
                        context: context,
                        initialDate: todoController.selectedDeadline.value ?? DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      if (pickedDate == null) return;

                      final pickedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.fromDateTime(
                          todoController.selectedDeadline.value ?? DateTime.now(),
                        ),
                      );

                      DateTime finalDeadline = pickedTime == null
                          ? DateTime(
                              pickedDate.year,
                              pickedDate.month,
                              pickedDate.day,
                            )
                          : DateTime(
                              pickedDate.year,
                              pickedDate.month,
                              pickedDate.day,
                              pickedTime.hour,
                              pickedTime.minute,
                            );
                      todoController.setDeadline(finalDeadline);
                    },
                    child: const Text('Pilih Deadline'),
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          CustomButton(
            label: 'Batal',
            color: ColorPalette.backgroundColor,
            borderRadius: 15,
            textColor: ColorPalette.primaryColor,
            fontWeight: FontWeight.w500,
            onPressed: () {
              todoController.clearEditing();
              Get.back();
            },
          ),
          CustomButton(
            label: 'Simpan',
            color: ColorPalette.primaryColor,
            borderRadius: 15,
            onPressed: () async {
              await todoController.saveEditing();
            },
          ),
        ],
      );
    });
  }
}

Future<void> showUpdateDialog({
  required BuildContext context,
  required TodoController todoController,
}) {
  return showDialog(
    context: context,
    builder: (_) => EditKegiatanDialog(todoController: todoController),
  );
}
