

class NotificationModel {
  final int id;
  final String icon;   
  final String title;
  final String message;
  final String time;
  bool isRead;

  NotificationModel({
    required this.id,
    required this.icon,
    required this.title,
    required this.message,
    required this.time,
    this.isRead = false,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json["id"],
      icon: json["icon"],
      title: json["title"],
      message: json["message"],
      time: json["time"],
      isRead: json["isRead"] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "icon": icon,
      "title": title,
      "message": message,
      "time": time,
      "isRead": isRead,
    };
  }

 
}
