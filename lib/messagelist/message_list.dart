import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/home/message_page.dart';
import 'package:healthcare/messagelist/message_controller.dart';
import 'package:healthcare/utils/color_util.dart';

class MessageList extends StatefulWidget {
  const MessageList({super.key});

  @override
  State<MessageList> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  final MessageController ctrl = Get.put(MessageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        elevation: 10,
        toolbarHeight: 90,
      
        
        title: Text(
          "Messages",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),

      body: Obx(() {
        final list = ctrl.msg;

        return ListView.separated(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          itemCount: list.length,
          itemBuilder: (context, index) {
            return _serviceTile(list[index]);
          },
          separatorBuilder: (context, index) => SizedBox(height: 10),
        );
      }),
    );
  }

  Widget _serviceTile(data) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 1.2,
      child: ListTile(
        onTap: () {
            Get.to(MessagePage(user: data, ));
        },
        contentPadding: EdgeInsets.all(12),
    
        leading: CircleAvatar(
          radius: 28,
          backgroundImage: AssetImage(data.image ?? ""),
        ),
    
        title: Text(
          data.tittle ?? "",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
    
        subtitle: Text(
          data.subtittle ?? "",
          style: TextStyle(fontSize: 13, color: Colors.black54),
        ),
    
        trailing: Icon(Icons.chevron_right, color: Colors.grey),
      ),
    );
  }
}
