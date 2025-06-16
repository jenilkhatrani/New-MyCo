import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import '../themes_colors/app_theme.dart';
import '../themes_colors/colors.dart';
import 'dashed_border_container_theme.dart';
import 'image_picker.dart';

class CustomImagePickerContainer extends StatefulWidget {
  final double? ContainerHeight;
  final double? borderRadius;
  final String? title;
  final Color backgroundColor;
  final bool? isTitle;

  const CustomImagePickerContainer({
    super.key,
    this.ContainerHeight,
    this.title,
    this.backgroundColor = AppColors.imagePickerBg,
    this.borderRadius,
    this.isTitle = false,
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
              style: TextStyle(
                color: AppColors.titleColor,
                fontFamily: 'Gilroy-Medium',
                fontWeight: FontWeight.w400,
                fontSize:
                    Theme.of(context).textTheme.bodyMedium?.fontSize ?? 14,
              ),
            ),
          ),
        GestureDetector(
          onTap: () {
            if (_pickedImage == null && pickedFile == null) {
              openImagePicker(context);
            }
          },

          child: DashedBorderContainer(
            height: widget.ContainerHeight ?? 150,
            width: double.infinity,

            borderRadius: widget.borderRadius ?? 12,
            backgroundColor: widget.backgroundColor ?? AppColors.imagePickerBg,
            borderColor: AppColors.primary,
            child: _pickedImage != null
                ? Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(
                          widget.borderRadius ?? 12,
                        ),
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
                    ],
                  ),
          ),
        ),
      ],
    );
  }

  void openImagePicker(BuildContext context) async {
    final File? selectedFile = await showImageFilePicker(
      context: context,
      selectDocument: true,
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

// import 'dart:developer';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:path/path.dart' as path;
// import '../themes_colors/app_theme.dart';
// import '../themes_colors/colors.dart';
// import 'dashed_border_container_theme.dart';
// import 'image_picker.dart';
//
// class CustomImagePickerContainer extends StatefulWidget {
//   final double? imageMargin;
//   final double? imageHeight;
//   final String? title;
//
//   const CustomImagePickerContainer({
//     super.key,
//     this.imageMargin,
//     this.imageHeight,
//     this.title,
//   });
//
//   @override
//   State<CustomImagePickerContainer> createState() =>
//       _CustomImagePickerContainerState();
// }
//
// class _CustomImagePickerContainerState
//     extends State<CustomImagePickerContainer> {
//   File? _pickedImage;
//   File? pickedFile;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         if ((widget.title ?? "").isNotEmpty)
//           Padding(
//             padding: const EdgeInsets.only(bottom: 6.0),
//             child: Text(
//               widget.title!,
//               style: TextStyle(
//                 fontSize:
//                     AppTheme.lightTheme.textTheme.titleMedium?.fontSize ?? 16,
//                 fontFamily: "Gilroy-SemiBold",
//                 color: AppColors.titleColor,
//               ),
//             ),
//           ),
//         GestureDetector(
//           onTap: () {
//             if (_pickedImage == null && pickedFile == null) {
//               openImagePicker(context);
//             }
//           },
//           child: DashedBorderContainer(
//             borderRadius: 8,
//             borderColor: AppColors.primary,
//             padding: const EdgeInsets.all(0),
//             child: _pickedImage != null
//                 ? Stack(
//                     children: [
//                       ClipRRect(
//                         borderRadius: BorderRadius.circular(10),
//                         child: Image.file(
//                           _pickedImage!,
//                           width: double.infinity,
//                           height: widget.imageHeight ?? 160,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       Positioned(
//                         top: 6,
//                         left: 6,
//                         child: GestureDetector(
//                           onTap: () => setState(() => _pickedImage = null),
//                           child: Container(
//                             padding: const EdgeInsets.symmetric(
//                               vertical: 2,
//                               horizontal: 6,
//                             ),
//                             decoration: BoxDecoration(
//                               color: AppColors.removeBackground,
//                               border: Border.all(color: AppColors.remove),
//                               borderRadius: BorderRadius.circular(4),
//                             ),
//                             child: Text(
//                               "Remove",
//                               style: TextStyle(
//                                 fontSize:
//                                     AppTheme
//                                         .lightTheme
//                                         .textTheme
//                                         .bodyLarge
//                                         ?.fontSize ??
//                                     14,
//                                 color: AppColors.error,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   )
//                 : pickedFile != null
//                 ? Stack(
//                     children: [
//                       Container(
//                         width: double.infinity,
//                         height: widget.imageHeight ?? 160,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(12),
//                           color: AppColors.imagePickerBg,
//                         ),
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 12,
//                           vertical: 8,
//                         ),
//                         child: Row(
//                           children: [
//                             Icon(
//                               Icons.insert_drive_file,
//                               color: AppColors.primary,
//                               size: 40,
//                             ),
//                             const SizedBox(width: 10),
//                             Expanded(
//                               child: Text(
//                                 path.basename(pickedFile!.path),
//                                 style: TextStyle(
//                                   fontSize:
//                                       AppTheme
//                                           .lightTheme
//                                           .textTheme
//                                           .bodyLarge
//                                           ?.fontSize ??
//                                       16,
//                                   fontFamily: "Gilroy-Medium",
//                                   color: AppColors.titleColor,
//                                 ),
//                                 overflow: TextOverflow.ellipsis,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Positioned(
//                         top: 6,
//                         left: 6,
//                         child: GestureDetector(
//                           onTap: () => setState(() => pickedFile = null),
//                           child: Container(
//                             padding: const EdgeInsets.symmetric(
//                               vertical: 2,
//                               horizontal: 6,
//                             ),
//                             decoration: BoxDecoration(
//                               color: AppColors.removeBackground,
//                               border: Border.all(color: AppColors.remove),
//                               borderRadius: BorderRadius.circular(4),
//                             ),
//                             child: Text(
//                               "Remove",
//                               style: TextStyle(
//                                 fontSize:
//                                     AppTheme
//                                         .lightTheme
//                                         .textTheme
//                                         .bodyLarge
//                                         ?.fontSize ??
//                                     14,
//                                 color: AppColors.error,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   )
//                 : Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(12),
//                       color: AppColors.imagePickerBg,
//                     ),
//                     padding: const EdgeInsets.all(10),
//                     width: double.infinity,
//                     height: widget.imageHeight ?? 160,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Image.asset(
//                           'assets/gallery-export.png',
//                           width: 30,
//                           height: 30,
//                         ),
//                         const SizedBox(height: 5),
//                         Text(
//                           'Capture Image',
//                           style: TextStyle(
//                             fontSize:
//                                 AppTheme
//                                     .lightTheme
//                                     .textTheme
//                                     .bodyLarge
//                                     ?.fontSize ??
//                                 16,
//                             fontFamily: "Gilroy-SemiBold",
//                             fontWeight: FontWeight.w400,
//                             color: AppColors.titleColor,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Future<void> openImagePicker(BuildContext context) async {
//     final bool granted = await requestStoragePermission();
//     if (!granted) {
//       if (context.mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Storage permission is required')),
//         );
//       }
//       return;
//     }
//
//     final File? selectedFile = await showImageFilePicker(context: context);
//     if (selectedFile != null) {
//       final String extension = path.extension(selectedFile.path).toLowerCase();
//       if (['.png', '.jpg', '.heic', '.jpeg'].contains(extension)) {
//         setState(() {
//           _pickedImage = selectedFile;
//           pickedFile = null;
//         });
//       } else if (['.pdf', '.doc', '.docx'].contains(extension)) {
//         setState(() {
//           pickedFile = selectedFile;
//           _pickedImage = null;
//         });
//       } else {
//         ScaffoldMessenger.of(
//           context,
//         ).showSnackBar(const SnackBar(content: Text('Unsupported file type')));
//       }
//     } else {
//       log('User cancelled or error occurred.');
//     }
//   }
//
//   Future<bool> requestStoragePermission() async {
//     if (Platform.isAndroid) {
//       final androidVersion = int.tryParse(Platform.version.split(".")[0]) ?? 0;
//
//       if (androidVersion >= 13) {
//         final status = await Permission.photos.request();
//         return status.isGranted;
//       } else {
//         final status = await Permission.storage.request();
//         return status.isGranted;
//       }
//     } else if (Platform.isIOS) {
//       final status = await Permission.photos.request();
//       return status.isGranted;
//     }
//     return false;
//   }
// }
