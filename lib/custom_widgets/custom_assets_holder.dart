import 'package:flutter/material.dart';
import 'package:new_myco/custom_widgets/responsive.dart';
import '../themes_colors/colors.dart';
import 'doted_line.dart';
import 'image_grid_preview_widget.dart';

class CustomAssetsHolder extends StatefulWidget {
  final String userName;
  final String designation;
  final String location;
  final String imageTitle;
  final String title;
  final String brand;
  final String serial;
  final String handoverDate;
  final String imageUrl;
  final List<Color> gradientContainerColor;
  final List<String> imageList;
  final double boxHeight;
  final double boxWidth;
  final double imagesborderRadius;
  final int imagesContainerLength;
  final bool showIndicators;

  CustomAssetsHolder({
    super.key,
    required this.userName,
    required this.designation,
    required this.location,
    required this.imageTitle,
    required this.brand,
    required this.serial,
    required this.handoverDate,
    required this.imageUrl,
    required this.gradientContainerColor,
    required this.imageList,
    required this.boxHeight,
    required this.boxWidth,
    required this.imagesborderRadius,
    required this.imagesContainerLength,
    required this.showIndicators,
    required this.title,
  });

  @override
  State<CustomAssetsHolder> createState() => _CustomAssetsHolderState();
}

class _CustomAssetsHolderState extends State<CustomAssetsHolder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.borderColor, width: 1.2),
        borderRadius: BorderRadius.circular(13),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 6,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2),
                      blurRadius: 10,
                      spreadRadius: 1,
                    ),
                  ],
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: widget.gradientContainerColor,
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize:
                            Theme.of(context).textTheme.titleMedium?.fontSize ??
                            14,
                        fontFamily: 'Gilroy-SemiBold',
                      ),
                    ),
                  ],
                ),
              ),

              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: 25,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0x33FFFFFF), // 20% white
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.all(15),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage("assets/girl.jpg"),
                  radius: 35,
                ),

                SizedBox(width: getWidth(context) * .050),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.userName,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize:
                            Theme.of(context).textTheme.titleMedium?.fontSize ??
                            14,
                        fontFamily: 'Gilroy-SemiBold',
                      ),
                    ),
                    Text(
                      widget.designation,
                      style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.bodyMedium?.fontSize ??
                            14,
                        fontFamily: 'Gilroy-Regular',
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    Text(
                      widget.location,
                      style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.bodyMedium?.fontSize ??
                            14,
                        fontFamily: 'Gilroy-Regular',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.imageTitle,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize:
                            Theme.of(context).textTheme.bodyLarge?.fontSize ??
                            18,
                        fontFamily: 'Gilroy-Bold',
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        widget.imageUrl,
                        width: getWidth(context) * .30,
                        height: getWidth(context) * .30,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 15,
                  ),
                  child: CustomPaint(
                    size: Size(4, 0),
                    painter: DottedLine(
                      dotWidth: 2,
                      dotHeight: 6,
                      spacing: 4,
                      color: AppColors.primary,
                      vertical: true,
                    ),
                  ),
                ),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: getHeight(context) * .02),
                      _info("Brand", widget.brand, context),
                      SizedBox(height: getHeight(context) * .01),

                      _info("Sr . No./MAC/Sim", widget.serial, context),
                      SizedBox(height: getHeight(context) * .01),

                      _info("Handover", widget.handoverDate, context),
                      SizedBox(height: getHeight(context) * .01),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ImageGridPreviewWidget(
              borderRadius: widget.imagesborderRadius,
              imageList: widget.imageList,
              boxHeight: widget.boxHeight,
              boxWidth: widget.boxWidth,
              containersLength: widget.imagesContainerLength,
              key: widget.key,
              showIndicators: widget.showIndicators,
            ),
          ),
        ],
      ),
    );
  }

  Widget _info(String title, String value, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: Theme.of(context).textTheme.titleMedium?.fontSize ?? 14,
            fontFamily: 'Gilroy-SemiBold',
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize ?? 14,
            fontFamily: 'Gilroy-Regular',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
