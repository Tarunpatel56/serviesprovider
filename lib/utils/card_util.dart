// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:healthcare/appointments/appointment_model.dart';
// import 'package:healthcare/utils/text_utils.dart';

// class CardUtil extends StatelessWidget {
//   final appointmentmodel data;
//   final VoidCallback? onTap;

//   const CardUtil({
//     super.key,
//     required this.data,
//     this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [

//             /// TOP STATUS + BOOKING ID
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "Confirmed",
//                   style: const TextStyle(
//                       fontSize: 15, color: Colors.green),
//                 ),
//                 Text(
//                   "#${data.bookingid ?? ''}",
//                   style: const TextStyle(fontWeight: FontWeight.bold),
//                 ),
//               ],
//             ),

//             const SizedBox(height: 10),

//             /// IMAGE + DETAILS
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 /// IMAGE
//                 Container(
//                   height: Get.height * 0.10,
//                   width: Get.width * 0.17,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(7),
//                     image: DecorationImage(
//                       image: AssetImage(data.image ?? ""),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),

//                 const SizedBox(width: 12),

//                 /// TEXT DETAILS
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(data.tittle ?? '',
//                           style: AppTextStyles.headingTextStyle),
//                       Text(data.catg ?? '',
//                           style: AppTextStyles.headingTextStyle2),
//                       Text(data.perps ?? '',
//                           style: AppTextStyles.headingTextStyle2),
//                     ],
//                   ),
//                 ),
//               ],
//             ),

//             const SizedBox(height: 12),

//             /// DATE & TIME
//             Row(
//               children: [
//                 const Icon(Icons.calendar_today_outlined, color: Colors.blue),
//                 const SizedBox(width: 6),
//                 Text(data.date ?? ""),
//                 const Spacer(),
//                 const Icon(Icons.watch_later_outlined),
//                 const SizedBox(width: 6),
//                 Text(data.time ?? ""),
//               ],
//             ),

//             const SizedBox(height: 8),

//             /// LOCATION
//             Row(
//               children: [
//                 const Icon(Icons.location_on_outlined, color: Colors.blue),
//                 const SizedBox(width: 6),
//                 Expanded(child: Text(data.location ?? "")),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
