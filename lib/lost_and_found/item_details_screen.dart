// // import 'dart:io';
// // import 'package:flutter/material.dart';
// // import '../custom_widgets/custom_countrycodetextfield.dart';
// // import '../custom_widgets/text_field.dart';
// //
// // class ItemFoundScreen extends StatefulWidget {
// //   final Map<String, dynamic> item;
// //
// //   const ItemFoundScreen({Key? key, required this.item}) : super(key: key);
// //
// //   @override
// //   State<ItemFoundScreen> createState() => _ItemFoundScreenState();
// // }
// //
// // class _ItemFoundScreenState extends State<ItemFoundScreen> {
// //   late Map<String, dynamic> item;
// //   String selectedCountry = 'IND';
// //   final TextEditingController phoneController = TextEditingController();
// //   final TextEditingController nameController = TextEditingController();
// //   final TextEditingController descController = TextEditingController();
// //   final Map<String, String> countryMap = {
// //     'IND': '+91',
// //     'USA': '+1',
// //     'INA': '+62',
// //   };
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     item = widget.item;
// //     nameController.text = item['name'] ?? '';
// //     descController.text = item['desc'] ?? '';
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: const Color(0xFFF6F7FB),
// //       appBar: AppBar(
// //         backgroundColor: Colors.transparent,
// //         elevation: 0,
// //         leading: IconButton(
// //           icon: const Icon(Icons.arrow_back, color: Colors.black),
// //           onPressed: () => Navigator.of(context).pop(),
// //         ),
// //         title: const Text('Item Found', style: TextStyle(color: Colors.black)),
// //         centerTitle: false,
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.symmetric(horizontal: 16),
// //         child: SingleChildScrollView(
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.stretch,
// //             children: [
// //               // Image display
// //               Container(
// //                 height: 160,
// //                 decoration: BoxDecoration(
// //                   color: const Color(0xFFE8F1FA),
// //                   borderRadius: BorderRadius.circular(10),
// //                   border: Border.all(color: const Color(0xFFB0C4DE)),
// //                 ),
// //                 child: ClipRRect(
// //                   borderRadius: BorderRadius.circular(10),
// //                   child: Image.file(
// //                     item['image'] as File,
// //                     width: double.infinity,
// //                     height: 160,
// //                     fit: BoxFit.cover,
// //                   ),
// //                 ),
// //               ),
// //               const SizedBox(height: 20),
// //
// //               // Item Details Card
// //               Container(
// //                 padding: const EdgeInsets.all(16),
// //                 decoration: BoxDecoration(
// //                   color: Colors.white,
// //                   borderRadius: BorderRadius.circular(12),
// //                   boxShadow: [
// //                     BoxShadow(
// //                       color: Colors.black12,
// //                       blurRadius: 8,
// //                       offset: const Offset(0, 4),
// //                     ),
// //                   ],
// //                 ),
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     const Text(
// //                       'Item Name',
// //                       style: TextStyle(
// //                         fontWeight: FontWeight.w600,
// //                         fontSize: 14,
// //                         color: Colors.black,
// //                       ),
// //                     ),
// //                     const SizedBox(height: 8),
// //                     MyCoTextField(
// //                       controller: nameController,
// //                       isReadOnly: true,
// //
// //                       prefix: const Icon(
// //                         Icons.inventory_2_outlined,
// //                         color: Colors.lightBlueAccent,
// //                       ),
// //                       contentPadding: const EdgeInsets.symmetric(vertical: 14),
// //                     ),
// //                     const SizedBox(height: 16),
// //                     const Text(
// //                       'Description',
// //                       style: TextStyle(
// //                         fontWeight: FontWeight.w600,
// //                         fontSize: 14,
// //                         color: Colors.black,
// //                       ),
// //                     ),
// //                     const SizedBox(height: 8),
// //                     MyCoTextField(
// //                       isReadOnly: true,
// //                       controller: descController,
// //                       prefix: const Icon(
// //                         Icons.description_outlined,
// //                         color: Colors.lightBlueAccent,
// //                       ),
// //                       contentPadding: const EdgeInsets.symmetric(vertical: 14),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //
// //               const SizedBox(height: 40),
// //
// //               const Text(
// //                 'Contact Details',
// //                 style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
// //               ),
// //               const SizedBox(height: 16),
// //
// //               const Text(
// //                 'Contact Person Name',
// //                 style: TextStyle(
// //                   fontSize: 14,
// //                   fontWeight: FontWeight.w600,
// //                   color: Colors.black,
// //                 ),
// //               ),
// //               const SizedBox(height: 8),
// //               MyCoTextField(
// //                 hintText: 'Name',
// //                 prefix: const Icon(
// //                   Icons.person_outline,
// //                   color: Colors.lightBlueAccent,
// //                 ),
// //                 contentPadding: const EdgeInsets.symmetric(vertical: 14),
// //               ),
// //               const SizedBox(height: 20),
// //               const Text(
// //                 'Contact Person Mobile Number',
// //                 style: TextStyle(
// //                   fontSize: 14,
// //                   fontWeight: FontWeight.w600,
// //                   color: Colors.black,
// //                 ),
// //               ),
// //               const SizedBox(height: 8),
// //               PhoneNumberField(
// //                 selectedCountry: selectedCountry,
// //                 countries: countryMap.keys.toList(),
// //                 onCountryChanged: (value, index) {
// //                   if (value != null) {
// //                     setState(() => selectedCountry = value);
// //                   }
// //                 },
// //                 countryDialCodes: countryMap,
// //                 phoneController: phoneController,
// //               ),
// //               const SizedBox(height: 30),
// //
// //               const Text(
// //                 'Branch',
// //                 style: TextStyle(
// //                   fontSize: 14,
// //                   fontWeight: FontWeight.w600,
// //                   color: Colors.black,
// //                 ),
// //               ),
// //               const SizedBox(height: 8),
// //               MyCoTextField(
// //                 hintText: 'Branch',
// //                 prefix: const Icon(
// //                   Icons.account_tree_outlined,
// //                   color: Colors.lightBlueAccent,
// //                 ),
// //                 contentPadding: const EdgeInsets.symmetric(vertical: 14),
// //               ),
// //               const SizedBox(height: 20),
// //
// //               const Text(
// //                 'Department',
// //                 style: TextStyle(
// //                   fontSize: 14,
// //                   fontWeight: FontWeight.w600,
// //                   color: Colors.black,
// //                 ),
// //               ),
// //               const SizedBox(height: 8),
// //               MyCoTextField(
// //                 hintText: 'Department',
// //                 prefix: const Icon(
// //                   Icons.apartment_outlined,
// //                   color: Colors.lightBlueAccent,
// //                 ),
// //                 contentPadding: const EdgeInsets.symmetric(vertical: 14),
// //               ),
// //               const SizedBox(height: 20),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'dart:io';
// import 'package:flutter/material.dart';
// import '../custom_widgets/new_myco_button.dart';
// import '../custom_widgets/responsive.dart';
// import '../custom_widgets/text_field.dart';
// import '../themes_colors/colors.dart';
// import 'chat_screen.dart';
// import 'country_code_txtf.dart';
//
// class ItemDetailsScreen extends StatefulWidget {
//   final Map<String, dynamic> item;
//
//   const ItemDetailsScreen({Key? key, required this.item}) : super(key: key);
//
//   @override
//   State<ItemDetailsScreen> createState() => _ItemDetailsScreenState();
// }
//
// class _ItemDetailsScreenState extends State<ItemDetailsScreen> {
//   late Map<String, dynamic> item;
//   String selectedCountry = 'IND';
//
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController descController = TextEditingController();
//   final TextEditingController contactPersonNameController =
//       TextEditingController(text: "Name");
//   final TextEditingController branchController = TextEditingController(
//     text: "Branch",
//   );
//   final TextEditingController departmentController = TextEditingController(
//     text: "Department",
//   );
//   final phoneController = TextEditingController(text: "898298299");
//
//   final List<CountryModel> countryList = [
//     CountryModel(name: 'INA', dialCode: '+91'),
//     CountryModel(name: 'USA', dialCode: '+1'),
//     CountryModel(name: 'AUSTRALIA', dialCode: '+61'),
//     CountryModel(name: 'BELGIUM', dialCode: '+32'),
//     CountryModel(name: 'EGYPT', dialCode: '+20'),
//     CountryModel(name: 'LIBYA', dialCode: '+218'),
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//     item = widget.item;
//     nameController.text = item['name'] ?? '';
//     descController.text = item['desc'] ?? '';
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF6F7FB),
//       appBar: AppBar(
//         scrolledUnderElevation: 0,
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         title: const Text('Item Found', style: TextStyle(color: Colors.black)),
//         centerTitle: false,
//       ),
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 16 * getResponsive(context)),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Container(
//                 height: 0.18 * getHeight(context),
//                 decoration: BoxDecoration(
//                   color: const Color(0xFFEEF7FD),
//                   borderRadius: BorderRadius.circular(10),
//                   border: Border.all(color: const Color(0xFF2F648E)),
//                 ),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(10),
//                   child: item['image'] != null
//                       ? Image.file(
//                           item['image'] as File,
//                           fit: BoxFit.cover,
//                           width: double.infinity,
//                         )
//                       : const Center(child: Text('No Image')),
//                 ),
//               ),
//               SizedBox(height: 16),
//
//               Container(
//                 padding: EdgeInsets.all(12),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(12),
//                   border: Border.all(color: const Color(0xFF2F648E)),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     _buildLabel(context, 'Item Name'),
//                     SizedBox(height: 4),
//
//                     MyCoTextField(
//                       height: 44,
//                       typingtextStyle: _typingStyle(context),
//
//                       controller: nameController,
//                       isReadOnly: true,
//                       hintTextStyle: _hintStyle(context),
//                       prefix: _prefixIcon(
//                         'assets/lost_and_found/item-name.png',
//                       ),
//                       contentPadding: _contentPadding(context),
//                       isSuffixIconOn: null,
//                     ),
//                     SizedBox(height: 12),
//
//                     _buildLabel(context, 'Description'),
//                     SizedBox(height: 4),
//
//                     MyCoTextField(
//                       height: 44,
//                       typingtextStyle: _typingStyle(context),
//
//                       controller: descController,
//                       isReadOnly: true,
//                       hintTextStyle: _hintStyle(context),
//                       prefix: _prefixIcon(
//                         'assets/lost_and_found/message-edit.png',
//                       ),
//                       contentPadding: _contentPadding(context),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 24),
//
//               _buildHeader(context, 'Contact Details'),
//               SizedBox(height: 16),
//               _buildLabel(context, 'Contact Person Name'),
//               SizedBox(height: 4),
//               MyCoTextField(
//                 height: 44,
//                 typingtextStyle: _typingStyle(context),
//                 controller: contactPersonNameController,
//                 isReadOnly: true,
//                 hintText: item['contactName'] ?? 'Name',
//                 hintTextStyle: _hintStyle(context),
//                 prefix: _prefixIcon('assets/lost_and_found/profile-circle.png'),
//                 contentPadding: _contentPadding(context),
//               ),
//               SizedBox(height: 16),
//
//               _buildLabel(context, 'Contact Person Mobile Number'),
//               SizedBox(height: 4),
//
//               CustomMobileNumberField(
//                 width: 200,
//                 height: 44,
//                 // dropdownHeight: 200,
//                 // dropdownWidth: 600,
//                 // dropdownWidth: 200,
//                 dropdownHeight: 200,
//                 countries: countryList,
//                 controller: phoneController,
//                 onCountryChanged: (selected) {
//                   print(
//                     "Selected country: ${selected.name} (${selected.dialCode})",
//                   );
//                 },
//               ),
//               SizedBox(height: 16),
//
//               _buildLabel(context, 'Branch'),
//               SizedBox(height: 4),
//
//               MyCoTextField(
//                 height: 44,
//                 typingtextStyle: _typingStyle(context),
//                 controller: branchController,
//                 isReadOnly: true,
//                 hintText: item['branch'] ?? 'Branch',
//                 hintTextStyle: _hintStyle(context),
//                 prefix: _prefixIcon('assets/lost_and_found/data.png'),
//
//                 contentPadding: _contentPadding(context),
//               ),
//               SizedBox(height: 16),
//
//               _buildLabel(context, 'Department'),
//               SizedBox(height: 4),
//
//               MyCoTextField(
//                 height: 44,
//                 controller: departmentController,
//                 typingtextStyle: _typingStyle(context),
//                 isReadOnly: true,
//                 hintText: item['department'] ?? 'Department',
//                 hintTextStyle: _hintStyle(context),
//                 prefix: _prefixIcon('assets/lost_and_found/note-favorite.png'),
//                 contentPadding: _contentPadding(context),
//               ),
//               SizedBox(height: 0.03 * getHeight(context)),
//
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: MyCoButton(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => ChatScreen()),
//                     );
//                   },
//                   title: 'CHAT',
//                   isShadowBottomLeft: true,
//                   boarderRadius: 50,
//                   fontFamily: 'Gilroy-Bold',
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
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
//
//   EdgeInsets _contentPadding(BuildContext context) =>
//       EdgeInsets.symmetric(vertical: 14 * getResponsive(context));
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
//
//   Widget _buildLabel(BuildContext context, String label) => Text(
//     label,
//     style: TextStyle(
//       fontSize: 12,
//       fontFamily: 'Gilroy-Bold',
//       fontWeight: FontWeight.w400,
//       color: AppColors.titleColor,
//     ),
//   );
//
//   Widget _buildHeader(BuildContext context, String header) => Padding(
//     padding: EdgeInsets.only(bottom: 0.01 * getHeight(context)),
//     child: Text(
//       header,
//       style: TextStyle(
//         color: Color(0xff000000),
//         fontSize: 18,
//         fontFamily: 'Gilroy-Bold',
//         fontWeight: FontWeight.w400,
//       ),
//     ),
//   );
// }
