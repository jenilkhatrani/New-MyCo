import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import '../themes_colors/app_theme.dart';
import '../themes_colors/colors.dart';
import 'dashed_border_container_theme.dart';

class CustomImagePickerContainer extends StatefulWidget {
  final double? imageMargin;
  final double? imageHeight;

  const CustomImagePickerContainer({
    super.key,
    this.imageMargin,
    this.imageHeight,
  });

  @override
  State<CustomImagePickerContainer> createState() =>
      _CustomImagePickerContainerState();
}

class _CustomImagePickerContainerState
    extends State<CustomImagePickerContainer> {
  File? _pickedImage;
  File? pickedFile;

  final ImagePicker _picker = ImagePicker();

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
          setState(() {
            _pickedImage = File(pickedFile.path);
          });
        } else {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Invalid file type. Please select a PNG, JPG, JPEG or HEIC image.',
                ),
              ),
            );
          }
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error picking image: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
          ),
          context: context,
          builder: (context) {
            return SizedBox(
              height: 90,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        _pickImage(ImageSource.gallery);
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.photo_library, size: 35),
                          const SizedBox(height: 6),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        // showImageFilePicker(
                        //   context: context,
                        //   selectDocument: false,
                        // );
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.camera_alt, size: 35),
                          const SizedBox(height: 6),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: DashedBorderContainer(
        borderRadius: 8,
        borderColor: AppColors.primary,
        padding: const EdgeInsets.all(0),
        child: _pickedImage != null
            ? Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.file(
                      _pickedImage!,
                      width: double.infinity,
                      height: 160,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    right: 6,
                    top: 6,
                    child: GestureDetector(
                      onTap: () => setState(() => _pickedImage = null),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.removeBackground,
                          border: Border.all(color: AppColors.remove),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          "Remove",
                          style: TextStyle(
                            fontSize:
                                AppTheme
                                    .lightTheme
                                    .textTheme
                                    .bodyLarge!
                                    .fontSize ??
                                14,
                            color: AppColors.error,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.imagePickerBg,
                ),
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                height: widget.imageHeight ?? 160,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/gallery-export.png',
                      width: 30,
                      height: 30,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Capture Image',
                      style: TextStyle(
                        fontSize:
                            AppTheme.lightTheme.textTheme.bodyLarge!.fontSize ??
                            16,
                        fontFamily: "Gilroy-SemiBold",
                        fontWeight: FontWeight.w400,
                        color: AppColors.titleColor,
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
