import 'package:flutter/material.dart';
import '../custom_widgets/bottomsheet_otp.dart';
import '../custom_widgets/bottomsheet_radio_btn.dart';
import '../custom_widgets/custom_pi_chart.dart';
// import '../custom_widgets/out_of_range_travel_mode_bottom_sheet.dart';
// import '../custom_widgets/custom_active_assets.dart';
// import '../custom_widgets/custom_all_assets.dart';
// import '../custom_widgets/custom_assets_history.dart';
// import '../custom_widgets/custom_assets_holder.dart';
// import '../custom_widgets/custom_calender.dart';
import '../custom_widgets/custom_image_picker_container/custom_image_picker_containe.dart';
import '../custom_widgets/custom_past_assets.dart';
import '../custom_widgets/custom_tabbar.dart';
import '../custom_widgets/image_grid_preview_widget.dart';
import '../main.dart';
import '../themes_colors/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<ChartSegment> segments = [
    ChartSegment(label: 'Sandwich', value: 2, color: Color(0xFFF6E7B3)),
    ChartSegment(label: 'Sandwich', value: 2, color: Color(0xFFBFD978)),
    ChartSegment(label: 'Paid', value: 4, color: Color(0xFFBEE9E2)),
    ChartSegment(label: 'Unpaid', value: 5, color: Color(0xFFAAB3C1)),
    ChartSegment(label: 'Week Off', value: 2, color: Color(0xFFFFDCF5)),
    ChartSegment(label: 'Week Off', value: 2, color: Color(0xFFCCEAF2)),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(title: Text("MyCo Components")),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Padding(
              //   padding: EdgeInsets.all(20),
              //   child: CustomImagePickerContainer(),
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: CustomTabBar(
              //     isShadowBottomRight: false,
              //     isShadowBottomLeft: false,
              //     isShadowTopLeft: true,
              //     isShadowTopRight: false,
              //     tabs: [
              //       'Active Assets (5)',
              //       'Active Assets (5)',
              //       // 'Active Assets (5)',
              //     ],
              //     selectedBgColor: Colors.teal,
              //     unselectedBorderAndTextColor: AppColors.secondPrimary,
              //     tabBarBorderColor: AppColors.primary,
              //   ),
              // ),
              SizedBox(height: 50),

              Center(
                child: Container(
                  // height: 600,
                  // width: 600,
                  child: DonutChartWithLabels(
                    segments: [
                      ChartSegment(
                        label: 'Sandwich',
                        value: 2,
                        color: Color(0xFFFFF1C4),
                      ),
                      ChartSegment(
                        label: 'Sandwich',
                        value: 2,
                        color: Color(0xFFDFF3C3),
                      ),
                      ChartSegment(
                        label: 'Paid',
                        value: 4,
                        color: Color(0xFFE6F6F5),
                      ),
                      ChartSegment(
                        label: 'Week Off',
                        value: 2,
                        color: Color(0xFFD6F3F9),
                      ),
                      ChartSegment(
                        label: 'Week Off',
                        value: 2,
                        color: Color(0xFFFBE9F5),
                      ),
                      ChartSegment(
                        label: 'Unpaid',
                        value: 5,
                        color: Color(0xFFE2EAF0),
                      ),
                    ],
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: ImageGridPreviewWidget(
              //     imageList: [
              //       "https://nemesisuk.com/cdn/shop/files/RoushTrakPakLifestyleShoot32-XL_6aea9414-75fc-4c98-9dcb-6b97dd2df1f2.jpg?v=1716301158",
              //
              //       "https://c4.wallpaperflare.com/wallpaper/217/249/131/lamborghini-aventador-sports-car-cool-black-car-wallpaper-preview.jpg",
              //     ],
              //     boxHeight: 90,
              //     boxWidth: 90,
              //     showIndicators: true,
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: ImageGridPreviewWidget(
              //     imageList: [
              //       "https://nemesisuk.com/cdn/shop/files/RoushTrakPakLifestyleShoot32-XL_6aea9414-75fc-4c98-9dcb-6b97dd2df1f2.jpg?v=1716301158",
              //
              //       "https://c4.wallpaperflare.com/wallpaper/217/249/131/lamborghini-aventador-sports-car-cool-black-car-wallpaper-preview.jpg",
              //
              //       "https://bugatti-newsroom.imgix.net/fc5cfcbe-f01f-4ee2-b664-d26ed3ca11db/01_LVN_34-Front",
              //     ],
              //     boxHeight: 100,
              //     boxWidth: 100,
              //     showIndicators: true,
              //   ),
              // ),
              //
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: ImageGridPreviewWidget(
              //     imageList: [
              //       "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScGtiKpXZ_FM45KQwYycH4jjImU6ja0jpz6Sw38tr3UxtgcWyDJAkRA4pbgxhv2dI2dZ8&usqp=CAU",
              //       "https://c4.wallpaperflare.com/wallpaper/151/18/347/car-lamborghini-dark-wallpaper-preview.jpg",
              //       "https://nemesisuk.com/cdn/shop/files/RoushTrakPakLifestyleShoot32-XL_6aea9414-75fc-4c98-9dcb-6b97dd2df1f2.jpg?v=1716301158",
              //       "https://c4.wallpaperflare.com/wallpaper/217/249/131/lamborghini-aventador-sports-car-cool-black-car-wallpaper-preview.jpg",
              //       "https://bugatti-newsroom.imgix.net/fc5cfcbe-f01f-4ee2-b664-d26ed3ca11db/01_LVN_34-Front",
              //     ],
              //     boxHeight: 120,
              //     boxWidth: 120,
              //     showIndicators: true,
              //   ),
              // ),
              //
              // SizedBox(height: 50),
              //
              // ElevatedButton(
              //   onPressed: () {
              //     showModalBottomSheet(
              //       context: context,
              //       isScrollControlled: true,
              //       backgroundColor: Colors.transparent,
              //       builder: (_) => OutOfRangeTravelModeBottomSheet(),
              //     );
              //   },
              //   child: Text("Travel mode Bottom Sheet"),
              // ),
              // SizedBox(height: 50),
              //
              // ElevatedButton(
              //   onPressed: () {
              //     showDialog(
              //       context: context,
              //       builder: (context) {
              //         return AlertDialog(
              //           contentPadding: EdgeInsets.zero,
              //           shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadiusGeometry.circular(12),
              //           ),
              //           backgroundColor: AppColors.white,
              //           content: OutOfRangeTravelModeBottomSheet(),
              //         );
              //       },
              //     );
              //   },
              //   child: Text("travel mode alert"),
              // ),
              // SizedBox(height: 50),
              //
              // ElevatedButton(
              //   onPressed: () {
              //     showDialog(
              //       context: context,
              //       builder: (context) {
              //         return AlertDialog(
              //           shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadiusGeometry.circular(12),
              //           ),
              //           backgroundColor: AppColors.white,
              //           content: BottomsheetRadioButton(
              //             title: "Company Name",
              //             items: [
              //               {
              //                 "id": "1",
              //                 "title": "Delta Corporation Pvt. Ltd",
              //                 "subtitle":
              //                     "A-305 3rd Floor Azure Corporation Trade Tower Starlight Sarkhej, Ahmedabad Gujarat 380042",
              //               },
              //               {
              //                 "id": "2",
              //                 "title": "Communities heritage Pvt. Ltd",
              //                 "subtitle":
              //                     "A-Block, 5th Floor, WTT, World Trade Tower, Makarba, Sarkhej, Ahmedabad Gujarat 380051",
              //               },
              //               {
              //                 "id": "3",
              //                 "title": "belta Corporation Pvt. Ltd",
              //                 "subtitle":
              //                     "A-305 3rd Floor Azure Corporation Trade Tower Starlight Sarkhej, Ahmedabad Gujarat 380042",
              //               },
              //               {
              //                 "id": "4",
              //                 "title": "zommunities heritage Pvt. Ltd",
              //                 "subtitle":
              //                     "A-Block, 5th Floor, WTT, World Trade Tower, Makarba, Sarkhej, Ahmedabad Gujarat 380051",
              //               },
              //               {
              //                 "id": "5",
              //                 "title": "aelta Corporation Pvt. Ltd",
              //                 "subtitle":
              //                     "A-305 3rd Floor Azure Corporation Trade Tower Starlight Sarkhej, Ahmedabad Gujarat 380042",
              //               },
              //               {
              //                 "id": "6",
              //                 "title": "jommunities heritage Pvt. Ltd",
              //                 "subtitle":
              //                     "A-Block, 5th Floor, WTT, World Trade Tower, Makarba, Sarkhej, Ahmedabad Gujarat 380051",
              //               },
              //             ],
              //           ),
              //         );
              //       },
              //     );
              //   },
              //   child: Text("Press meeee for alert"),
              // ),
              //
              // SizedBox(height: 50),
              //
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
              //                 "A-305 3rd Floor Azure Corporation Trade Tower Starlight Sarkhej, Ahmedabad Gujarat 380042",
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
              //
              // SizedBox(height: 50),
              //
              // ElevatedButton(
              //   onPressed: () {
              //     showCustomEmailVerificationSheet(
              //       context: context,
              //       emailAddress: '',
              //       onSubmit: (String otp) {},
              //       onResend: () {},
              //       onVerifyButtonPressed: () {},
              //       length: 6,
              //     );
              //   },
              //   child: Text("Press meeee for otp bottom sheet"),
              // ),
              //
              // SizedBox(height: 50),
              //
              // ElevatedButton(
              //   onPressed: () {
              //     showCustomEmailVerificationSheet(
              //       isDialog: true,
              //       context: context,
              //       emailAddress: '',
              //       onSubmit: (String otp) {},
              //       onResend: () {},
              //       onVerifyButtonPressed: () {},
              //       length: 4,
              //     );
              //   },
              //   child: Text("Press meeee for otp  dialogue"),
              // ),
              //
              // SizedBox(height: 50),
              //
              // ElevatedButton(
              //   onPressed: () {
              //     showDialog(
              //       context: context,
              //       builder: (context) {
              //         return AlertDialog(
              //           contentPadding: EdgeInsets.zero,
              //           shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadiusGeometry.circular(12),
              //           ),
              //           backgroundColor: AppColors.white,
              //           content: CustomCalendar(
              //             totalPreviousYear: 0,
              //             totalNextYear: 0,
              //             isMultipleSelection: false,
              //             isRangeSelectionMode: true,
              //             preselectSaturdays: true,
              //             preselectSundays: true,
              //             customDatesAsSelected: [
              //               DateTime(2025, 6, 2),
              //               DateTime(2025, 6, 10),
              //             ],
              //           ),
              //         );
              //       },
              //     );
              //   },
              //   child: Text("Press meeee for calender"),
              // ),
              //
              // SizedBox(height: 50),
              //
              // // CustomActiveAssets(
              // //   title: "Desktop",
              // //   assetId: "AS100",
              // //   imageUrl: 'assets/tiger.jpeg',
              // //   brand: "Acer",
              // //   serialNo: "NKXSSDSDSDS12121212",
              // //   handoverDate: "02-05-2025",
              // //   topBarColor: const Color(0xFF3BC0A8),
              // // ),
              // CustomActiveAssets(
              //   title: 'Desktop',
              //   code: 'AS100',
              //   imageUrl: 'assets/laptop.png',
              //   brand: 'Acer',
              //   serial: 'NXKSSDSDSDS12121212',
              //   handover: '02-05-2025',
              //   gradientContainerColor: [Colors.teal.shade300, Colors.teal],
              // ),
              //
              // SizedBox(height: 50),
              //
              // CustomPastAssets(
              //   showIndicators: true,
              //   handoverImagesborderRadius: 12,
              //   takeoverImagesborderRadius: 12,
              //   boxWidth: 60,
              //   boxHeight: 60,
              //   handoverImagesContainersLength: 2,
              //   takeoverImagesContainersLength: 3,
              //   handoverImageList: [
              //     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScGtiKpXZ_FM45KQwYycH4jjImU6ja0jpz6Sw38tr3UxtgcWyDJAkRA4pbgxhv2dI2dZ8&usqp=CAU",
              //     "https://c4.wallpaperflare.com/wallpaper/151/18/347/car-lamborghini-dark-wallpaper-preview.jpg",
              //     "https://nemesisuk.com/cdn/shop/files/RoushTrakPakLifestyleShoot32-XL_6aea9414-75fc-4c98-9dcb-6b97dd2df1f2.jpg?v=1716301158",
              //     "https://c4.wallpaperflare.com/wallpaper/217/249/131/lamborghini-aventador-sports-car-cool-black-car-wallpaper-preview.jpg",
              //     "https://bugatti-newsroom.imgix.net/fc5cfcbe-f01f-4ee2-b664-d26ed3ca11db/01_LVN_34-Front",
              //   ],
              //   takeoverImageList: [
              //     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScGtiKpXZ_FM45KQwYycH4jjImU6ja0jpz6Sw38tr3UxtgcWyDJAkRA4pbgxhv2dI2dZ8&usqp=CAU",
              //     "https://c4.wallpaperflare.com/wallpaper/151/18/347/car-lamborghini-dark-wallpaper-preview.jpg",
              //     "https://nemesisuk.com/cdn/shop/files/RoushTrakPakLifestyleShoot32-XL_6aea9414-75fc-4c98-9dcb-6b97dd2df1f2.jpg?v=1716301158",
              //     "https://c4.wallpaperflare.com/wallpaper/217/249/131/lamborghini-aventador-sports-car-cool-black-car-wallpaper-preview.jpg",
              //     "https://bugatti-newsroom.imgix.net/fc5cfcbe-f01f-4ee2-b664-d26ed3ca11db/01_LVN_34-Front",
              //   ],
              //   title: 'Laptop',
              //   code: 'LTP-0021',
              //   imageUrl: 'assets/mail.png',
              //   brand: 'Dell Latitude 5490',
              //   serial: 'DLT5490SN2023',
              //   handoverDate: '2023-05-10',
              //   takeoverDate: '2025-02-12',
              //   gradientContainerColor: [Color(0xFF29B6F6), Color(0xFF0288D1)],
              // ),
              //
              // CustomAllAssets(
              //   title: 'Mobile Phone',
              //   code: 'MOB-0034',
              //   imageUrl: 'assets/mail.png',
              //   brand: 'Samsung Galaxy S21',
              //   serial: 'SGS21SN2023',
              //   handover: '2023-06-15',
              //   gradientContainerColor: [Color(0xFF29B6F6), Color(0xFF0288D1)],
              //   onEdit: () {},
              //   onQRCode: () {},
              //   onViewDetails: () {},
              //   category: 'Electronics',
              // ),
              //
              // SizedBox(height: 50),
              //
              // CustomAssetsHolder(
              //   boxHeight: 80,
              //   boxWidth: 80,
              //   showIndicators: true,
              //   imageList: [
              //     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScGtiKpXZ_FM45KQwYycH4jjImU6ja0jpz6Sw38tr3UxtgcWyDJAkRA4pbgxhv2dI2dZ8&usqp=CAU",
              //     "https://c4.wallpaperflare.com/wallpaper/151/18/347/car-lamborghini-dark-wallpaper-preview.jpg",
              //     "https://nemesisuk.com/cdn/shop/files/RoushTrakPakLifestyleShoot32-XL_6aea9414-75fc-4c98-9dcb-6b97dd2df1f2.jpg?v=1716301158",
              //     "https://nemesisuk.com/cdn/shop/files/RoushTrakPakLifestyleShoot32-XL_6aea9414-75fc-4c98-9dcb-6b97dd2df1f2.jpg?v=1716301158",
              //   ],
              //   imagesborderRadius: 12,
              //   imagesContainerLength: 3,
              //   userName: "Mukund ",
              //   designation: "QA",
              //   location: "QA Technical - Junagadh",
              //   title: "Mukund Patel",
              //   brand: "Acer",
              //   serial: "NXKSSDSDSDS12121212",
              //   handoverDate: "02-05-2025",
              //   gradientContainerColor: [Color(0xFF29B6F6), Color(0xFF0288D1)],
              //   imageUrl: 'assets/laptop.png',
              //   imageTitle: "HP AS112",
              // ),
              //
              // SizedBox(height: 50),
              //
              // CustomAssetsHistory(
              //   boxHeight: 80,
              //   boxWidth: 80,
              //   showIndicators: true,
              //   imageList: [
              //     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScGtiKpXZ_FM45KQwYycH4jjImU6ja0jpz6Sw38tr3UxtgcWyDJAkRA4pbgxhv2dI2dZ8&usqp=CAU",
              //     "https://c4.wallpaperflare.com/wallpaper/151/18/347/car-lamborghini-dark-wallpaper-preview.jpg",
              //     "https://nemesisuk.com/cdn/shop/files/RoushTrakPakLifestyleShoot32-XL_6aea9414-75fc-4c98-9dcb-6b97dd2df1f2.jpg?v=1716301158",
              //     "https://nemesisuk.com/cdn/shop/files/RoushTrakPakLifestyleShoot32-XL_6aea9414-75fc-4c98-9dcb-6b97dd2df1f2.jpg?v=1716301158",
              //   ],
              //   imagesborderRadius: 12,
              //   imagesContainerLength: 3,
              //   gradientContainerColor: [Color(0xFF29B6F6), Color(0xFF0288D1)],
              //   userName: "Mukund",
              //   designation: "QA",
              //   location: "QA Technical - Junagadh",
              //   takeoverDate: "18-02-2025",
              //   handoverDate: "20-05-2025",
              //   title: 'Mukund Madhavkar',
              // ),
              //
              // SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
