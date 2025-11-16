import 'package:get/get.dart';
import 'package:healthcare/categories/categorie_model.dart';

class CategorieController extends GetxController {
  bool isLoading = false;
  final RxList<CategorieModel> drList = <CategorieModel>[].obs;
  final RxList<CategorieModel> salonList = <CategorieModel>[].obs;
    final RxList<CategorieModel> spaList = <CategorieModel>[].obs;
  final RxList<CategorieModel> therapistList = <CategorieModel>[].obs;
  final RxList<CategorieModel> dentistList = <CategorieModel>[].obs;
  final RxList<CategorieModel> yogaList = <CategorieModel>[].obs;


  @override
  void onInit() {
    super.onInit();
    loadDoctors(); // function call
  }


    void loadDoctors() {
    drList([
      CategorieModel(
        image: 'assets/images/dr_ramesh.png',
        tittle: 'Dr. Ramesh Sharma',
        subtittle: 'Dentist',
        price: '1200',
        session: '30 min',
        exp: '7 yrs',
        rating: '4.6',
        ratinguser: '245',
        about: 'Root canal, cosmetic dentistry, cleaning.',
        patientCount: '850',
        location: 'Mumbai',
      ),
      CategorieModel(
        image: 'assets/images/dr_neha.png',
        tittle: 'Dr. Neha Verma',
        subtittle: 'Cardiologist',
        price: '1800',
        session: '45 min',
        exp: '10 yrs',
        rating: '4.8',
        ratinguser: '320',
        about: 'Heart specialist: ECG, angiography.',
        patientCount: '1200',
        location: 'Delhi',
      ),
      CategorieModel(
        image: 'assets/images/dr_amit.png',
        tittle: 'Dr. Amit Patil',
        subtittle: 'Physiotherapist',
        price: '900',
        session: '40 min',
        exp: '5 yrs',
        rating: '4.5',
        ratinguser: '150',
        about: 'Stress management, rehab therapy.',
        patientCount: '700',
        location: 'Pune',
      ),
    ]);
     salonList.assignAll([
      CategorieModel(
        image: 'assets/images/salon_rahul.png',
        tittle: 'Rahul Hair Studio',
        subtittle: 'Hair Stylist',
        price: '600',
        session: '1 hour',
        exp: '4 years',
        rating: '4.7',
        ratinguser: '320',
        about: 'Expert in hair styling, grooming, beard shaping, and premium makeovers.',
        patientCount: '1200',
        location: 'Mumbai',
      ),
      CategorieModel(
        image: 'assets/images/salon_neha.png',
        tittle: 'Neha Beauty Salon',
        subtittle: 'Makeup & Hair Artist',
        price: '1200',
        session: '1.5 hour',
        exp: '6 years',
        rating: '4.8',
        ratinguser: '450',
        about: 'Bridal makeup specialist and professional beauty & hair stylist.',
        patientCount: '1800',
        location: 'Delhi',
      ),
      CategorieModel(
        image: 'assets/images/salon_amit.png',
        tittle: 'Amit Grooming Studio',
        subtittle: 'Men\'s Hair Expert',
        price: '500',
        session: '45 min',
        exp: '3 years',
        rating: '4.5',
        ratinguser: '290',
        about: 'Men’s grooming, beard trimming, and modern haircut specialist.',
        patientCount: '900',
        location: 'Pune',
      ),
    ]);
      spaList.assignAll([
      CategorieModel(
        image: 'assets/images/spa_bliss.png',
        tittle: 'Bliss Spa & Wellness',
        subtittle: 'Relaxation & Massage',
        price: '1500',
        session: '60 min',
        exp: '6 years',
        rating: '4.9',
        ratinguser: '560',
        about: 'Full body massage, aromatherapy, steam & facial services.',
        patientCount: '2500',
        location: 'Mumbai',
      ),
      CategorieModel(
        image: 'assets/images/spa_serene.png',
        tittle: 'Serene Spa',
        subtittle: 'Therapeutic Spa',
        price: '1300',
        session: '50 min',
        exp: '4 years',
        rating: '4.7',
        ratinguser: '410',
        about: 'Deep tissue massage, relaxation therapies, de-stress treatment.',
        patientCount: '1400',
        location: 'Bangalore',
      ),
    ]);

    // ------------------ THERAPIST DATA ------------------
    therapistList.assignAll([
      CategorieModel(
        image: 'assets/images/therapist_arya.png',
        tittle: 'Arya Therapy',
        subtittle: 'Counselor / Therapist',
        price: '900',
        session: '45 min',
        exp: '8 years',
        rating: '4.8',
        ratinguser: '320',
        about: 'Stress, anxiety, relationship counseling and CBT.',
        patientCount: '1100',
        location: 'Chennai',
      ),
      CategorieModel(
        image: 'assets/images/therapist_rocky.png',
        tittle: 'Rocky Counseling',
        subtittle: 'Psychotherapist',
        price: '1100',
        session: '50 min',
        exp: '10 years',
        rating: '4.6',
        ratinguser: '290',
        about: 'Clinical therapy, behavior therapy, family therapy.',
        patientCount: '900',
        location: 'Mumbai',
      ),
    ]);

    // ------------------ DENTIST DATA ------------------
    dentistList.assignAll([
      CategorieModel(
        image: 'assets/images/dentist_sunil.png',
        tittle: 'Sunil Dental Care',
        subtittle: 'Dentist',
        price: '1000',
        session: '30 min',
        exp: '5 years',
        rating: '4.5',
        ratinguser: '210',
        about: 'General dentistry, cleaning, fillings, smile makeovers.',
        patientCount: '800',
        location: 'Ahmedabad',
      ),
      CategorieModel(
        image: 'assets/images/dentist_pooja.png',
        tittle: 'Pooja Dental Studio',
        subtittle: 'Orthodontist',
        price: '2000',
        session: '40 min',
        exp: '12 years',
        rating: '4.9',
        ratinguser: '620',
        about: 'Braces, implants, cosmetic dentistry, and orthodontics.',
        patientCount: '2200',
        location: 'Delhi',
      ),
    ]);

    // ------------------ YOGA TRAINER DATA ------------------
    yogaList.assignAll([
      CategorieModel(
        image: 'assets/images/yoga_isha.png',
        tittle: 'Isha Yoga Center',
        subtittle: 'Yoga Trainer',
        price: '600',
        session: '45 min',
        exp: '6 years',
        rating: '4.8',
        ratinguser: '480',
        about: 'Hatha yoga, meditation, vinyasa flow & breathing exercises.',
        patientCount: '1500',
        location: 'Rishikesh',
      ),
      CategorieModel(
        image: 'assets/images/yoga_raj.png',
        tittle: 'Raj Yoga Studio',
        subtittle: 'Yoga Instructor',
        price: '500',
        session: '40 min',
        exp: '4 years',
        rating: '4.6',
        ratinguser: '230',
        about: 'Beginner to advanced yoga & pranayama training.',
        patientCount: '700',
        location: 'Pune',
      ),
    ]);
  }
  

}
