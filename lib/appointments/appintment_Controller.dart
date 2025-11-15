// lib/appointments/appointments_controller.dart
import 'package:get/get.dart';
import 'appointment_model.dart';

class AppointmentsController extends GetxController {
  // Rx lists with dummy data (UI will read these)
  final upcoming = <AppointmentModel>[].obs;
  final past = <AppointmentModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadDummy(); // just fill dummy data (no network, no logic)
  }

  void _loadDummy() {
    upcoming.assignAll([
      AppointmentModel.fromMap({
        "image": "assets/images/dentist.png",
        "tittle": "Dr. Riya Mehta",
        "catg": "Dentist",
        "perps": "Teeth Whitening",
        "date": "2025-12-02",
        "time": "11:30 AM",
        "location": "Smile Dental Care, Mumbai",
        "bookingid": "1001"
      }),
        AppointmentModel.fromMap({
         "image": "assets/images/yoga.png",
      "tittle": "Aarav Shah",
      "catg": "Yoga Trainer",
      "perps": "Online Yoga Session",
      "date": "2025-12-05",
      "time": "06:00 AM",
      "location": "Online • Google Meet",
      "bookingid": "1002"
      }),
        AppointmentModel.fromMap({
       "image": "assets/images/doc_general.png",
      "tittle": "Dr. Kiran Patel",
      "catg": "General Physician",
      "perps": "Routine Checkup",
      "date": "2025-12-10",
      "time": "09:00 AM",
      "location": "City Hospital, Surat",
      "bookingid": "1003"
      }),
        AppointmentModel.fromMap({
    "image": "assets/images/hair.png",
      "tittle": "Priya Arora",
      "catg": "Hair Stylist",
      "perps": "Hair Spa & Treatment",
      "date": "2025-12-15",
      "time": "03:00 PM",
      "location": "Urban Salon, Delhi",
      "bookingid": "1004"
      }),
    ]);

    past.assignAll([
      AppointmentModel.fromMap({
        "image": "assets/images/derma.png",
      "tittle": "Dr. Anisha Kapoor",
      "catg": "Dermatologist",
      "perps": "Skin Allergy Treatment",
      "date": "2025-10-20",
      "time": "04:00 PM",
      "location": "Skin Health Clinic, Pune",
      "bookingid": "2001"
      }),
       AppointmentModel.fromMap({
        "image": "assets/images/cardio.png",
      "tittle": "Dr. Rajesh Sharma",
      "catg": "Cardiologist",
      "perps": "Heart Checkup",
      "date": "2025-09-05",
      "time": "12:00 PM",
      "location": "Heart Care Center, Ahmedabad",
      "bookingid": "2002"
      }),
    ]);
  }
}
