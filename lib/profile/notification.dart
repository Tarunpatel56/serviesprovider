// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
// import 'package:healthcare/profile/notification_controller.dart';
// import 'package:healthcare/profile/notification_model%20.dart';
// import 'package:healthcare/utils/color_util.dart';
// import 'package:healthcare/utils/text_utils.dart';

// class MyWidget extends StatefulWidget {
//   const MyWidget({super.key});

//   @override
//   State<MyWidget> createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State<MyWidget> {
//     final NotificationController ctrl = Get.put(NotificationController());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//        appBar: AppBar(
//         backgroundColor: AppColors.primary,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadiusGeometry.only(
//             bottomLeft: Radius.circular(25),
//             bottomRight: Radius.circular(25),
//           ),
//         ),
//         actionsPadding: EdgeInsets.all(10),
//         elevation: 10,
//         toolbarHeight: 100,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.of(context).maybePop();
//           },
//           icon: Icon(Icons.arrow_back_ios, color: Colors.white),
//         ),title: Text("Notification",style: AppTextStyles.subHeadingTextStyle3,),
       
//       ),

//       body: Column(
//         children: [
//           Obx(() {
//               final list = ctrl.list;
//             ListView.builder(
//   itemCount: list.length,   
//   itemBuilder: (context, index) {

//     return notificationCard(list[index]);  
//   },
// );

//           },)
          

//         ],
//       ),

//     );
//   }
//   Widget notificationCard(NotificationModel item) {
//   return Card(
//     elevation: 2,
//     shadowColor: Colors.black12,
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(14),
//     ),
//     margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
//     child: Padding(
//       padding: const EdgeInsets.all(14),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [

//          CircleAvatar(child:Icon(
//                     (item.icon),
//     color: Colors.white,
//     size: 22,
//   ),),

//          SizedBox(width: 12),


//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   item.title,
//                   style: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 const SizedBox(height: 6),
//                 Text(
//                   item.message,
//                   style: const TextStyle(
//                     fontSize: 14,
//                     color: Colors.black54,
//                   ),
//                 ),
//               ],
//             ),
//           ),


//           Column(
//             children: [
//               Text(
//                 item.time,
//                 style: const TextStyle(
//                   fontSize: 12,
//                   color: Colors.black45,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     ),
//   );
// }

// }