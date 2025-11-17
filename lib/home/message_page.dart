import 'dart:math';

import 'package:flutter/material.dart';
import 'package:healthcare/appointments/appointment_model.dart';
import 'package:healthcare/messagelist/message_model.dart';
import 'package:healthcare/utils/color_util.dart';

class MessagePage extends StatefulWidget {
  final msgListModel user;

  const MessagePage({super.key, required this.user, });

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  final List<Map<String, dynamic>> _messages = [];

  @override
  void initState() {
    super.initState();

    // Add a welcome message from the other user
    _messages.add({
      'id': '${Random().nextInt(100000)}',
      'text': 'Hello! How can I help you today?',
      'isMe': false,
      'time': DateTime.now().subtract(const Duration(minutes: 5)),
    });
  }

  void _sendMessage(String text) {
    if (text.trim().isEmpty) return;

    setState(() {
      _messages.add({
        'id': '${Random().nextInt(100000)}',
        'text': text.trim(),
        'isMe': true,
        'time': DateTime.now(),
      });
    });

    _textController.clear();

    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
        );
      }
    });

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _messages.add({
          'id': '${Random().nextInt(100000)}',
          'text': 'Thanks for the message. I will check and get back to you.',
          'isMe': false,
          'time': DateTime.now(),
        });
      });
      Future.delayed(const Duration(milliseconds: 100), () {
        if (_scrollController.hasClients) {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeOut,
          );
        }
      });
    });
  }

  Widget _buildMessageItem(Map<String, dynamic> msg) {
    final bool isMe = msg['isMe'] as bool;
    final text = msg['text'] as String;
    final time = msg['time'] as DateTime;

    final bubbleColor = isMe ? Colors.blue : Colors.grey.shade200;
    final textColor = isMe ? Colors.white : Colors.black87;
    final align = isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final radius = isMe
        ? const BorderRadius.only(
            topLeft: Radius.circular(14),
            topRight: Radius.circular(14),
            bottomLeft: Radius.circular(14),
          )
        : const BorderRadius.only(
            topLeft: Radius.circular(14),
            topRight: Radius.circular(14),
            bottomRight: Radius.circular(14),
          );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
      child: Column(
        crossAxisAlignment: align,
        children: [
          Row(
            mainAxisAlignment: isMe
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            children: [
              if (!isMe)
                CircleAvatar(
                  radius: 16,
                  backgroundImage:
                      (widget.user.image != null &&
                          widget.user.image!.isNotEmpty)
                      ? AssetImage(widget.user.image!)
                      : null,
                  child:
                      (widget.user.image == null || widget.user.image!.isEmpty)
                      ? const Icon(Icons.person)
                      : null,
                ),
              if (!isMe) const SizedBox(width: 8),
              Flexible(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: bubbleColor,
                    borderRadius: radius,
                  ),
                  child: Text(
                    text,
                    style: TextStyle(color: textColor, fontSize: 15),
                  ),
                ),
              ),
              if (isMe) const SizedBox(width: 8),
              if (isMe)
                CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.blue,
                  child: const Icon(Icons.person, color: Colors.white),
                ),
            ],
          ),
          const SizedBox(height: 4),
          Padding(
            padding: EdgeInsets.only(
              left: isMe ? 0 : 44,
              right: isMe ? 44 : 0,
            ), // align time
            child: Text(
              '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}',
              style: TextStyle(fontSize: 11, color: Colors.grey[600]),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final partnerName = widget.user.tittle ?? 'Unknown';
    final partnerImage = widget.user.image;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(backgroundImage: AssetImage(partnerImage!)),
        ),
        title: Text(partnerName, style: const TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu, color: AppColors.background),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.only(top: 12, bottom: 12),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final item = _messages[index];
                return _buildMessageItem(item);
              },
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 8.0,
            ),
            color: Colors.white,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.emoji_emotions_outlined),
                  onPressed: () {},
                  color: Colors.grey[700],
                ),
                Expanded(
                  child: TextField(
                    controller: _textController,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration(
                      hintText: 'Type a message',
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onSubmitted: (value) => _sendMessage(value),
                  ),
                ),
                const SizedBox(width: 8),
                CircleAvatar(
                  radius: 22,
                  backgroundColor: AppColors.primary,
                  child: IconButton(
                    icon: const Icon(Icons.send, color: Colors.white),
                    onPressed: () => _sendMessage(_textController.text),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
