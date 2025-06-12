// import 'package:flutter/material.dart';
// import '../custom_widgets/new_myco_button.dart';
//
// class CustomTabBar extends StatefulWidget {
//   final List<String> tabs;
//   final Function(int) onTap;
//   final int initialIndex;
//   final Color selectedBgColor;
//   final Color unselectedTextAndBorderColor;
//
//   const CustomTabBar({
//     super.key,
//     required this.tabs,
//     required this.onTap,
//     this.initialIndex = 0,
//     required this.selectedBgColor,
//     required this.unselectedTextAndBorderColor,
//   });
//
//   @override
//   State<CustomTabBar> createState() => _CustomTabBarState();
// }
//
// class _CustomTabBarState extends State<CustomTabBar> {
//   late int selectedIndex;
//
//   @override
//   void initState() {
//     super.initState();
//     selectedIndex = widget.initialIndex;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final tabCount = widget.tabs.length;
//
//     return Container(
//       padding: const EdgeInsets.all(6),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.blueGrey.shade700),
//         borderRadius: BorderRadius.circular(40),
//       ),
//       child: tabCount <= 3
//           ? Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: widget.tabs.asMap().entries.map((entry) {
//                 int index = entry.key;
//                 String title = entry.value;
//                 bool isSelected = selectedIndex == index;
//
//                 return Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 4),
//                     child: MyCoButton(
//                       onTap: () {
//                         setState(() {
//                           selectedIndex = index;
//                         });
//                         widget.onTap(index);
//                       },
//                       title: title,
//                       boarderRadius: 30,
//                       backgroundColor: isSelected
//                           ? widget.selectedBgColor
//                           : Colors.transparent,
//                       borderColor: isSelected
//                           ? Colors.transparent
//                           : widget.unselectedTextAndBorderColor,
//                       borderWidth: 1.5,
//                       textStyle: TextStyle(
//                         fontWeight: FontWeight.w600,
//                         color: isSelected ? Colors.white : Colors.teal.shade700,
//                       ),
//                       isShadowBottomRight: isSelected,
//                     ),
//                   ),
//                 );
//               }).toList(),
//             )
//           : SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: widget.tabs.asMap().entries.map((entry) {
//                   int index = entry.key;
//                   String title = entry.value;
//                   bool isSelected = selectedIndex == index;
//
//                   return Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 4),
//                     child: MyCoButton(
//                       onTap: () {
//                         setState(() {
//                           selectedIndex = index;
//                         });
//                         widget.onTap(index);
//                       },
//                       title: title,
//                       boarderRadius: 30,
//                       backgroundColor: isSelected
//                           ? widget.selectedBgColor
//                           : Colors.transparent,
//                       borderColor: isSelected
//                           ? Colors.transparent
//                           : widget.unselectedTextAndBorderColor,
//                       borderWidth: 1.5,
//                       textStyle: TextStyle(
//                         fontWeight: FontWeight.w600,
//                         color: isSelected
//                             ? Colors.white
//                             : widget.unselectedTextAndBorderColor,
//                       ),
//                       isShadowBottomRight: isSelected,
//                     ),
//                   );
//                 }).toList(),
//               ),
//             ),
//     );
//   }
// }

import 'dart:math';

import 'package:flutter/material.dart';
import 'new_myco_button.dart';

class MyCustomTabBar extends StatefulWidget {
  final List<String> tabs;
  final Color selectedBgColor;
  final Color unselectedBorderAndTextColor;
  final Color tabBarBorderColor;
  final TextStyle? selectedTextStyle;
  final TextStyle? unselectedTextStyle;
  final double? borderRadius;
  final bool isShadowTopLeft;
  final bool isShadowTopRight;
  final bool isShadowBottomRight;
  final bool isShadowBottomLeft;

  const MyCustomTabBar({
    super.key,
    required this.tabs,
    required this.selectedBgColor,
    required this.unselectedBorderAndTextColor,
    this.selectedTextStyle,
    this.unselectedTextStyle,
    required this.isShadowTopLeft,
    required this.isShadowTopRight,
    required this.isShadowBottomRight,
    required this.isShadowBottomLeft,
    required this.tabBarBorderColor,
    this.borderRadius,
  });

  @override
  State<MyCustomTabBar> createState() => _MyCustomTabBarState();
}

class _MyCustomTabBarState extends State<MyCustomTabBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(color: widget.tabBarBorderColor),
        borderRadius: BorderRadius.circular(widget.borderRadius ?? 50),
        color: Colors.white,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(widget.tabs.length, (index) {
          if (widget.tabs.length <= 3) {
            return Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: MyCoButton(
                  isShadowBottomLeft: selectedIndex == index
                      ? widget.isShadowBottomLeft
                      : false,

                  isShadowBottomRight: selectedIndex == index
                      ? widget.isShadowBottomRight
                      : false,

                  isShadowTopLeft: selectedIndex == index
                      ? widget.isShadowTopLeft
                      : false,

                  isShadowTopRight: selectedIndex == index
                      ? widget.isShadowTopRight
                      : false,
                  title: widget.tabs[index],
                  onTap: () => setState(() => selectedIndex = index),
                  backgroundColor: index == selectedIndex
                      ? widget.selectedBgColor
                      : Colors.transparent,
                  borderColor: selectedIndex == index
                      ? null
                      : widget.unselectedBorderAndTextColor,
                  borderWidth: selectedIndex == index ? null : 1.5,
                  boarderRadius: widget.borderRadius ?? 50,
                  textStyle: index == selectedIndex
                      ? (widget.selectedTextStyle ??
                            const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ))
                      : (widget.unselectedTextStyle ??
                            TextStyle(
                              color: widget.unselectedBorderAndTextColor,
                              fontWeight: FontWeight.w500,
                            )),
                ),
              ),
            );
          }
          ;
          final isSelected = index == selectedIndex;
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: MyCoButton(
                isShadowBottomLeft: selectedIndex == index
                    ? widget.isShadowBottomLeft
                    : false,

                isShadowBottomRight: selectedIndex == index
                    ? widget.isShadowBottomRight
                    : false,

                isShadowTopLeft: selectedIndex == index
                    ? widget.isShadowTopLeft
                    : false,

                isShadowTopRight: selectedIndex == index
                    ? widget.isShadowTopRight
                    : false,
                title: widget.tabs[index],
                onTap: () => setState(() => selectedIndex = index),
                backgroundColor: isSelected
                    ? widget.selectedBgColor
                    : Colors.transparent,
                borderColor: widget.unselectedBorderAndTextColor,
                borderWidth: selectedIndex == index ? null : 1.5,
                boarderRadius: widget.borderRadius ?? 50,
                textStyle: isSelected
                    ? (widget.selectedTextStyle ??
                          const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ))
                    : (widget.unselectedTextStyle ??
                          TextStyle(
                            color: widget.unselectedBorderAndTextColor,
                            fontWeight: FontWeight.w500,
                          )),
              ),
            ),
          );
        }),
      ),
    );
  }
}
