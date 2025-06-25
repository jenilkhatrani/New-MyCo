// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:new_myco/custom_widgets/custom_image_picker_container/custom_image_picker_containe.dart';
// import 'package:new_myco/custom_widgets/text_field.dart';
//
// import '../custom_widgets/custom_radio_button.dart';
// import '../custom_widgets/new_myco_button.dart';
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
//       backgroundColor: Colors.white,
//       appBar: AppBar(title: const Text("Lost And Found")),
//       body: Padding(
//         padding: const EdgeInsets.all(32),
//         child: SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               CustomImagePickerContainer(
//                 title: "Select Image",
//                 isTitle: true,
//                 isGallaryShow: true,
//                 isCameraShow: true,
//                 isDocumentShow: false,
//                 borderRadius: 10,
//                 containerHeight: 71,
//                 imageTitle: "Select image",
//                 backgroundColor: Colors.white,
//                 onImageSelected: (file) {
//                   setState(() {
//                     selectedImage = file;
//                   });
//                   print("Selected Image: ${file.path}");
//                 },
//               ),
//               SizedBox(height: 24),
//               CustomRadioButton(
//                 title: "Select",
//                 options: const ["Lost", "Found"],
//                 height: 44,
//                 initialValue: selectedOption,
//                 onChanged: (value) {
//                   setState(() {
//                     selectedOption = value; // ✅ store current value
//                   });
//                   print("Selected: $value");
//                 },
//               ),
//
//               SizedBox(height: 24),
//
//               Text(
//                 "Item Name",
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                   color: AppColors.titleColor,
//                 ),
//               ),
//               MyCoTextField(
//                 controller: itemNameController,
//                 height: 44,
//                 isSuffixIconOn: true,
//                 hintText: "Type here",
//                 isLabelOn: true,
//                 hintTextStyle: TextStyle(color: AppColors.borderColor),
//
//                 // labelText: "Item Name",
//                 preFixImage: "assets/item_name.png",
//               ),
//               SizedBox(height: 24),
//
//               Text(
//                 "About Item",
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                   color: AppColors.titleColor,
//                 ),
//               ),
//               MyCoTextField(
//                 controller: aboutItemController,
//                 height: 144,
//                 isSuffixIconOn: true,
//                 hintText: "Type here",
//                 hintTextStyle: TextStyle(color: AppColors.borderColor),
//                 isLabelOn: true,
//                 preFixImage: "assets/message-edit.png",
//               ),
//               Spacer(),
//               MyCoButton(
//                 onTap: () {
//                   final itemName = itemNameController.text.trim();
//                   final aboutItem = aboutItemController.text.trim();
//
//                   if (selectedImage == null) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(content: Text("Please select an image")),
//                     );
//                   } else if (itemName.isEmpty) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(content: Text("Please enter item name")),
//                     );
//                   } else if (aboutItem.isEmpty) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(
//                         content: Text("Please enter item description"),
//                       ),
//                     );
//                   } else {
//                     // All fields are valid, proceed
//                     Navigator.pop(context, {
//                       'image': selectedImage,
//                       'name': itemNameController.text.trim(),
//                       'desc': aboutItemController.text.trim(),
//                       'status': selectedOption, // ✅ accurate status passed
//                     });
//                   }
//                 },
//
//                 title: 'Submit',
//                 backgroundColor: AppColors.primary,
//                 height: 50,
//                 width: double.infinity,
//                 textStyle: TextStyle(
//                   color: Colors.white,
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:new_myco/custom_widgets/custom_image_picker_container/custom_image_picker_containe.dart';
import 'package:new_myco/custom_widgets/text_field.dart';

import '../custom_widgets/custom_radio_button.dart';
import '../custom_widgets/new_myco_button.dart';
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: const Text("Lost And Found"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: CustomImagePickerContainer(
                title: "Select Image",
                isTitle: true,
                isGallaryShow: true,
                isCameraShow: true,
                isDocumentShow: false,
                borderRadius: 10,

                containerHeight: 71,

                imageTitle: "Select image",
                // backgroundColor: App,
                onImageSelected: (file) {
                  setState(() {
                    selectedImage = file;
                  });
                  print("Selected Image: ${file.path}");
                },
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: CustomRadioButton(
                title: "Select",
                options: const ["Lost", "Found"],
                height: 44,
                initialValue: selectedOption,
                onChanged: (value) {
                  setState(() {
                    selectedOption = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                "Item Name",
                style: TextStyle(
                  fontFamily: "Gilroy-Bold",
                  fontWeight: FontWeight.w400,
                  color: AppColors.titleColor,
                  fontSize:
                      Theme.of(context).textTheme.titleMedium?.fontSize ?? 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: MyCoTextField(
                controller: itemNameController,
                height: 44,
                isSuffixIconOn: true,
                hintText: "Type here",
                isLabelOn: true,
                hintTextStyle: TextStyle(color: AppColors.borderColor),
                preFixImage: "assets/lost_and_found/item-name.png",
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                "About Item",
                style: TextStyle(
                  fontSize:
                      Theme.of(context).textTheme.titleMedium?.fontSize ?? 16,
                  fontFamily: "Gilroy-Bold",
                  fontWeight: FontWeight.w400,
                  color: AppColors.titleColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: MyCoTextField(
                controller: aboutItemController,
                height: 144,
                isSuffixIconOn: true,
                hintText: "Type here",
                hintTextStyle: TextStyle(color: AppColors.borderColor),
                isLabelOn: true,
                preFixImage: "assets/lost_and_found/message-edit.png",
              ),
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
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
          title: 'Submit',
          boarderRadius: 50,
          isShadowBottomLeft: true,
          backgroundColor: AppColors.primary,
          height: 50,
          width: double.infinity,
          textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
