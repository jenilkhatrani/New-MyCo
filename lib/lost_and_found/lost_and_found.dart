//
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:new_myco/custom_widgets/new_myco_button.dart';
// import 'package:new_myco/custom_widgets/text_field.dart';
// import 'package:new_myco/lost_and_found/add_screen.dart';
//
// import '../themes_colors/colors.dart';
//
// class LostAndFound extends StatefulWidget {
//   const LostAndFound({super.key});
//
//   @override
//   State<LostAndFound> createState() => _LostAndFoundState();
// }
//
// class _LostAndFoundState extends State<LostAndFound> {
//   List<Map<String, dynamic>> items = [];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Lost & Found")),
//       body: Padding(
//         padding: const EdgeInsets.all(32),
//         child: Column(
//           children: [
//             MyCoTextField(
//               isSuffixIconOn: false,
//               preFixImage: "assets/search-normal.png",
//               hintText: "Search",
//             ),
//             Expanded(
//               child: GridView.builder(
//                 padding: const EdgeInsets.all(16),
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   mainAxisSpacing: 16,
//                   crossAxisSpacing: 16,
//                   childAspectRatio: 0.7,
//                 ),
//                 itemCount: items.length,
//                 itemBuilder: (context, index) {
//                   final item = items[index];
//                   return Card(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     elevation: 3,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Expanded(
//                           child: ClipRRect(
//                             borderRadius: const BorderRadius.vertical(
//                               top: Radius.circular(8),
//                             ),
//                             child: Image.file(
//                               item['image'] as File,
//                               fit: BoxFit.cover,
//                               width: double.infinity,
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text(
//                             item['name'] ?? '',
//                             style: const TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                           child: Text(
//                             item['desc'] ?? '',
//                             maxLines: 2,
//                             overflow: TextOverflow.ellipsis,
//                             style: const TextStyle(fontSize: 12),
//                           ),
//                         ),
//                         const SizedBox(height: 8),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: MyCoButton(
//         isShadowBottomLeft: true,
//         boarderRadius: 50,
//         onTap: () async {
//           final result = await Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => const LostAndFoundAddScreen(),
//             ),
//           );
//
//           if (result != null && result is Map<String, dynamic>) {
//             setState(() {
//               items.add(result);
//             });
//           }
//         },
//         title: '',
//         image: const Icon(Icons.add, color: Colors.white, size: 30),
//         backgroundColor: AppColors.primary,
//         height: 50,
//         width: 50,
//       ),
//     );
//   }
// }
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:new_myco/custom_widgets/new_myco_button.dart';
import 'package:new_myco/custom_widgets/text_field.dart';
import 'package:new_myco/lost_and_found/add_screen.dart';
import '../themes_colors/colors.dart';
import 'item_found_screen.dart';

class LostAndFound extends StatefulWidget {
  const LostAndFound({super.key});

  @override
  State<LostAndFound> createState() => _LostAndFoundState();
}

class _LostAndFoundState extends State<LostAndFound> {
  final List<Map<String, dynamic>> lostFoundItems = [];

  void _navigateToAddScreen() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LostAndFoundAddScreen()),
    );

    if (result != null && result is Map<String, dynamic>) {
      setState(() {
        lostFoundItems.add(result);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: const Text("Lost & Found"),
        centerTitle: false,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          children: [
            MyCoTextField(
              isSuffixIconOn: false,
              preFixImage: "assets/lost_and_found/search-normal.png",
              hintText: "Search",
              boarderRadius: 12,
              height: 44,
            ),
            SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                // padding: const EdgeInsets.all(16),
                itemCount: lostFoundItems.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  // childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  final item = lostFoundItems[index];
                  final image = item['image'] as File;
                  final name = item['name'] ?? '';
                  final status = item['status'] ?? 'Lost';

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ItemFoundScreen(item: item),
                        ),
                      );
                    },

                    child: Container(
                      // height: 150,
                      // width: 155,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppColors.borderColor,
                          width: 2,
                        ),
                        color: AppColors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Image.file(
                                      image,
                                      width: double.infinity,
                                      height: 95,
                                      fit: BoxFit.cover,
                                    ),
                                    Positioned(
                                      top: 8,
                                      right: 8,
                                      child: MyCoButton(
                                        backgroundColor: status == "Found"
                                            ? AppColors.secondPrimary
                                            : Color(0xFFDD4646),
                                        height: 17,
                                        width: 46,
                                        onTap: () {},
                                        title: status,
                                        isShadowBottomLeft: true,
                                        textStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 8, 4),
                            child: Text(
                              name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: "Gilroy-SemiBold",
                                fontWeight: FontWeight.w200,
                                color: Color(0xFF101828),
                                fontSize:
                                    Theme.of(
                                      context,
                                    ).textTheme.titleMedium?.fontSize ??
                                    16,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                            child: Text(
                              DateFormat(
                                'dd MMM yyyy (EEE)',
                              ).format(DateTime.now()),
                              style: TextStyle(
                                fontFamily: "Gilroy-Regular",
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF101828),
                                fontSize:
                                    Theme.of(
                                      context,
                                    ).textTheme.titleSmall?.fontSize ??
                                    12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: MyCoButton(
        boarderRadius: 50,
        isShadowBottomLeft: true,
        onTap: _navigateToAddScreen,
        title: '',
        image: const Icon(Icons.add, color: Colors.white, size: 30),
        backgroundColor: AppColors.primary,
        height: 59.17,
        width: 59.17,
      ),
    );
  }
}
