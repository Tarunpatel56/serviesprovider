import 'package:get/get.dart';

import 'package:healthcare/profile/notification_model%20.dart';

class NotificationController extends GetxController {
  final RxList<NotificationModel> list = <NotificationModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    loadMessages();
  }

  void loadMessages() {
    list.clear();
    for (var item in notiList) {
      list.add(NotificationModel.fromJson(item));
    }
  }

  List notiList = [[
  {
    "id": 1,
    "icon": "person",
    "title": "Your order has been shipped",
    "message": "Your package is on the way.",
    "time": "10 min ago"
  },
  {
    "id": 2,
    "icon": "text_w",
    "title": "We have updated our terms",
    "message": "Please review changes for better experience.",
    "time": "1 hr ago"
  },
  {
    "id": 3,
    "icon": "heart",
    "title": "Alice liked your photo",
    "message": "Someone reacted to your post.",
    "time": "2 hr ago"
  },
  {
    "id": 4,
    "icon": "calendar_green",
    "title": "Event reminder",
    "message": "Don't forget your meeting today",
    "time": "4 hr ago"
  },
  {
    "id": 5,
    "icon": "calendar_orange",
    "title": "Event reminder",
    "message": "Your event is about to start",
    "time": "Yesterday"
  },
  {
    "id": 6,
    "icon": "text_w",
    "title": "Flash sale has started",
    "message": "Grab the best deals before they end.",
    "time": "Yesterday"
  },
  {
    "id": 7,
    "icon": "text_w",
    "title": "Welcome to our community!",
    "message": "Thanks for joining us.",
    "time": "2 days ago"
  }
]
];
}
