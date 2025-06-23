import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import '../../themes_colors/app_theme.dart';
import '../../themes_colors/colors.dart';
import 'dashed_border_container.dart';
import 'image_picker.dart';

class CustomImagePickerContainer extends StatefulWidget {
  final double? containerHeight;
  final double? containerWidth;
  final double? borderRadius;
  final String? title;
  final Color? backgroundColor;
  final Color? borderColor;
  final bool? isTitle;
  final String? imagePath;
  final String? imageTitle;
  final bool? isCameraShow;
  final bool? isGallaryShow;
  final bool? isDocumentShow;

  const CustomImagePickerContainer({
    super.key,
    this.containerHeight,
    this.title,
    this.backgroundColor = AppColors.imagePickerBg,
    this.borderRadius,
    this.isTitle = false,
    this.containerWidth,
    this.imagePath,
    this.isCameraShow,
    this.isGallaryShow,
    this.isDocumentShow,
    this.imageTitle,
    this.borderColor,
  });

  @override
  State<CustomImagePickerContainer> createState() =>
      _CustomImagePickerContainerState();
}

class _CustomImagePickerContainerState
    extends State<CustomImagePickerContainer> {
  File? _pickedImage;
  File? pickedFile;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.isTitle == true)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              widget.isTitle == true ? widget.title ?? "Title" : "",
              style: const TextStyle(
                fontSize: 14,
                fontFamily: "Gilroy-Bold",
                fontWeight: FontWeight.w400,
                color: AppColors.titleColor,
              ),
            ),
          ),
        GestureDetector(
          onTap: () {
            if (_pickedImage == null && pickedFile == null) {
              openImagePicker(
                context,
                widget.isDocumentShow ?? true,
                widget.isCameraShow ?? true,
                widget.isGallaryShow ?? true,
              );
            }
          },

          child: DesignBorderContainer(
            borderRadius: widget.borderRadius ?? 12,
            width: widget.containerWidth ?? double.infinity,
            borderColor: widget.borderColor ?? AppColors.primary,
            backgroundColor: widget.backgroundColor ?? AppColors.imagePickerBg,
            padding: const EdgeInsets.all(0),
            child: _pickedImage != null
                ? Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            widget.borderRadius ?? 12,
                          ),
                        ),
                        height: widget.containerHeight ?? 160,

                        child: Image.file(
                          _pickedImage!,
                          width: double.infinity,
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
                                    Theme.of(
                                      context,
                                    ).textTheme.bodyMedium?.fontSize ??
                                    14,
                                color: AppColors.error,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : pickedFile != null
                ? Row(
                    children: [
                      Icon(
                        Icons.insert_drive_file,
                        color: AppColors.primary,
                        size: 40,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          path.basename(pickedFile!.path),
                          style: TextStyle(
                            fontSize:
                                AppTheme
                                    .lightTheme
                                    .textTheme
                                    .bodyLarge!
                                    .fontSize ??
                                16,
                            fontFamily: "Gilroy-Medium",
                            color: AppColors.titleColor,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => setState(() => pickedFile = null),
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
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Image.asset(
                          widget.imagePath ?? 'assets/gallery-export.png',
                          width: 30,
                          height: 30,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 50),
                        child: Text(
                          widget.imageTitle ?? 'Capture Image',
                          style: TextStyle(
                            fontSize:
                                AppTheme
                                    .lightTheme
                                    .textTheme
                                    .bodyLarge!
                                    .fontSize ??
                                16,
                            fontFamily: "Gilroy-SemiBold",
                            fontWeight: FontWeight.w400,
                            color: AppColors.titleColor,
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ],
    );
  }

  void openImagePicker(
    BuildContext context,
    bool isDocumentShow,
    bool isCameraShow,
    bool isGallaryShow,
  ) async {
    final File? selectedFile = await showImageFilePicker(
      context: context,
      selectDocument: true,
      isDocumentShow: isDocumentShow,
      isCameraShow: isCameraShow,
      isGallaryShow: isGallaryShow,
    );

    if (selectedFile != null) {
      final String extension = path.extension(selectedFile.path).toLowerCase();

      if (extension == '.png' ||
          extension == '.jpg' ||
          extension == '.heic' ||
          extension == '.jpeg') {
        setState(() {
          _pickedImage = selectedFile;
          pickedFile = null;
        });
      } else if (extension == '.pdf' ||
          extension == '.doc' ||
          extension == '.docx') {
        setState(() {
          pickedFile = selectedFile;
          _pickedImage = null;
        });
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Unsupported file type')));
      }
    } else {
      log('User cancelled or error occurred.');
    }
  }
}
