import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

import 'package:lms/app/features/book/controller/book_form_controller.dart';

class AddEditBookPage extends StatelessWidget {
  final BookFormController controller = Get.put(BookFormController());

  AddEditBookPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bookId = Get.parameters['id'];
    controller.loadBook(bookId);

    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () =>
              Text(controller.isEditMode.value ? 'Edit Book' : 'Add New Book'),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Obx(
        () => SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              // Cover preview
              Center(
                child: Column(
                  children: [
                    controller.coverPreview.value.isNotEmpty
                        ? Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child:
                                  controller.coverPreview.value.startsWith(
                                        'http',
                                      )
                                      ? Image.network(
                                        controller.coverPreview.value,
                                        height: 180,
                                      )
                                      : Image.file(
                                        File(controller.coverPreview.value),
                                        height: 180,
                                      ),
                            ),
                            Positioned(
                              right: -10,
                              top: -10,
                              child: IconButton(
                                onPressed: controller.clearImage,
                                icon: Icon(Icons.cancel, color: Colors.red),
                              ),
                            ),
                          ],
                        )
                        : Container(
                          height: 180,
                          width: 120,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                              style: BorderStyle.solid,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(child: Icon(Icons.upload_file)),
                        ),
                    TextButton(
                      onPressed: controller.pickImage,
                      child: Text(
                        controller.coverPreview.value.isEmpty
                            ? "Select Image"
                            : "Change Cover",
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Form
              _buildInput("Title", controller.title),
              _buildInput("Author", controller.author),
              _buildDropdown(
                "Category",
                controller.category,
                controller.categories,
              ),
              Row(
                children: [
                  Expanded(
                    child: _buildInput(
                      "Pages",
                      controller.pages,
                      isNumber: true,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: _buildInput(
                      "Published Year",
                      controller.publishedYear,
                      isNumber: true,
                    ),
                  ),
                ],
              ),
              _buildInput("Description", controller.description, maxLines: 4),
              SizedBox(height: 20),

              // Submit
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed:
                      controller.loading.value ? null : controller.submitForm,
                  icon: Icon(Icons.save),
                  label: Text(
                    controller.isEditMode.value ? "Update Book" : "Add Book",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInput(
    String label,
    RxString value, {
    bool isNumber = false,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Obx(
        () => TextFormField(
          initialValue: value.value,
          onChanged: (v) => value.value = v,
          keyboardType: isNumber ? TextInputType.number : TextInputType.text,
          maxLines: maxLines,
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(),
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown(String label, RxString value, List<String> items) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Obx(
        () => DropdownButtonFormField<String>(
          value: value.value.isEmpty ? null : value.value,
          onChanged: (v) => value.value = v ?? '',
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(),
          ),
          items:
              items
                  .where((e) => e != 'All')
                  .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                  .toList(),
        ),
      ),
    );
  }
}
