import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_myco/custom_widgets/custom_progress_bar.dart';
import '../custom_widgets/bottomsheet_otp.dart';
import '../custom_widgets/bottomsheet_radio_btn.dart';
import '../custom_widgets/custom_face_scanner.dart';
import '../custom_widgets/custom_pi_chart.dart';
import '../custom_widgets/custom_inner_shadow.dart';
import '../custom_widgets/custom_stepper.dart';
import '../custom_widgets/custome_shadow_container.dart';
import '../custom_widgets/new_myco_button.dart';
import '../custom_widgets/out_of_range_travel_mode_bottom_sheet.dart';
import '../custom_widgets/custom_active_assets.dart';
import '../custom_widgets/custom_all_assets.dart';
import '../custom_widgets/custom_assets_history.dart';
import '../custom_widgets/custom_assets_holder.dart';
import '../custom_widgets/custom_calender.dart';
import '../custom_widgets/custom_image_picker_container/custom_image_picker_containe.dart';
import '../custom_widgets/custom_past_assets.dart';
import '../custom_widgets/custom_tabbar.dart';
import '../custom_widgets/image_grid_preview_widget.dart';
import '../custom_widgets/custom_slider.dart';
import '../lost_and_found/lost_and_found.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import '../custom_media_picker/custom_media_picker/custom_media_picker_container.dart';
import '../themes_colors/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  XFile? _capturedImage;
  void _openFaceScanner() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => FaceScannerScreen(
          jobTitle: 'UI/UX Designer',
          headerColor: Colors.teal,
          autoCloseDuration: const Duration(minutes: 10),
          onFaceCaptured: (image) {
            setState(() {
              _capturedImage = image;
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("MyCo Components"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LostAndFound()),
                  );
                },
                child: CustomShadowContainer(
                  // height: 200,
                  // width: 100,
                  image: Image.asset(
                    "assets/lost_and_found/ic_new_ui_lost_found.png",
                  ),
                  title: "Lost And Found",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CustomVerticalStepper(
                  steps: [
                    StepData(
                      title: 'Order Placed',
                      status: StepStatus.completed,
                    ),
                    StepData(title: 'Processing', status: StepStatus.pending),
                    StepData(
                      title: 'Shipped',
                      status: StepStatus.approved,
                      isStepDisabled: false,
                    ),
                    StepData(
                      title: 'Returned',
                      status: StepStatus.denied,

                      // isStepDisabled: true,
                    ),
                  ],
                  // globalStatus: StepStatus.denied,
                ),
              ),

              // Padding(
              //   padding: const EdgeInsets.all(10.0),
              //   child: CustomStepper(
              //     steps: [
              //       StepData(
              //         title: 'Order Placed',
              //         status: StepStatus.completed,
              //         details: [
              //           StepDetail(title: 'Date', description: '2023-01-15'),
              //           StepDetail(title: 'Time', description: '10:00 AM'),
              //         ],
              //       ),
              //       StepData(
              //         title: 'Processing',
              //         status: StepStatus.pending,
              //         details: [
              //           StepDetail(
              //             title: 'Estimated Completion',
              //             description: '24-48 hours',
              //           ),
              //         ],
              //       ),
              //       StepData(
              //         title: 'Shipped',
              //         status: StepStatus.approved,
              //         isStepDisabled: false,
              //         details: [
              //           StepDetail(
              //             title: 'Tracking ID',
              //             description: 'XYZ12345',
              //           ),
              //         ],
              //       ),
              //       StepData(
              //         title: 'Returned',
              //         status: StepStatus.denied,
              //         details: [
              //           StepDetail(
              //             title: 'Tracking ID',
              //             description: 'XYZ12345',
              //           ),
              //         ],
              //       ),
              //     ],
              //     isHorizontal: true, // Set this to false to switch to vertical
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    InnerShadowContainer(
                      height: 100,
                      width: 100,

                      backgroundColor: Colors.yellow,
                      borderRadius: 10,

                      isShadowTopLeft: true,
                      child: Text("Radha"),
                    ),
                    SizedBox(width: 10),
                    InnerShadowContainer(
                      height: 100,
                      width: 100,
                      backgroundColor: Colors.yellow,
                      borderRadius: 10,

                      isShadowTopRight: true,
                      child: Text("Radha"),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    InnerShadowContainer(
                      height: 100,
                      width: 100,
                      backgroundColor: Colors.yellow,
                      borderRadius: 10,
                      // isShadowBottomRight: true,
                      isShadowBottomLeft: true,
                      child: Text("Radha"),
                      // isShadowTopLeft: true,
                      // isShadowTopRight: true,
                    ),
                    SizedBox(width: 10),
                    InnerShadowContainer(
                      height: 100,
                      width: 100,
                      backgroundColor: Colors.yellow,
                      borderRadius: 10,
                      isShadowBottomRight: true,
                      child: Text("Radha"),
                      // isShadowTopLeft: true,
                      // isShadowTopRight: true,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 50),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: CustomSlider(
                  isPreviewEnabled: true,
                  // imageFit: BoxFit.contain,
                  imagePaths: ["assets/banner1.jpg", "assets/banner2.png"],
                  isCarousel: true,
                  isButton: true,
                  showBottomShadow: false,
                  showIndicator: false,
                  height: 200,
                  width: double.infinity,
                  switchDuration: const Duration(seconds: 7),
                  animationDuration: const Duration(seconds: 7),
                ),
              ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTabBar(
                  isSelectedTabBorder: false,
                  // selectedTabBorderColor: Colors.black,
                  // isTabBorder: false,
                  // isTabBarBorder: false,
                  // height: 70,
                  // width: 300,
                  borderRadius: 200,
                  buttonWidth: 120,
                  // isThreeTabs: true,
                  isShadowBottomRight: false,
                  isShadowBottomLeft: true,
                  isShadowTopLeft: false,
                  isShadowTopRight: false,
                  tabs: [
                    CustomTab(
                      title: "Approver hy",
                      unselectedColor: AppColors.primary,
                      selectedColor: Colors.red,
                    ),
                    CustomTab(
                      title: "Pending",
                      unselectedColor: AppColors.remove,
                      selectedColor: Colors.pink,
                    ),
                    CustomTab(
                      title: "Rejected",
                      unselectedColor: AppColors.GPSMediumColor,
                    ),
                    CustomTab(
                      title: "Approver",
                      unselectedColor: AppColors.primary,
                      selectedColor: Colors.red,
                    ),
                    CustomTab(
                      title: "Pending",
                      unselectedColor: AppColors.remove,
                      selectedColor: Colors.pink,
                    ),
                    CustomTab(
                      title: "Rejected",
                      unselectedColor: AppColors.GPSMediumColor,
                    ),
                  ],
                  // selectedBgColor: AppColors.secondPrimary,
                  tabBarBorderColor: AppColors.primary,
                ),
              ),
              SizedBox(height: 100),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: ElevatedButton(
              //     onPressed: () {
              //       _openFaceScanner();
              //     },
              //     child: const Text('Open Face Scanner'),
              //   ),
              // ),

              // const SizedBox(height: 24),
              // Container(
              //   width: 300,
              //   height: 300,
              //   color: Colors.black,
              //   child: Column(
              //     children: [
              //       const Text("Captured Face:"),
              //       const SizedBox(height: 12),
              //       if (_capturedImage != null)
              //         Image.file(
              //           File(_capturedImage!.path),
              //           width: 200,
              //           height: 200,
              //           fit: BoxFit.cover,
              //         ),
              //     ],
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: CustomSegmentedProgressBar(
                  isShadowBottomRight: true,
                  spacing: 10, // height: 15,
                  totalSegments: 4,
                  percentComplete: 99,
                  gradientColors: [
                    AppColors.primary,
                    AppColors.secondPrimary,
                    AppColors.GPSMediumColor,
                    AppColors.secondPrimary,
                    AppColors.primary,
                  ],
                ),
              ),
              SizedBox(height: 70),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: CustomSegmentedProgressBar(
                  // height: 15,
                  // defaultColor: Colors.red,
                  totalSegments: 4,
                  percentComplete: 0,
                  gradientColors: [
                    AppColors.primary,
                    AppColors.secondPrimary,
                    AppColors.GPSMediumColor,
                    AppColors.secondPrimary,
                    AppColors.primary,
                  ],
                ),
              ),
              SizedBox(height: 70),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: CustomSegmentedProgressBar(
                  // height: 15,
                  // defaultColor: Colors.red,
                  totalSegments: 4,
                  percentComplete: 40,
                  gradientColors: [
                    AppColors.primary,
                    AppColors.secondPrimary,
                    AppColors.GPSMediumColor,
                    AppColors.secondPrimary,
                    AppColors.primary,
                  ],
                ),
              ),
              SizedBox(height: 70),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: CustomSegmentedProgressBar(
                  // height: 15,
                  // defaultColor: Colors.red,
                  totalSegments: 4,
                  percentComplete: 75,
                  gradientColors: [
                    AppColors.primary,
                    AppColors.secondPrimary,
                    AppColors.GPSMediumColor,
                    AppColors.secondPrimary,
                    AppColors.primary,
                  ],
                ),
              ),
              SizedBox(height: 50),

              //
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: CustomTabBar(
              //     height: 70,
              //     // width: 300,
              //     borderRadius: 200,
              //     buttonWidth: 130,
              //     // isThreeTabs: true,
              //     isShadowBottomRight: false,
              //     isShadowBottomLeft: true,
              //     isShadowTopLeft: false,
              //     isShadowTopRight: false,
              //     tabs: [
              //       CustomTab(
              //         title: "Approver",
              //         unselectedColor: AppColors.primary,
              //         selectedColor: Colors.red,
              //       ),
              //       CustomTab(
              //         title: "Pending",
              //         unselectedColor: AppColors.remove,
              //         selectedColor: Colors.pink,
              //       ),
              //       CustomTab(
              //         title: "Rejected",
              //         unselectedColor: AppColors.GPSMediumColor,
              //       ),
              //     ],
              //     // selectedBgColor: AppColors.secondPrimary,
              //     tabBarBorderColor: AppColors.primary,
              //   ),
              // ),
              //
              // SizedBox(height: 50),
              // //
              // ElevatedButton(
              //   onPressed: () {
              //     showModalBottomSheet(
              //       context: context,
              //       isScrollControlled: true,
              //       backgroundColor: Colors.transparent,
              //       builder: (_) => BottomsheetRadioButton(
              //         // image: AssetImage("assets/tiger.jpeg"),
              //         showSnackBar: true,
              //         title: "Company Name",
              //         items: [
              //           {
              //             "id": "1",
              //             "title": "Delta Corporation Pvt. Ltd",
              //             "subtitle":
              //                 "A-305 3rd Floor Azure Corporation  Ahmedabad Gujarat 380042",
              //           },
              //           {
              //             "id": "2",
              //             "title": "Communities heritage Pvt. Ltd",
              //             "subtitle":
              //                 "A-Block, 5th Floor, WTT, World Trade Tower, Makarba, Sarkhej, Ahmedabad Gujarat 380051",
              //           },
              //           {
              //             "id": "3",
              //             "title": "belta Corporation Pvt. Ltd",
              //             "subtitle":
              //                 "A-305 3rd Floor Azure Corporation Trade Tower Starlight Sarkhej, Ahmedabad Gujarat 380042",
              //           },
              //           {
              //             "id": "4",
              //             "title": "zommunities heritage Pvt. Ltd",
              //             "subtitle":
              //                 "A-Block, 5th Floor, WTT, World Trade Tower, Makarba, Sarkhej, Ahmedabad Gujarat 380051",
              //           },
              //           {
              //             "id": "5",
              //             "title": "aelta Corporation Pvt. Ltd",
              //             "subtitle":
              //                 "A-305 3rd Floor Azure Corporation Trade Tower Starlight Sarkhej, Ahmedabad Gujarat 380042",
              //           },
              //           {
              //             "id": "6",
              //             "title": "jommunities heritage Pvt. Ltd",
              //             "subtitle":
              //                 "A-Block, 5th Floor, WTT, World Trade Tower, Makarba, Sarkhej, Ahmedabad Gujarat 380051",
              //           },
              //         ],
              //       ),
              //     );
              //   },
              //   child: Text("Press meeee for bottom sheet"),
              // ),
            ],
          ),
        ),
      ),
      // floatingActionButton: ExpandableFAB(
      //   onApplyLeave: () {
      //     print("Apply Leave clicked");
      //   },
      //   onApplyShortLeave: () {
      //     print("Apply Short Leave clicked");
      //   },
      // ),
    );
  }
}

//  //
//               // SizedBox(height: 50),
//               //
//               // ElevatedButton(
//               //   onPressed: () {
//               //     showCustomEmailVerificationSheet(
//               //       context: context,
//               //       emailAddress: '',
//               //       onSubmit: (String otp) {},
//               //       onResend: () {},
//               //       onVerifyButtonPressed: () {},
//               //       length: 6,
//               //     );
//               //   },
//               //   child: Text("Press meeee for otp bottom sheet"),
//               // ),
//               //
//               // SizedBox(height: 50),
//               //
//               // ElevatedButton(
//               //   onPressed: () {
//               //     showCustomEmailVerificationSheet(
//               //       isDialog: true,
//               //       context: context,
//               //       emailAddress: '',
//               //       onSubmit: (String otp) {},
//               //       onResend: () {},
//               //       onVerifyButtonPressed: () {},
//               //       length: 4,
//               //     );
//               //   },
//               //   child: Text("Press meeee for otp  dialogue"),
//               // ),
//               //
//               // SizedBox(height: 50),
//               //
//               // ElevatedButton(
//               //   onPressed: () {
//               //     showDialog(
//               //       context: context,
//               //       builder: (context) {
//               //         return AlertDialog(
//               //           contentPadding: EdgeInsets.zero,
//               //           shape: RoundedRectangleBorder(
//               //             borderRadius: BorderRadiusGeometry.circular(12),
//               //           ),
//               //           backgroundColor: AppColors.white,
//               //           content: CustomCalendar(
//               //             totalPreviousYear: 0,
//               //             totalNextYear: 0,
//               //             isMultipleSelection: false,
//               //             isRangeSelectionMode: true,
//               //             preselectSaturdays: true,
//               //             preselectSundays: true,
//               //             customDatesAsSelected: [
//               //               DateTime(2025, 6, 2),
//               //               DateTime(2025, 6, 10),
//               //             ],
//               //           ),
//               //         );
//               //       },
//               //     );
//               //   },
//               //   child: Text("Press meeee for calender"),
//               // ),
//               //
//               // SizedBox(height: 50),
//               //
//               // // CustomActiveAssets(
//               // //   title: "Desktop",
//               // //   assetId: "AS100",
//               // //   imageUrl: 'assets/tiger.jpeg',
//               // //   brand: "Acer",
//               // //   serialNo: "NKXSSDSDSDS12121212",
//               // //   handoverDate: "02-05-2025",
//               // //   topBarColor: const Color(0xFF3BC0A8),
//               // // ),
//               // CustomActiveAssets(
//               //   title: 'Desktop',
//               //   code: 'AS100',
//               //   imageUrl: 'assets/laptop.png',
//               //   brand: 'Acer',
//               //   serial: 'NXKSSDSDSDS12121212',
//               //   handover: '02-05-2025',
//               //   gradientContainerColor: [Colors.teal.shade300, Colors.teal],
//               // ),
//               //
//               // SizedBox(height: 50),
//               //
//               // CustomPastAssets(
//               //   showIndicators: true,
//               //   handoverImagesborderRadius: 12,
//               //   takeoverImagesborderRadius: 12,
//               //   boxWidth: 60,
//               //   boxHeight: 60,
//               //   handoverImagesContainersLength: 2,
//               //   takeoverImagesContainersLength: 3,
//               //   handoverImageList: [
//               //     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScGtiKpXZ_FM45KQwYycH4jjImU6ja0jpz6Sw38tr3UxtgcWyDJAkRA4pbgxhv2dI2dZ8&usqp=CAU",
//               //     "https://c4.wallpaperflare.com/wallpaper/151/18/347/car-lamborghini-dark-wallpaper-preview.jpg",
//               //     "https://nemesisuk.com/cdn/shop/files/RoushTrakPakLifestyleShoot32-XL_6aea9414-75fc-4c98-9dcb-6b97dd2df1f2.jpg?v=1716301158",
//               //     "https://c4.wallpaperflare.com/wallpaper/217/249/131/lamborghini-aventador-sports-car-cool-black-car-wallpaper-preview.jpg",
//               //     "https://bugatti-newsroom.imgix.net/fc5cfcbe-f01f-4ee2-b664-d26ed3ca11db/01_LVN_34-Front",
//               //   ],
//               //   takeoverImageList: [
//               //     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScGtiKpXZ_FM45KQwYycH4jjImU6ja0jpz6Sw38tr3UxtgcWyDJAkRA4pbgxhv2dI2dZ8&usqp=CAU",
//               //     "https://c4.wallpaperflare.com/wallpaper/151/18/347/car-lamborghini-dark-wallpaper-preview.jpg",
//               //     "https://nemesisuk.com/cdn/shop/files/RoushTrakPakLifestyleShoot32-XL_6aea9414-75fc-4c98-9dcb-6b97dd2df1f2.jpg?v=1716301158",
//               //     "https://c4.wallpaperflare.com/wallpaper/217/249/131/lamborghini-aventador-sports-car-cool-black-car-wallpaper-preview.jpg",
//               //     "https://bugatti-newsroom.imgix.net/fc5cfcbe-f01f-4ee2-b664-d26ed3ca11db/01_LVN_34-Front",
//               //   ],
//               //   title: 'Laptop',
//               //   code: 'LTP-0021',
//               //   imageUrl: 'assets/mail.png',
//               //   brand: 'Dell Latitude 5490',
//               //   serial: 'DLT5490SN2023',
//               //   handoverDate: '2023-05-10',
//               //   takeoverDate: '2025-02-12',
//               //   gradientContainerColor: [Color(0xFF29B6F6), Color(0xFF0288D1)],
//               // ),
//               //
//               // CustomAllAssets(
//               //   title: 'Mobile Phone',
//               //   code: 'MOB-0034',
//               //   imageUrl: 'assets/mail.png',
//               //   brand: 'Samsung Galaxy S21',
//               //   serial: 'SGS21SN2023',
//               //   handover: '2023-06-15',
//               //   gradientContainerColor: [Color(0xFF29B6F6), Color(0xFF0288D1)],
//               //   onEdit: () {},
//               //   onQRCode: () {},
//               //   onViewDetails: () {},
//               //   category: 'Electronics',
//               // ),
//               //
//               // SizedBox(height: 50),
//               //
//               // CustomAssetsHolder(
//               //   boxHeight: 80,
//               //   boxWidth: 80,
//               //   showIndicators: true,
//               //   imageList: [
//               //     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScGtiKpXZ_FM45KQwYycH4jjImU6ja0jpz6Sw38tr3UxtgcWyDJAkRA4pbgxhv2dI2dZ8&usqp=CAU",
//               //     "https://c4.wallpaperflare.com/wallpaper/151/18/347/car-lamborghini-dark-wallpaper-preview.jpg",
//               //     "https://nemesisuk.com/cdn/shop/files/RoushTrakPakLifestyleShoot32-XL_6aea9414-75fc-4c98-9dcb-6b97dd2df1f2.jpg?v=1716301158",
//               //     "https://nemesisuk.com/cdn/shop/files/RoushTrakPakLifestyleShoot32-XL_6aea9414-75fc-4c98-9dcb-6b97dd2df1f2.jpg?v=1716301158",
//               //   ],
//               //   imagesborderRadius: 12,
//               //   imagesContainerLength: 3,
//               //   userName: "Mukund ",
//               //   designation: "QA",
//               //   location: "QA Technical - Junagadh",
//               //   title: "Mukund Patel",
//               //   brand: "Acer",
//               //   serial: "NXKSSDSDSDS12121212",
//               //   handoverDate: "02-05-2025",
//               //   gradientContainerColor: [Color(0xFF29B6F6), Color(0xFF0288D1)],
//               //   imageUrl: 'assets/laptop.png',
//               //   imageTitle: "HP AS112",
//               // ),
//               //
//               // SizedBox(height: 50),
//               //
//               // CustomAssetsHistory(
//               //   boxHeight: 80,
//               //   boxWidth: 80,
//               //   showIndicators: true,
//               //   imageList: [
//               //     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScGtiKpXZ_FM45KQwYycH4jjImU6ja0jpz6Sw38tr3UxtgcWyDJAkRA4pbgxhv2dI2dZ8&usqp=CAU",
//               //     "https://c4.wallpaperflare.com/wallpaper/151/18/347/car-lamborghini-dark-wallpaper-preview.jpg",
//               //     "https://nemesisuk.com/cdn/shop/files/RoushTrakPakLifestyleShoot32-XL_6aea9414-75fc-4c98-9dcb-6b97dd2df1f2.jpg?v=1716301158",
//               //     "https://nemesisuk.com/cdn/shop/files/RoushTrakPakLifestyleShoot32-XL_6aea9414-75fc-4c98-9dcb-6b97dd2df1f2.jpg?v=1716301158",
//               //   ],
//               //   imagesborderRadius: 12,
//               //   imagesContainerLength: 3,
//               //   gradientContainerColor: [Color(0xFF29B6F6), Color(0xFF0288D1)],
//               //   userName: "Mukund",
//               //   designation: "QA",
//               //   location: "QA Technical - Junagadh",
//               //   takeoverDate: "18-02-2025",
//               //   handoverDate: "20-05-2025",
//               //   title: 'Mukund Madhavkar',
//               // ),
//               //
//               // SizedBox(height: 50),
// class GlassmorphismEffect extends StatelessWidget {
//   final double width;
//   final double height;
//   final double borderRadius;
//   final Widget? child;
//
//   const GlassmorphismEffect({
//     super.key,
//     required this.width,
//     required this.height,
//     this.borderRadius = 20,
//     this.child,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(borderRadius),
//       child: BackdropFilter(
//         filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
//         child: Container(
//           width: width,
//           height: height,
//           padding: const EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             color: Colors.white.withValues(alpha: 0.1),
//             borderRadius: BorderRadius.circular(borderRadius),
//             border: Border.all(
//               color: Colors.white.withValues(alpha: 0.2),
//               width: 1,
//             ),
//           ),
//           child: child ?? const SizedBox(),
//         ),
//       ),
//     );
//   }
// }
//
// class ExpandableFAB extends StatefulWidget {
//   final VoidCallback onApplyLeave;
//   final VoidCallback onApplyShortLeave;
//
//   const ExpandableFAB({
//     super.key,
//     required this.onApplyLeave,
//     required this.onApplyShortLeave,
//   });
//
//   @override
//   State<ExpandableFAB> createState() => _ExpandableFABState();
// }
//
// class _ExpandableFABState extends State<ExpandableFAB>
//     with SingleTickerProviderStateMixin {
//   bool isOpen = false;
//   late AnimationController _controller;
//   late Animation<double> _scaleAnim;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 200),
//     );
//     _scaleAnim = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
//   }
//
//   void toggle() {
//     setState(() {
//       isOpen = !isOpen;
//       if (isOpen) {
//         _controller.forward();
//       } else {
//         _controller.reverse();
//       }
//     });
//   }
//
//   Widget buildOption({
//     required IconData icon,
//     required String label,
//     required VoidCallback onTap,
//   }) {
//     return ScaleTransition(
//       scale: _scaleAnim,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(20),
//               boxShadow: const [
//                 BoxShadow(
//                   color: Colors.black12,
//                   blurRadius: 4,
//                   offset: Offset(2, 2),
//                 ),
//               ],
//             ),
//             child: Text(label, style: TextStyle(fontSize: 14)),
//           ),
//           const SizedBox(width: 8),
//           FloatingActionButton.small(
//             heroTag: label,
//             backgroundColor: Colors.white,
//             onPressed: () {
//               onTap();
//               toggle();
//             },
//             child: Icon(icon, color: Colors.blue),
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       alignment: Alignment.bottomRight,
//       children: [
//         if (isOpen)
//           GestureDetector(
//             onTap: toggle,
//             behavior: HitTestBehavior.opaque,
//             child: Container(color: Colors.transparent),
//           ),
//         Padding(
//           padding: const EdgeInsets.only(bottom: 80, right: 16),
//           child: isOpen
//               ? Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     buildOption(
//                       icon: Icons.note_add_outlined,
//                       label: "Apply Short Leave",
//                       onTap: widget.onApplyShortLeave,
//                     ),
//                     const SizedBox(height: 12),
//                     buildOption(
//                       icon: Icons.edit_calendar,
//                       label: "Apply Leave",
//                       onTap: widget.onApplyLeave,
//                     ),
//                   ],
//                 )
//               : SizedBox(),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(right: 16, bottom: 20),
//           child: FloatingActionButton(
//             onPressed: toggle,
//             backgroundColor: Colors.white,
//             child: Icon(isOpen ? Icons.close : Icons.add, color: Colors.blue),
//           ),
//         ),
//       ],
//     );
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }

// Container(
//   height: 400,
//   width: 300,
//   child: Stack(
//     fit: StackFit.expand,
//     children: [
//       Image.asset(
//         // Background image
//         'assets/tiger.jpeg',
//         fit: BoxFit.cover,
//       ),
//     ],
//   ),
// ),
// Padding(
//   padding: const EdgeInsets.all(20),
//   child: CustomMediaPickerContainer(
//     title: "Assets Image",
//     imageTitle: "Capture Image",
//     multipleImage: 5,
//     imagePath: "assets/gallery-export.png",
//     backgroundColor: Colors.blue.shade50,
//     isCameraShow: true,
//     isGallaryShow: true,
//     isDocumentShow: true,
//     // containerHeight: 200,
//   ),
// ),
// Padding(
//   padding: EdgeInsets.all(20),
//   child: CustomImagePickerContainer(
//     isCameraShow: true,
//     isGallaryShow: true,
//     isDocumentShow: true,
//     title: "Assets Image",
//     imageTitle: "Capture Image",
//     imagePath: "assets/gallery-export.png",
//     backgroundColor: Colors.blue.shade50,
//     // containerHeight: 300,
//   ),
// ),
// Padding(
//   padding: const EdgeInsets.all(8.0),
//   child: Text(
//     "No indicator with auto slider and carosual slider",
//     style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
//   ),
// ),

// Padding(
//   padding: const EdgeInsets.all(8.0),
//   child: Text(
//     "Indicators with carosuel slider",
//     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//   ),
// ),
//
// Padding(
//   padding: const EdgeInsets.all(8.0),
//   child: CustomSlider(
//     isButton: false,
//     imagePaths: [
//       "https://static.vecteezy.com/system/resources/thumbnails/048/162/647/small_2x/two-snow-covered-trees-in-a-white-landscape-photo.jpg",
//       "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8IxE78frqZkL71tLAjJqwtAK_udZkqfHv2Q&s",
//       "https://static.vecteezy.com/system/resources/thumbnails/024/703/613/small/amazing-still-reflections-at-lake-surrounded-by-mountains-created-with-generative-ai-photo.jpg",
//       "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHeCXBXlxKN4BO9ezT6nHiIv2E2A-DGyg_DesSRMivFNaAsdtTRdOOxa6BzCxKbTAByPE&usqp=CAU",
//       "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTu9pPTi6sJYwiM_MHafuDFQczkTQJABENfg&s",
//     ],
//     isCarousel: true,
//     showBottomShadow: false,
//     showIndicator: true,
//     height: 200,
//     width: double.infinity,
//     switchDuration: const Duration(seconds: 5),
//     animationDuration: const Duration(
//       seconds: 5,
//     ), // 🎞 Slide speed
//   ),
// ),
// Padding(
//   padding: const EdgeInsets.all(8.0),
//   child: Text(
//     "Carosuel False with indicators and timer",
//     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//   ),
// ),
// Padding(
//   padding: const EdgeInsets.all(8.0),
//   child: CustomSlider(
//     imagePaths: [
//       "https://static.vecteezy.com/system/resources/thumbnails/048/162/647/small_2x/two-snow-covered-trees-in-a-white-landscape-photo.jpg",
//       "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8IxE78frqZkL71tLAjJqwtAK_udZkqfHv2Q&s",
//       "https://static.vecteezy.com/system/resources/thumbnails/024/703/613/small/amazing-still-reflections-at-lake-surrounded-by-mountains-created-with-generative-ai-photo.jpg",
//       "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHeCXBXlxKN4BO9ezT6nHiIv2E2A-DGyg_DesSRMivFNaAsdtTRdOOxa6BzCxKbTAByPE&usqp=CAU",
//       "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTu9pPTi6sJYwiM_MHafuDFQczkTQJABENfg&s",
//     ],
//     isCarousel: false,
//     showBottomShadow: false,
//     showIndicator: true,
//     activeIndicatorColor: AppColors.primary,
//     inactiveIndicatorColor: AppColors.secondPrimary,
//     height: 220,
//     width: double.infinity,
//     switchDuration: const Duration(seconds: 3),
//     animationDuration: const Duration(
//       seconds: 3,
//     ), //🎞 Slide speed
//   ),
// ),
// SizedBox(
//   width: double.infinity,
//   height: 300,
//   child: CustomPaint(
//     painter: DonutChartPainter(
//       innerRadius: 70,
//       segmentWidth: 30,
//       const [
//         ChartSegment(
//           label: 'Sandwich',
//           value: 8,
//           color: Colors.orange,
//         ),
//         ChartSegment(
//           label: 'Paid',
//           value: 8,
//           color: Colors.green,
//         ),
//         ChartSegment(
//           label: 'Paid',
//           value: 8,
//           color: Colors.purple,
//         ),
//         ChartSegment(
//           label: 'Unpaid',
//           value: 8,
//           color: Colors.cyan,
//         ),
//         ChartSegment(
//           label: 'Unpaid',
//           value: 8,
//           color: Colors.pink,
//         ),
//         ChartSegment(
//           label: 'Week Off',
//           value: 8,
//           color: Colors.blue,
//         ),
//       ],
//     ),
//   ),
// ),

// MyCoButton(
//   onTap: () {},
//   title: "Button",
//   width: 100,
//   boarderRadius: 50,
// ),      // SizedBox(height: 50),
//               //
//               // Padding(
//               //   padding: const EdgeInsets.all(8.0),
//               //   child: ImageGridPreviewWidget(
//               //     imageList: [
//               //       "https://nemesisuk.com/cdn/shop/files/RoushTrakPakLifestyleShoot32-XL_6aea9414-75fc-4c98-9dcb-6b97dd2df1f2.jpg?v=1716301158",
//               //
//               //       "https://c4.wallpaperflare.com/wallpaper/217/249/131/lamborghini-aventador-sports-car-cool-black-car-wallpaper-preview.jpg",
//               //     ],
//               //     boxHeight: 90,
//               //     boxWidth: 90,
//               //     showIndicators: true,
//               //   ),
//               // ),
//               // Padding(
//               //   padding: const EdgeInsets.all(8.0),
//               //   child: ImageGridPreviewWidget(
//               //     imageList: [
//               //       "https://nemesisuk.com/cdn/shop/files/RoushTrakPakLifestyleShoot32-XL_6aea9414-75fc-4c98-9dcb-6b97dd2df1f2.jpg?v=1716301158",
//               //
//               //       "https://c4.wallpaperflare.com/wallpaper/217/249/131/lamborghini-aventador-sports-car-cool-black-car-wallpaper-preview.jpg",
//               //
//               //       "https://bugatti-newsroom.imgix.net/fc5cfcbe-f01f-4ee2-b664-d26ed3ca11db/01_LVN_34-Front",
//               //     ],
//               //     boxHeight: 100,
//               //     boxWidth: 100,
//               //     showIndicators: true,
//               //   ),
//               // ),
//               //
//               // Padding(
//               //   padding: const EdgeInsets.all(8.0),
//               //   child: ImageGridPreviewWidget(
//               //     imageList: [
//               //       "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScGtiKpXZ_FM45KQwYycH4jjImU6ja0jpz6Sw38tr3UxtgcWyDJAkRA4pbgxhv2dI2dZ8&usqp=CAU",
//               //       "https://c4.wallpaperflare.com/wallpaper/151/18/347/car-lamborghini-dark-wallpaper-preview.jpg",
//               //       "https://nemesisuk.com/cdn/shop/files/RoushTrakPakLifestyleShoot32-XL_6aea9414-75fc-4c98-9dcb-6b97dd2df1f2.jpg?v=1716301158",
//               //       "https://c4.wallpaperflare.com/wallpaper/217/249/131/lamborghini-aventador-sports-car-cool-black-car-wallpaper-preview.jpg",
//               //       "https://bugatti-newsroom.imgix.net/fc5cfcbe-f01f-4ee2-b664-d26ed3ca11db/01_LVN_34-Front",
//               //     ],
//               //     boxHeight: 120,
//               //     boxWidth: 120,
//               //     showIndicators: true,
//               //   ),
//               // ),
//               //
//               // SizedBox(height: 50),
//               //
//               // ElevatedButton(
//               //   onPressed: () {
//               //     showModalBottomSheet(
//               //       context: context,
//               //       isScrollControlled: true,
//               //       backgroundColor: Colors.transparent,
//               //       builder: (_) => OutOfRangeTravelModeBottomSheet(),
//               //     );
//               //   },
//               //   child: Text("Travel mode Bottom Sheet"),
//               // ),
//               // SizedBox(height: 50),
//               //
//               // ElevatedButton(
//               //   onPressed: () {
//               //     showDialog(
//               //       context: context,
//               //       builder: (context) {
//               //         return AlertDialog(
//               //           contentPadding: EdgeInsets.zero,
//               //           shape: RoundedRectangleBorder(
//               //             borderRadius: BorderRadiusGeometry.circular(12),
//               //           ),
//               //           backgroundColor: AppColors.white,
//               //           content: OutOfRangeTravelModeBottomSheet(),
//               //         );
//               //       },
//               //     );
//               //   },
//               //   child: Text("travel mode alert"),
//               // ),
//               // SizedBox(height: 50),
//               //
//               // ElevatedButton(
//               //   onPressed: () {
//               //     showDialog(
//               //       context: context,
//               //       builder: (context) {
//               //         return AlertDialog(
//               //           shape: RoundedRectangleBorder(
//               //             borderRadius: BorderRadiusGeometry.circular(12),
//               //           ),
//               //           backgroundColor: AppColors.white,
//               //           content: BottomsheetRadioButton(
//               //             title: "Company Name",
//               //             items: [
//               //               {
//               //                 "id": "1",
//               //                 "title": "Delta Corporation Pvt. Ltd",
//               //                 "subtitle":
//               //                     "A-305 3rd Floor Azure Corporation Trade Tower Starlight Sarkhej, Ahmedabad Gujarat 380042",
//               //               },
//               //               {
//               //                 "id": "2",
//               //                 "title": "Communities heritage Pvt. Ltd",
//               //                 "subtitle":
//               //                     "A-Block, 5th Floor, WTT, World Trade Tower, Makarba, Sarkhej, Ahmedabad Gujarat 380051",
//               //               },
//               //               {
//               //                 "id": "3",
//               //                 "title": "belta Corporation Pvt. Ltd",
//               //                 "subtitle":
//               //                     "A-305 3rd Floor Azure Corporation Trade Tower Starlight Sarkhej, Ahmedabad Gujarat 380042",
//               //               },
//               //               {
//               //                 "id": "4",
//               //                 "title": "zommunities heritage Pvt. Ltd",
//               //                 "subtitle":
//               //                     "A-Block, 5th Floor, WTT, World Trade Tower, Makarba, Sarkhej, Ahmedabad Gujarat 380051",
//               //               },
//               //               {
//               //                 "id": "5",
//               //                 "title": "aelta Corporation Pvt. Ltd",
//               //                 "subtitle":
//               //                     "A-305 3rd Floor Azure Corporation Trade Tower Starlight Sarkhej, Ahmedabad Gujarat 380042",
//               //               },
//               //               {
//               //                 "id": "6",
//               //                 "title": "jommunities heritage Pvt. Ltd",
//               //                 "subtitle":
//               //                     "A-Block, 5th Floor, WTT, World Trade Tower, Makarba, Sarkhej, Ahmedabad Gujarat 380051",
//               //               },
//               //             ],
//               //           ),
//               //         );
//               //       },
//               //     );
//               //   },
//               //   child: Text("Press meeee for alert"),
//               // ),
