import '../custom_widgets/bottomsheet_otp.dart';
import '../custom_widgets/bottomsheet_radio_btn.dart';
import '../custom_widgets/custom_pi_chart.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(title: Text("MyCo Components")),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomMediaPickerContainer(
                  title: "Assets Image",
                  imageTitle: "Capture Image",
                  multipleImage: 5,
                  imagePath: "assets/gallery-export.png",
                  backgroundColor: Colors.blue.shade50,
                  isCameraShow: true,
                  isGallaryShow: true,
                  isDocumentShow: true,
                  // containerHeight: 200,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: CustomImagePickerContainer(
                  // isCameraShow: true,
                  // isGallaryShow: true,
                  // isDocumentShow: false,
                  title: "Assets Image",
                  imageTitle: "Capture Image",
                  imagePath: "assets/gallery-export.png",
                  backgroundColor: Colors.blue.shade50,
                  containerHeight: 300,
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Text(
              //     "No indicator with auto slider and carosual slider",
              //     style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              //   ),
              // ),
              // Padding(
              //   padding: EdgeInsets.all(8.0),
              //   child: CustomSlider(
              //     isPreviewEnabled: true,
              //
              //     imagePaths: [
              //       "https://assetscdn1.paytm.com/images/catalog/product/H/HO/HOMMY-MAGIC-GIFMY-M778691FD4EEE57/1563033342582_0..jpg?imwidth=540&impolicy=hq",
              //       "https://static.vecteezy.com/system/resources/thumbnails/048/162/647/small_2x/two-snow-covered-trees-in-a-white-landscape-photo.jpg",
              //       "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8IxE78frqZkL71tLAjJqwtAK_udZkqfHv2Q&s",
              //       "https://static.vecteezy.com/system/resources/thumbnails/024/703/613/small/amazing-still-reflections-at-lake-surrounded-by-mountains-created-with-generative-ai-photo.jpg",
              //       "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHeCXBXlxKN4BO9ezT6nHiIv2E2A-DGyg_DesSRMivFNaAsdtTRdOOxa6BzCxKbTAByPE&usqp=CAU",
              //       "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTu9pPTi6sJYwiM_MHafuDFQczkTQJABENfg&s",
              //     ],
              //     isCarousel: true,
              //     isButton: true,
              //     showBottomShadow: true,
              //     showIndicator: false,
              //     height: 200,
              //     width: double.infinity,
              //     switchDuration: const Duration(seconds: 7),
              //     animationDuration: const Duration(seconds: 7),
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
              // ),
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
              //       'Active Assets',
              //       'Active Assets (5)',
              //       'Active Assets (5)',
              //       // 'Active Assets (5)',
              //       // 'Active Assets (5)',
              //     ],
              //     selectedBgColor: Colors.teal,
              //     unselectedBorderAndTextColor: AppColors.secondPrimary,
              //     tabBarBorderColor: AppColors.primary,
              //   ),
              // ),
              // SizedBox(height: 50),
              //
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
      floatingActionButton: ExpandableFAB(
        onApplyLeave: () {
          print("Apply Leave clicked");
        },
        onApplyShortLeave: () {
          print("Apply Short Leave clicked");
        },
      ),
    );
  }
}

class ExpandableFAB extends StatefulWidget {
  final VoidCallback onApplyLeave;
  final VoidCallback onApplyShortLeave;

  const ExpandableFAB({
    super.key,
    required this.onApplyLeave,
    required this.onApplyShortLeave,
  });

  @override
  State<ExpandableFAB> createState() => _ExpandableFABState();
}

class _ExpandableFABState extends State<ExpandableFAB>
    with SingleTickerProviderStateMixin {
  bool isOpen = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    _scaleAnim = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
  }

  void toggle() {
    setState(() {
      isOpen = !isOpen;
      if (isOpen) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  Widget buildOption({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return ScaleTransition(
      scale: _scaleAnim,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(2, 2),
                ),
              ],
            ),
            child: Text(label, style: TextStyle(fontSize: 14)),
          ),
          const SizedBox(width: 8),
          FloatingActionButton.small(
            heroTag: label,
            backgroundColor: Colors.white,
            onPressed: () {
              onTap();
              toggle();
            },
            child: Icon(icon, color: Colors.blue),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        if (isOpen)
          GestureDetector(
            onTap: toggle,
            behavior: HitTestBehavior.opaque,
            child: Container(color: Colors.transparent),
          ),
        Padding(
          padding: const EdgeInsets.only(bottom: 80, right: 16),
          child: isOpen
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    buildOption(
                      icon: Icons.note_add_outlined,
                      label: "Apply Short Leave",
                      onTap: widget.onApplyShortLeave,
                    ),
                    const SizedBox(height: 12),
                    buildOption(
                      icon: Icons.edit_calendar,
                      label: "Apply Leave",
                      onTap: widget.onApplyLeave,
                    ),
                  ],
                )
              : SizedBox(),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16, bottom: 20),
          child: FloatingActionButton(
            onPressed: toggle,
            backgroundColor: Colors.white,
            child: Icon(isOpen ? Icons.close : Icons.add, color: Colors.blue),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
