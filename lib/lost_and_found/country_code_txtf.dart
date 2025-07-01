// import 'package:flutter/material.dart';
//
// class CustomMobileNumberField extends StatelessWidget {
//   final List<CountryModel> countries;
//   final CountryModel selectedCountry;
//   final TextEditingController controller;
//   final VoidCallback? onCountryTap;
//
//   final bool isEditable;
//   final TextStyle? countryTextStyle;
//   final TextStyle? numberTextStyle;
//   final Decoration? boxDecoration;
//   final ImageProvider? backgroundImage;
//
//   const CustomMobileNumberField({
//     super.key,
//     required this.countries,
//     required this.selectedCountry,
//     required this.controller,
//     this.onCountryTap,
//     this.isEditable = true,
//     this.countryTextStyle,
//     this.numberTextStyle,
//     this.boxDecoration,
//     this.backgroundImage,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration:
//           boxDecoration ??
//           BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(12),
//             border: Border.all(color: Colors.grey.shade400),
//             image: backgroundImage != null
//                 ? DecorationImage(image: backgroundImage!, fit: BoxFit.cover)
//                 : null,
//           ),
//       padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
//       child: Row(
//         children: [
//           GestureDetector(
//             onTap: onCountryTap,
//             child: Row(
//               children: [
//                 Text(
//                   selectedCountry.name,
//                   style:
//                       countryTextStyle ??
//                       const TextStyle(
//                         fontWeight: FontWeight.w600,
//                         fontSize: 16,
//                         color: Colors.black,
//                       ),
//                 ),
//                 const SizedBox(width: 6),
//                 const Icon(
//                   Icons.keyboard_arrow_down_rounded,
//                   color: Colors.blue,
//                   size: 20,
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(width: 10),
//           Text(
//             '${selectedCountry.dialCode} ',
//             style:
//                 numberTextStyle ??
//                 const TextStyle(
//                   fontWeight: FontWeight.w600,
//                   fontSize: 16,
//                   color: Colors.black,
//                 ),
//           ),
//           Expanded(
//             child: IgnorePointer(
//               ignoring: !isEditable,
//               child: TextField(
//                 controller: controller,
//                 keyboardType: TextInputType.phone,
//                 style: numberTextStyle,
//                 decoration: const InputDecoration.collapsed(
//                   hintText: "Enter phone number",
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class CountryModel {
//   final String name;
//   final String dialCode;
//
//   CountryModel({required this.name, required this.dialCode});
// }
import 'package:flutter/material.dart';

import '../../themes_colors/colors.dart';

class CountryModel {
  final String name;
  final String dialCode;

  CountryModel({required this.name, required this.dialCode});
}

class CustomMobileNumberField extends StatefulWidget {
  final List<CountryModel> countries;
  final TextEditingController controller;
  final bool isEditable;
  final TextStyle? countryTextStyle;
  final TextStyle? numberTextStyle;
  final Decoration? boxDecoration;
  final ImageProvider? backgroundImage;
  final void Function(CountryModel)? onCountryChanged;
  final double? width;
  final double? height;
  final double? dropdownHeight;
  final double? dropdownWidth;
  final BorderRadius? borderRadius;
  final Border? border;

  const CustomMobileNumberField({
    super.key,
    required this.countries,
    required this.controller,
    this.isEditable = true,
    this.countryTextStyle,
    this.numberTextStyle,
    this.boxDecoration,
    this.backgroundImage,
    this.onCountryChanged,
    this.width,
    this.height,
    this.dropdownHeight = 200,
    this.dropdownWidth = 200,
    this.borderRadius,
    this.border,
  });

  @override
  State<CustomMobileNumberField> createState() =>
      _CustomMobileNumberFieldState();
}

class _CustomMobileNumberFieldState extends State<CustomMobileNumberField> {
  late CountryModel _selectedCountry;
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  final GlobalKey _countryKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _selectedCountry = widget.countries.first;
  }

  void _toggleDropdown() {
    if (_overlayEntry == null) {
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context).insert(_overlayEntry!);
    } else {
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox =
        _countryKey.currentContext!.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx,
        top: offset.dy + size.height + 4,
        width: widget.dropdownWidth,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              height: widget.dropdownHeight ?? 200,
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 4),
                children: widget.countries.map((country) {
                  return ListTile(
                    dense: true,
                    title: Text("${country.name} (${country.dialCode})"),
                    onTap: () {
                      setState(() {
                        _selectedCountry = country;
                      });
                      widget.onCountryChanged?.call(country);
                      _overlayEntry?.remove();
                      _overlayEntry = null;
                    },
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _overlayEntry?.remove();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: CompositedTransformTarget(
        link: _layerLink,
        child: Container(
          decoration:
              widget.boxDecoration ??
              BoxDecoration(
                color: Colors.white,
                borderRadius: widget.borderRadius ?? BorderRadius.circular(7.0),
                border:
                    widget.border ?? Border.all(color: AppColors.borderColor),
                image: widget.backgroundImage != null
                    ? DecorationImage(
                        image: widget.backgroundImage!,
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          child: Row(
            children: [
              GestureDetector(
                onTap: _toggleDropdown,
                child: Container(
                  key: _countryKey,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        _selectedCountry.name,
                        style:
                            widget.countryTextStyle ??
                            const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                      ),
                      const SizedBox(width: 6),
                      const Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: AppColors.primary,
                        size: 30,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                _selectedCountry.dialCode,
                style:
                    widget.numberTextStyle ??
                    const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.black,
                    ),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: IgnorePointer(
                  ignoring: !widget.isEditable,
                  child: TextField(
                    controller: widget.controller,
                    keyboardType: TextInputType.phone,
                    style: widget.numberTextStyle,
                    decoration: const InputDecoration.collapsed(
                      hintText: "Enter phone number",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
