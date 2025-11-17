import 'package:get/get.dart';
import 'package:healthcare/messagelist/message_model.dart';

class MessageController extends GetxController {
  final RxList<msgListModel> msg = <msgListModel>[].obs;


  final List msgList = [
    {
      "image": "assets/21.avif",
      "tittle": "Kavita Sharma",
      "subtittle": "Nurse",
    },
    {
      "image": "assets/23.jpg",
      "tittle": "City Care Clinic",
      "subtittle": "Clinic Reception",
    },
    {
      "image": "assets/12.jpg",
      "tittle": "Rahul Verma",
      "subtittle": "Lab Assistant",
    },
    {
      "image": "assets/24.jpg",
      "tittle": "Meena Patel",
      "subtittle": "Hospital Receptionist",
    },
    {
      "image": "assets/22.jpeg",
      "tittle": "Neha Joshi",
      "subtittle": "Physiotherapist",
    },
    {
      "image": "assets/33.jpeg",
      "tittle": "Mental Health Support",
      "subtittle": "Therapy Assistant",
    },
    {
      "image": "assets/4.jpg",
      "tittle": "Alok Kumar",
      "subtittle": "Nutritionist",
    },
    {
      "image": "assets/88.jpeg",
      "tittle": "Priyanka Desai",
      "subtittle": "Yoga Trainer",
    },
    {
      "image": "assets/13.jpg",
      "tittle": "HealthPlus Pharmacy",
      "subtittle": "Medical Store",
    },
   
  ];

  @override
  void onInit() {
    super.onInit();
    loadMessages();
  }

  void loadMessages() {
    msg.clear();
    for (var item in msgList) {
      msg.add(msgListModel.fromJson(item));
    }
  
  }
}
