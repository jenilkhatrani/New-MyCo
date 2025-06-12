import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_myco/custom_widgets/text_field.dart';
import 'package:path/path.dart' as path;
import '../themes_colors/app_theme.dart';
import '../themes_colors/colors.dart';
import 'dashed_border_container_theme.dart';
import 'new_myco_button.dart';

class OutOfRangeBottomSheet extends StatefulWidget {
  final double? height;
  final double? width;
  final List<Map<String, String>>? customTravelModes;
  final double? imageHeight;
  final double? imageMargin;

  const OutOfRangeBottomSheet({
    super.key,
    this.customTravelModes,
    this.imageHeight,
    this.imageMargin,
    this.height,
    this.width,
  });

  @override
  State<OutOfRangeBottomSheet> createState() => _OutOfRangeBottomSheetState();
}

class _OutOfRangeBottomSheetState extends State<OutOfRangeBottomSheet> {
  int selectedTravelModeIndex = -1;

  final List<Map<String, String>> defaultAssetTravelModes = [
    {'name': 'Bicycle', 'icon': 'assets/travelmodeicon/bicycle.jpg'},
    {'name': 'Car', 'icon': 'assets/travelmodeicon/car.jpg'},
    {'name': 'Bus', 'icon': 'assets/travelmodeicon/bus.jpg'},
    {'name': 'Train', 'icon': 'assets/travelmodeicon/train.jpg'},
    {'name': 'Plane', 'icon': 'assets/travelmodeicon/flight.jpg'},
    {'name': 'Boat', 'icon': 'assets/travelmodeicon/boat.jpg'},
  ];
  File? _pickedImage;

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
    final travelModes = widget.customTravelModes ?? defaultAssetTravelModes;

    return Container(
      height: widget.height ?? MediaQuery.of(context).size.height * 0.8,
      width: widget.width ?? MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        color: Colors.white,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    'You are Out of Range (Ahmedabad)',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize:
                          Theme.of(context).textTheme.bodyLarge?.fontSize ?? 18,
                      fontFamily: 'Gilroy-SemiBold',
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Text(
                    '480.45 Meter Away (Air Distance)',
                    style: TextStyle(
                      fontFamily: 'Gilroy-Medium',
                      fontSize:
                          Theme.of(context).textTheme.titleMedium!.fontSize ??
                          14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Expanded(
                  child: Text(
                    '2025-05-15 10:55:11 AM',
                    style: TextStyle(
                      fontFamily: 'Gilroy-Medium',
                      fontSize:
                          Theme.of(context).textTheme.titleMedium!.fontSize ??
                          14,

                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(width: 14),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'GPS Accuracy: ',
                          style: TextStyle(
                            fontFamily: 'Gilroy-Medium',
                            fontSize:
                                Theme.of(
                                  context,
                                ).textTheme.titleMedium!.fontSize ??
                                14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.005,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: Color(0xFFFDB913)),
                        ),
                        child: Text(
                          'Medium',
                          style: TextStyle(
                            color: Color(0xFFFDB913),
                            fontFamily: 'Gilroy-Medium',
                            fontSize:
                                Theme.of(
                                  context,
                                ).textTheme.titleSmall!.fontSize ??
                                14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              "Travel Mode",
              style: TextStyle(
                fontFamily: 'Gilroy-Bold',
                fontSize:
                    Theme.of(context).textTheme.bodyMedium!.fontSize ?? 14,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
            SizedBox(height: 8),

            // Travel mode icons
            Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.borderColor),
              ),
              child: Center(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: travelModes.length,
                  itemBuilder: (context, index) {
                    bool isSelected = selectedTravelModeIndex == index;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTravelModeIndex = index;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: isSelected
                                    ? AppColors.primary
                                    : AppColors.white,
                              ),
                              child: Image.asset(
                                travelModes[index]['icon']!,
                                width: 28,
                                height: 28,
                                // color: isSelected ? Colors.blue : null,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),

            SizedBox(height: 20),

            Text(
              "Odometer Reading",
              style: TextStyle(
                fontFamily: 'Gilroy-Bold',
                fontSize:
                    Theme.of(context).textTheme.bodyMedium!.fontSize ?? 14,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
            SizedBox(height: 8),
            // Odometer Section
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Your Last odometer reading : 12.5 KM",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize:
                          Theme.of(context).textTheme.bodyMedium?.fontSize ??
                          14,
                      fontFamily: 'Gilroy-SemiBold',
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "1. Attach Odometer Photo",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize:
                          Theme.of(context).textTheme.bodyMedium?.fontSize ??
                          14,
                      fontFamily: 'Gilroy-SemiBold',
                    ),
                  ),
                  SizedBox(height: 8),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(15.0),
                          ),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                    child: Container(
                      margin: EdgeInsets.all(widget.imageMargin ?? 0),
                      child: DashedBorderContainer(
                        borderRadius: 8,
                        borderColor: AppColors.primary,
                        padding: EdgeInsets.all(0),
                        child: _pickedImage != null
                            ? Container(
                                margin: const EdgeInsets.all(1),
                                child: Stack(
                                  fit: StackFit.loose,
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
                                        onTap: () {
                                          setState(() {
                                            _pickedImage = null;
                                          });
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 2,
                                            horizontal: 6,
                                          ),
                                          decoration: BoxDecoration(
                                            color: AppColors.removeBackground,
                                            border: Border.all(
                                              color: AppColors.remove,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              4,
                                            ),
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
                                ),
                              )
                            : Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Color(0xffEEF7FD),
                                ),
                                padding: EdgeInsets.all(10),
                                width: double.infinity,
                                height: widget.imageHeight ?? 160,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/gallary.png',
                                      width: 30,
                                      height: 30,
                                    ),
                                    // Icon(Icons.image_search, size: 38),
                                    SizedBox(height: 5),
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
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                      ),
                    ),
                  ),

                  SizedBox(height: 12),
                  Text(
                    "2. Odometer Reading",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize:
                          Theme.of(context).textTheme.bodyMedium?.fontSize ??
                          14,
                      fontFamily: 'Gilroy-SemiBold',
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: MyCoTextField(
                          border: Border.all(
                            color: AppColors.primary,
                            // width: 10,
                          ),
                          color: AppColors.borderColor,
                          typingtextStyle: TextStyle(color: AppColors.black),
                          hintTextStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w400,
                          ),
                          isSuffixIconOn: false,
                          hintText: "Km",
                          textInputType: TextInputType.number,
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: MyCoTextField(
                          typingtextStyle: TextStyle(color: AppColors.black),
                          hintTextStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w400,
                          ),
                          color: AppColors.borderColor,
                          isSuffixIconOn: false,
                          hintText: "Meter",
                          textInputType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),
            // Buttons
            Row(
              children: [
                Expanded(
                  child: MyCoButton(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    title: "Prev",
                    boarderRadius: 50,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: MyCoButton(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    title: "Punch In",
                    boarderRadius: 50,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
