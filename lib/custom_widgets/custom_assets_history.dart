import 'package:flutter/material.dart';
import '../themes_colors/colors.dart';
import 'image_grid_preview_widget.dart';

class CustomAssetsHistory extends StatelessWidget {
  final String userName;
  final String title;
  final String designation;
  final String location;
  final String takeoverDate;
  final String handoverDate;
  final List<Color> gradientContainerColor;
  final List<String> imageList;
  final double boxHeight;
  final double boxWidth;
  final double imagesborderRadius;
  final int imagesContainerLength;
  final bool showIndicators;

  const CustomAssetsHistory({
    super.key,
    required this.userName,
    required this.designation,
    required this.location,
    required this.takeoverDate,
    required this.handoverDate,
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
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
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
                    colors: gradientContainerColor,
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize:
                            Theme.of(context).textTheme.bodyLarge?.fontSize ??
                            18,
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
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                    gradient: const LinearGradient(
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

          ListTile(
            leading: const CircleAvatar(
              backgroundImage: AssetImage("assets/girl.jpg"),
              radius: 35,
            ),
            title: Text(
              userName,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize ?? 14,
                fontFamily: 'Gilroy-SemiBold',
              ),
            ),
            subtitle: Text('$designation\n$location'),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _info("Takeover Date", takeoverDate, context),
                _info("Handover Date", handoverDate, context),
              ],
            ),
          ),

          const SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 12),
            child: ImageGridPreviewWidget(
              borderRadius: imagesborderRadius,
              imageList: imageList,
              boxHeight: boxHeight,
              boxWidth: boxWidth,
              containersLength: imagesContainerLength,
              key: key,
              showIndicators: showIndicators,
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
