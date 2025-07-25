// // ignore_for_file: prefer_expression_function_bodies
//
// import 'package:flutter/material.dart';
// import '../custom_widgets/custom_countrycodetextfield.dart';
// import '../custom_widgets/text_field.dart';
// import '../themes_colors/app_theme.dart';
// import '../themes_colors/colors.dart';
// import 'custom_dropdown.dart';
//
// class PhoneNumberField extends StatelessWidget {
//   final String selectedCountry;
//   final List<String> countries;
//   final void Function(String?, int)? onCountryChanged;
//   final TextEditingController phoneController;
//   final Map<String, String> countryDialCodes;
//   final Decoration? decoration;
//
//   const PhoneNumberField({
//     super.key,
//     required this.selectedCountry,
//     required this.countries,
//     required this.onCountryChanged,
//     required this.phoneController,
//     required this.countryDialCodes,
//     this.decoration,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     // final theme = Theme.of(context);
//     // final textTheme = theme.textTheme;
//
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 7),
//       decoration:
//           decoration ??
//           BoxDecoration(
//             border: Border.all(color: AppColors.primary),
//             borderRadius: BorderRadius.circular(10),
//             color: AppColors.white,
//           ),
//       child: Row(
//         children: [
//           SizedBox(
//             width: 100,
//             height: 45,
//             child: CustomPopupDropdownStyled<String>(
//               // border: InputBorder.none,
//               items: countries,
//               // border: Border.all(color: Colors.transparent),
//               selectedItem: selectedCountry,
//               itemToString: (val) => val,
//               onChanged: onCountryChanged,
//               height: 40,
//               // hintTextStyle: AppTheme.lightTheme.textTheme.bodyMedium?.copyWith(
//               //   color: AppColors.primary,
//               // ),
//               // useRadioList: false,
//             ),
//           ),
//           Text(
//             countryDialCodes[selectedCountry] ?? '',
//             style: TextStyle(
//               color: AppColors.primary,
//               fontSize: AppTheme.lightTheme.textTheme.bodyMedium?.fontSize,
//             ),
//           ),
//           Expanded(
//             child: MyCoTextField(
//               // textAlignment: TextAlign.start,
//               isSuffixIconOn: false,
//               controller: phoneController,
//               hintText: 'Enter phone number',
//               textInputType: TextInputType.phone,
//               // border: InputBorder.none,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// //below given code is the example of the usage of the above code in ui
//
// //  String selectedCountry = 'INA';
// //   final TextEditingController phoneController = TextEditingController();
// //   final Map<String, String> countryMap = {
// //     'INA': '+62',
// //     'USA': '+1',
// //     'IND': '+91',
// //   };
// //    PhoneNumberField(
// //                       selectedCountry: selectedCountry,
// //                       countries: countryMap.keys.toList(),
// //                       onCountryChanged: (value, index) {
// //                         if (value != null) {
// //                           setState(() {
// //                             selectedCountry = value;
// //                           });
// //                         }
// //                       },
// //                       countryDialCodes: countryMap,
// //                       phoneController: phoneController),
