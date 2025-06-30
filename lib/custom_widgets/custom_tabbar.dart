import 'package:flutter/material.dart';
import 'package:new_myco/custom_widgets/responsive.dart';
import 'package:new_myco/themes_colors/colors.dart';
import 'new_myco_button.dart';

class CustomTabBar extends StatefulWidget {
  final List<CustomTab> tabs;
  final Color? selectedBgColor;
  final Color? tabBarBorderColor;
  final TextStyle? selectedTextStyle;
  final TextStyle? unselectedTextStyle;
  final double? borderRadius;
  final bool isShadowTopLeft;
  final bool isShadowTopRight;
  final bool isShadowBottomRight;
  final bool isShadowBottomLeft;
  final bool isThreeTabs;
  final bool isTabBarBorder;
  final bool isTabBorder;
  final bool isSelectedTabBorder;
  final Color? selectedTabBorderColor;
  final void Function(int index)? onTap;
  final double? height;
  final double? width;
  final double? buttonWidth;

  const CustomTabBar({
    super.key,
    required this.tabs,
    this.selectedBgColor,
    this.tabBarBorderColor,
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
    this.isTabBarBorder = true,
    this.isTabBorder = true,
    this.isSelectedTabBorder = true,
    this.selectedTabBorderColor,
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
        // color: Colors.red,
        border: widget.isTabBarBorder == true
            ? Border.all(
                color: widget.tabBarBorderColor ?? AppColors.borderColor,
              )
            : null,
        borderRadius: BorderRadius.circular(widget.borderRadius ?? 50),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(widget.tabs.length, (index) {
            final isSelected = index == selectedIndex;
            final CustomTab tab = widget.tabs[index];
            final String title = tab.title;
            final Color unselectedColor = tab.unselectedColor;
            final Color selectedColor = tab.selectedColor ?? AppColors.primary;

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: MyCoButton(
                // spacing: 20,
                title: title,
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
                    ? widget.selectedBgColor ?? selectedColor
                    : Colors.transparent,
                borderColor: isSelected
                    ? (widget.isSelectedTabBorder
                          ? (widget.selectedTabBorderColor ?? AppColors.primary)
                          : Colors.transparent)
                    : (widget.isTabBorder
                          ? unselectedColor
                          : Colors.transparent),

                borderWidth: isSelected
                    ? (widget.isSelectedTabBorder ? 1.5 : 0)
                    : (widget.isTabBorder ? 1.5 : 0),

                boarderRadius: widget.borderRadius ?? 50,
                textStyle: isSelected
                    ? (widget.selectedTextStyle ??
                          const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ))
                    : (widget.unselectedTextStyle ??
                          TextStyle(
                            color: unselectedColor,
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

class CustomTab {
  final String title;
  final Color unselectedColor;
  final Color? selectedColor;

  CustomTab({
    required this.title,
    required this.unselectedColor,
    this.selectedColor,
  });
}
