import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_chat_core/flutter_chat_core.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:healthcare/utils/color_util.dart';


class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  final _chatController = InMemoryChatController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(backgroundColor: AppColors.primary,leading: CircleAvatar(backgroundImage: AssetImage("assets/4.jpg"),maxRadius: 20,),
      title: Text("John Doe",style: TextStyle(color: Colors.white),),actions: [IconButton(onPressed: (){}, icon: Icon(Icons.call,color: AppColors.background,)),
      IconButton(onPressed: (){}, icon: Icon(Icons.menu,color: AppColors.background,))],
    ),
      body: Chat(
        chatController: _chatController,
        currentUserId: 'user1',decoration: BoxDecoration(color: AppColors.primary),
        onMessageSend: (text) {
          _chatController.insertMessage(
            TextMessage(
              // Better to use UUID or similar for the ID - IDs must be unique
              id: '${Random().nextInt(1000) + 1}',
              authorId: 'user1',
              createdAt: DateTime.now().toUtc(),
              text: text,
            ),
          );
        },
        resolveUser: (UserID id) async {
          return User(id: id, name: 'John Doe');
        },
      ),
    );
  }
}
