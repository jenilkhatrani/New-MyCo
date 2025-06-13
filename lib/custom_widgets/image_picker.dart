import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_myco/custom_widgets/custome_shadow_container.dart';
import 'package:path/path.dart' as path;
import '../themes_colors/app_theme.dart';
import '../themes_colors/colors.dart';
import 'new_myco_button.dart';

Future<File?> showImageFilePicker({
  required BuildContext context,
  bool? isDialog,
  bool? selectDocument,
}) async {
  return isDialog == true
      ? showDialog<File>(
          context: context,
          builder: (context) => AlertDialog(
            contentPadding: const EdgeInsets.all(0),
            backgroundColor: AppColors.white,
            content: _ImageFilePickerWidget(selectDocument: selectDocument),
          ),
        )
      : showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          builder: (context) =>
              _ImageFilePickerWidget(selectDocument: selectDocument),
        );
}

class _ImageFilePickerWidget extends StatefulWidget {
  final bool? selectDocument;
  const _ImageFilePickerWidget({this.selectDocument});

  @override
  State<_ImageFilePickerWidget> createState() => _ImageFilePickerWidgetState();
}

class _ImageFilePickerWidgetState extends State<_ImageFilePickerWidget> {
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Select option",
              style: TextStyle(
                fontSize: AppTheme.lightTheme.textTheme.titleLarge!.fontSize,
                color: AppColors.borderColor,
              ),
            ),
          ),

          Divider(height: 2),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 20),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => _pickImage(ImageSource.camera),
                  child: CustomShadowContainer(
                    image: Image.asset('assets/camera.png'),
                    title: 'Camera',
                  ),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () => _pickImage(ImageSource.gallery),
                  child: CustomShadowContainer(
                    image: Image.asset('assets/gallery-add.png'),
                    title: 'Gallery',
                  ),
                ),
                const SizedBox(width: 10),

                GestureDetector(
                  onTap: _pickDocument,
                  child: CustomShadowContainer(
                    image: Image.asset('assets/document.png'),
                    title: 'Documents',
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: MyCoButton(
              isShadowBottomLeft: true,
              onTap: () {
                Navigator.pop(context);
              },
              boarderRadius: 50,
              title: 'Cancel',
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: source,
        maxWidth: 800,
        maxHeight: 800,
        imageQuality: 80,
      );

      if (pickedFile != null) {
        final String extension = path.extension(pickedFile.path).toLowerCase();

        if (extension == '.png' ||
            extension == '.jpg' ||
            extension == '.heic' ||
            extension == '.jpeg') {
          final File imageFile = File(pickedFile.path);
          if (mounted) Navigator.pop(context, imageFile);
        } else {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Invalid file type. Use PNG, JPG, or JPEG."),
              ),
            );
          }
        }
      } else {
        Navigator.pop(context);
      }
    } catch (e) {
      print("Error picking image: $e");
      if (mounted) {
        Navigator.pop(context);
      }
    }
  }

  Future<void> _pickDocument() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc', 'docx', 'jpg', 'jpeg', 'heic', 'png'],
      );

      if (result != null && result.files.single.path != null) {
        final File file = File(result.files.single.path!);
        if (mounted) Navigator.pop(context, file);
      } else {
        Navigator.pop(context);
      }
    } catch (e) {
      print("Error picking document: $e");
      if (mounted) Navigator.pop(context);
    }
  }
}
