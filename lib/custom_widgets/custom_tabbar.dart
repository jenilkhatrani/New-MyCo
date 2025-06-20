// import 'package:flutter/material.dart';
// import 'new_myco_button.dart';
//
// class CustomTabBar extends StatefulWidget {
//   final List<String> tabs;
//   final Color selectedBgColor;
//   final Color unselectedBorderAndTextColor;
//   final Color tabBarBorderColor;
//   final TextStyle? selectedTextStyle;
//   final TextStyle? unselectedTextStyle;
//   final double? borderRadius;
//   final bool isShadowTopLeft;
//   final bool isShadowTopRight;
//   final bool isShadowBottomRight;
//   final bool isShadowBottomLeft;
//   final void Function(int index)? onTap;
//
//   const CustomTabBar({
//     super.key,
//     required this.tabs,
//     required this.selectedBgColor,
//     required this.unselectedBorderAndTextColor,
//     this.selectedTextStyle,
//     this.unselectedTextStyle,
//     required this.isShadowTopLeft,
//     required this.isShadowTopRight,
//     required this.isShadowBottomRight,
//     required this.isShadowBottomLeft,
//     required this.tabBarBorderColor,
//     this.borderRadius,
//     this.onTap,
//   });
//
//   @override
//   State<CustomTabBar> createState() => _CustomTabBarState();
// }
//
// class _CustomTabBarState extends State<CustomTabBar> {
//   int selectedIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
//       decoration: BoxDecoration(
//         border: Border.all(color: widget.tabBarBorderColor),
//         borderRadius: BorderRadius.circular(widget.borderRadius ?? 50),
//         color: Colors.white,
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: List.generate(widget.tabs.length, (index) {
//           if (widget.tabs.length <= 3) {
//             return Expanded(
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 4),
//                 child: MyCoButton(
//                   isShadowBottomLeft: selectedIndex == index
//                       ? widget.isShadowBottomLeft
//                       : false,
//
//                   isShadowBottomRight: selectedIndex == index
//                       ? widget.isShadowBottomRight
//                       : false,
//
//                   isShadowTopLeft: selectedIndex == index
//                       ? widget.isShadowTopLeft
//                       : false,
//
//                   isShadowTopRight: selectedIndex == index
//                       ? widget.isShadowTopRight
//                       : false,
//                   title: widget.tabs[index],
//                   onTap: () {
//                     setState(() => selectedIndex = index);
//                     widget.onTap?.call(
//                       index,
//                     ); // 👈 Trigger callback if provided
//                   },
//                   backgroundColor: index == selectedIndex
//                       ? widget.selectedBgColor
//                       : Colors.transparent,
//                   borderColor: selectedIndex == index
//                       ? null
//                       : widget.unselectedBorderAndTextColor,
//                   borderWidth: selectedIndex == index ? null : 1.5,
//                   boarderRadius: widget.borderRadius ?? 50,
//                   textStyle: index == selectedIndex
//                       ? (widget.selectedTextStyle ??
//                             const TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.w600,
//                             ))
//                       : (widget.unselectedTextStyle ??
//                             TextStyle(
//                               color: widget.unselectedBorderAndTextColor,
//                               fontWeight: FontWeight.w500,
//                             )),
//                 ),
//               ),
//             );
//           }
//           ;
//           final isSelected = index == selectedIndex;
//           return Expanded(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 3),
//               child: MyCoButton(
//                 isShadowBottomLeft: selectedIndex == index
//                     ? widget.isShadowBottomLeft
//                     : false,
//
//                 isShadowBottomRight: selectedIndex == index
//                     ? widget.isShadowBottomRight
//                     : false,
//
//                 isShadowTopLeft: selectedIndex == index
//                     ? widget.isShadowTopLeft
//                     : false,
//
//                 isShadowTopRight: selectedIndex == index
//                     ? widget.isShadowTopRight
//                     : false,
//                 title: widget.tabs[index],
//                 onTap: () {
//                   setState(() => selectedIndex = index);
//                   widget.onTap?.call(index); // 👈 Trigger callback if provided
//                 },
//                 backgroundColor: isSelected
//                     ? widget.selectedBgColor
//                     : Colors.transparent,
//                 borderColor: widget.unselectedBorderAndTextColor,
//                 borderWidth: selectedIndex == index ? null : 1.5,
//                 boarderRadius: widget.borderRadius ?? 50,
//                 textStyle: isSelected
//                     ? (widget.selectedTextStyle ??
//                           const TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.w600,
//                           ))
//                     : (widget.unselectedTextStyle ??
//                           TextStyle(
//                             color: widget.unselectedBorderAndTextColor,
//                             fontWeight: FontWeight.w500,
//                           )),
//               ),
//             ),
//           );
//         }),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:new_myco/custom_widgets/responsive.dart';
import 'new_myco_button.dart';

class CustomTabBar extends StatefulWidget {
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
  final bool isThreeTabs;
  final void Function(int index)? onTap;
  final double? height;
  final double? width;
  final double? buttonWidth;

  const CustomTabBar({
    super.key,
    required this.tabs,
    required this.selectedBgColor,
    required this.unselectedBorderAndTextColor,
    required this.tabBarBorderColor,
    this.selectedTextStyle,
    this.unselectedTextStyle,
    this.borderRadius,
    this.onTap,
    this.height = 70,
    this.width = double.infinity,
    this.isShadowTopLeft = false,
    this.isShadowTopRight = false,
    this.isShadowBottomRight = false,
    this.isShadowBottomLeft = false,
    this.buttonWidth,
    this.isThreeTabs = false,
  });

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: widget.tabBarBorderColor),
        borderRadius: BorderRadius.circular(widget.borderRadius ?? 50),
        color: Colors.white,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(widget.tabs.length, (index) {
            final isSelected = index == selectedIndex;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: MyCoButton(
                title: widget.tabs[index],
                onTap: () {
                  setState(() => selectedIndex = index);
                  widget.onTap?.call(index);
                },
                isShadowBottomLeft: isSelected
                    ? widget.isShadowBottomLeft
                    : false,
                isShadowBottomRight: isSelected
                    ? widget.isShadowBottomRight
                    : false,
                isShadowTopLeft: isSelected ? widget.isShadowTopLeft : false,
                isShadowTopRight: isSelected ? widget.isShadowTopRight : false,
                backgroundColor: isSelected
                    ? widget.selectedBgColor
                    : Colors.transparent,
                borderColor: isSelected
                    ? null
                    : widget.unselectedBorderAndTextColor,
                borderWidth: isSelected ? null : 1.5,
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
                height: widget.height,
                width: widget.isThreeTabs
                    ? getWidth(context) * 0.29
                    : widget.buttonWidth ?? null,
                // width: widget.width - 12,
              ),
            );
          }),
        ),
      ),
    );
  }
}
