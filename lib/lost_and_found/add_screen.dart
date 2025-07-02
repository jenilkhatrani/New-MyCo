// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:new_myco/custom_widgets/custom_image_picker_container/custom_image_picker_containe.dart';
// import 'package:new_myco/custom_widgets/text_field.dart';
//
// import '../custom_widgets/custom_radio_button.dart';
// import '../custom_widgets/new_myco_button.dart';
// import '../custom_widgets/responsive.dart';
// import '../themes_colors/colors.dart';
//
// class LostAndFoundAddScreen extends StatefulWidget {
//   const LostAndFoundAddScreen({super.key});
//
//   @override
//   State<LostAndFoundAddScreen> createState() => _LostAndFoundAddScreenState();
// }
//
// class _LostAndFoundAddScreenState extends State<LostAndFoundAddScreen> {
//   TextEditingController itemNameController = TextEditingController();
//   TextEditingController aboutItemController = TextEditingController();
//   File? selectedImage;
//   String selectedOption = "Lost";
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.scaffoldBackgroundColor,
//       appBar: AppBar(
//         backgroundColor: AppColors.scaffoldBackgroundColor,
//         title: Text(
//           "Lost And Found",
//           style: TextStyle(
//             fontFamily: "Gilroy-Bold",
//             fontSize: 18,
//             fontWeight: FontWeight.w400,
//             color: AppColors.subTitleColor,
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 20),
//
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 32),
//               child: CustomImagePickerContainer(
//                 iconSize: 20,
//                 title: "Select Image",
//                 isTitle: true,
//                 isGallaryShow: true,
//                 isCameraShow: true,
//                 isDocumentShow: false,
//                 borderRadius: 10,
//                 containerHeight: 71,
//                 imageTitle: "Select image",
//
//                 onImageSelected: (file) {
//                   setState(() {
//                     selectedImage = file;
//                   });
//                   print("Selected Image: ${file.path}");
//                 },
//               ),
//             ),
//             const SizedBox(height: 24),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 28),
//               child: CustomRadioButton(
//                 title: "Select",
//                 options: const ["Lost", "Found"],
//                 height: 44,
//                 initialValue: selectedOption,
//                 onChanged: (value) {
//                   setState(() {
//                     selectedOption = value;
//                   });
//                 },
//               ),
//             ),
//             const SizedBox(height: 24),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 32),
//               child: Text(
//                 "Item Name",
//                 style: TextStyle(
//                   fontFamily: "Gilroy-Bold",
//                   fontWeight: FontWeight.w400,
//                   color: AppColors.titleColor,
//                   fontSize: 13,
//                 ),
//               ),
//             ),
//             SizedBox(height: 5),
//
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 32),
//               child: MyCoTextField(
//                 maxLenght: 5,
//                 controller: itemNameController,
//                 // height: 44,
//                 isSuffixIconOn: true,
//                 hintText: "Type here",
//                 isLabelOn: true,
//                 hintTextStyle: _hintStyle(context),
//                 typingtextStyle: _typingStyle(context),
//                 prefix: _prefixIcon("assets/lost_and_found/item-name.png"),
//               ),
//             ),
//             SizedBox(height: 24),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 32),
//               child: Text(
//                 "About Item",
//                 style: TextStyle(
//                   fontSize: 13,
//                   fontFamily: "Gilroy-Bold",
//                   fontWeight: FontWeight.w400,
//                   color: AppColors.titleColor,
//                 ),
//               ),
//             ),
//             SizedBox(height: 5),
//
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 32),
//               child: MyCoTextField(
//                 // height: 200,
//                 // height: 144,
//                 // maxLenght: 5,
//                 fillColor: Colors.white,
//                 controller: aboutItemController,
//                 isSuffixIconOn: true,
//                 hintText: "Type here",
//                 hintTextStyle: _hintStyle(context),
//                 typingtextStyle: _typingStyle(context),
//                 isLabelOn: true,
//                 prefix: _prefixIcon("assets/lost_and_found/message-edit.png"),
//               ),
//             ),
//             const SizedBox(height: 80),
//           ],
//         ),
//       ),
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
//         child: MyCoButton(
//           onTap: () {
//             final itemName = itemNameController.text.trim();
//             final aboutItem = aboutItemController.text.trim();
//
//             if (selectedImage == null) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(content: Text("Please select an image")),
//               );
//             } else if (itemName.isEmpty) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(content: Text("Please enter item name")),
//               );
//             } else if (aboutItem.isEmpty) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(content: Text("Please enter item description")),
//               );
//             } else {
//               Navigator.pop(context, {
//                 'image': selectedImage,
//                 'name': itemName,
//                 'desc': aboutItem,
//                 'status': selectedOption,
//               });
//             }
//           },
//           title: 'SUBMIT',
//           boarderRadius: 50,
//           isShadowBottomLeft: true,
//           backgroundColor: AppColors.primary,
//           height: 50,
//           width: double.infinity,
//           textStyle: const TextStyle(
//             color: Colors.white,
//             fontSize: 15,
//             fontWeight: FontWeight.w500,
//             fontFamily: "Inter",
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _prefixIcon(String assetPath) => Padding(
//     padding: EdgeInsets.all(12.0) * getResponsive(context),
//     child: Image.asset(
//       assetPath,
//       width: 0.020 * getWidth(context),
//       height: 0.20 * getHeight(context),
//       fit: BoxFit.contain,
//     ),
//   );
//   TextStyle _hintStyle(BuildContext context) => TextStyle(
//     fontFamily: 'Gilroy-SemiBold',
//     fontWeight: FontWeight.w400,
//     fontSize: 14,
//     color: Colors.black54,
//   );
//
//   TextStyle _typingStyle(BuildContext context) => TextStyle(
//     fontFamily: 'Gilroy-SemiBold',
//     fontWeight: FontWeight.w400,
//     fontSize: 14,
//     color: AppColors.textFieldColor,
//   );
// }

// ================================Responsive.dart==================================

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:new_myco/custom_widgets/custom_image_picker_container/custom_image_picker_containe.dart';
import 'package:new_myco/custom_widgets/text_field.dart';

import '../custom_widgets/custom_radio_button.dart';
import '../custom_widgets/new_myco_button.dart';
import '../custom_widgets/responsive.dart';
import '../themes_colors/colors.dart';

class LostAndFoundAddScreen extends StatefulWidget {
  const LostAndFoundAddScreen({super.key});

  @override
  State<LostAndFoundAddScreen> createState() => _LostAndFoundAddScreenState();
}

class _LostAndFoundAddScreenState extends State<LostAndFoundAddScreen> {
  TextEditingController itemNameController = TextEditingController();
  TextEditingController aboutItemController = TextEditingController();
  File? selectedImage;
  String selectedOption = "Lost";

  @override
  Widget build(BuildContext context) {
    double res = getResponsive(context);

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBackgroundColor,
        title: Text(
          "Lost And Found",
          style: TextStyle(
            fontFamily: "Gilroy-Bold",
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: AppColors.subTitleColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20 * res),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32 * res),
              child: CustomImagePickerContainer(
                iconSize: 20,
                title: "Select Image",
                isTitle: true,
                isGallaryShow: true,
                isCameraShow: true,
                isDocumentShow: false,
                borderRadius: 10,
                containerHeight: 71 * res,
                imageTitle: "Select image",
                onImageSelected: (file) {
                  setState(() {
                    selectedImage = file;
                  });
                  print("Selected Image: ${file.path}");
                },
              ),
            ),
            SizedBox(height: 24 * res),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 28 * res),
              child: CustomRadioButton(
                title: "Select",
                options: const ["Lost", "Found"],
                height: 44 * res,
                initialValue: selectedOption,
                onChanged: (value) {
                  setState(() {
                    selectedOption = value;
                  });
                },
              ),
            ),
            SizedBox(height: 24 * res),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32 * res),
              child: Text(
                "Item Name",
                style: TextStyle(
                  fontFamily: "Gilroy-Bold",
                  fontWeight: FontWeight.w400,
                  color: AppColors.titleColor,
                  fontSize: 13,
                ),
              ),
            ),
            SizedBox(height: 5 * res),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32 * res),
              child: MyCoTextField(
                maxLenght: 5,
                controller: itemNameController,
                isSuffixIconOn: true,
                hintText: "Type here",
                isLabelOn: true,
                hintTextStyle: _hintStyle(context),
                typingtextStyle: _typingStyle(context),
                prefix: _prefixIcon("assets/lost_and_found/item-name.png"),
              ),
            ),
            SizedBox(height: 24 * res),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32 * res),
              child: Text(
                "About Item",
                style: TextStyle(
                  fontSize: 13,
                  fontFamily: "Gilroy-Bold",
                  fontWeight: FontWeight.w400,
                  color: AppColors.titleColor,
                ),
              ),
            ),
            SizedBox(height: 5 * res),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32 * res),
              child: MyCoTextField(
                fillColor: Colors.white,
                controller: aboutItemController,
                isSuffixIconOn: true,
                hintText: "Type here",
                hintTextStyle: _hintStyle(context),
                typingtextStyle: _typingStyle(context),
                isLabelOn: true,
                prefix: _prefixIcon("assets/lost_and_found/message-edit.png"),
              ),
            ),
            SizedBox(height: 80 * res),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.fromLTRB(32 * res, 0, 32 * res, 32 * res),
        child: MyCoButton(
          onTap: () {
            final itemName = itemNameController.text.trim();
            final aboutItem = aboutItemController.text.trim();

            if (selectedImage == null) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Please select an image")),
              );
            } else if (itemName.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Please enter item name")),
              );
            } else if (aboutItem.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Please enter item description")),
              );
            } else {
              Navigator.pop(context, {
                'image': selectedImage,
                'name': itemName,
                'desc': aboutItem,
                'status': selectedOption,
              });
            }
          },
          title: 'SUBMIT',
          boarderRadius: 50,
          isShadowBottomLeft: true,
          backgroundColor: AppColors.primary,
          height: 50 * res,
          width: double.infinity,
          textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w500,
            fontFamily: "Inter",
          ),
        ),
      ),
    );
  }

  Widget _prefixIcon(String assetPath) {
    double res = getResponsive(context);
    return Padding(
      padding: EdgeInsets.all(12.0 * res),
      child: Image.asset(
        assetPath,
        width: 0.020 * getWidth(context),
        height: 0.20 * getHeight(context),
        fit: BoxFit.contain,
      ),
    );
  }

  TextStyle _hintStyle(BuildContext context) => TextStyle(
    fontFamily: 'Gilroy-SemiBold',
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: Colors.black54,
  );

  TextStyle _typingStyle(BuildContext context) => TextStyle(
    fontFamily: 'Gilroy-SemiBold',
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: AppColors.textFieldColor,
  );
}
