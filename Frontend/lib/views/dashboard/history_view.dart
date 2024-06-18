// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:leo_futsal/controller/dashboard/history_controller.dart';
// import 'package:leo_futsal/utils/colors.dart';
// import 'package:leo_futsal/utils/custom_text_styles.dart';
// import 'package:leo_futsal/utils/image_path.dart';
// import 'package:get/get.dart';
// import 'package:leo_futsal/views/dashboard/home_view.dart';

// class HistoryView extends StatelessWidget {
//   final c = Get.put(HistoryController());
//   HistoryView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "History",
//           style: CustomTextStyles.f16W400(),
//         ),
//       ),
//       body: SafeArea(
//         child: ListView.builder(
//           shrinkWrap: true,
//           itemCount: 8,
//           itemBuilder: ((context, index) {

//             return HistoryCard(
//               color: index % 2 == 0 ? AppColors.primaryColor : Colors.amber, orderHistory: null,
//             );
//           }),
//         ),
//       ),
//     );
//   }
// }
