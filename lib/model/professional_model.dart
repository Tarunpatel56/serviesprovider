class profList {
  String? image;
  String? tittle;
  String? subtittle;
  String? price;
  String? session;
  String? exp;
  String? rating;
  String? ratinguser;
  String? about; 

  profList({
    this.image,
    this.tittle,
    this.subtittle,
    this.price,
    this.session,
    this.exp,
    this.rating,
    this.ratinguser,
    this.about, 
  });

  profList.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    tittle = json['tittle'];
    subtittle = json['subtittle'];
    price = json['price'];
    session = json['session'];
    exp = json['exp'];
    rating = json['rating'];
    ratinguser = json['ratinguser'];
    about = json['about']; 
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['tittle'] = this.tittle;
    data['subtittle'] = this.subtittle;
    data['price'] = this.price;
    data['session'] = this.session;
    data['exp'] = this.exp;
    data['rating'] = this.rating;
    data['ratinguser'] = this.ratinguser;
    data['about'] = this.about;
    return data;
  }
}

List dummyData = [
  {
    "image": "assets/1.jpeg",
    "tittle": "Dr. Asha Sharma",
    "subtittle": "General Physician - City Hospital",
    "price": "₹500",
    "session": "30 min",
    "exp": "8 years",
    "rating": "4.7",
    "ratinguser": "128",
    "about":
        "Dr. Asha Sharma ek experienced General Physician hain, jo City Hospital me practice karti hain. Unka focus accurate diagnosis, effective treatment aur patient-friendly consultation par hota hai. Daily health issues se lekar lifestyle guidance tak, wo har patient ko personalized care provide karti hain.",
  },
  {
    "image": "assets/3.avif",
    "tittle": "Dr. Rohan Verma",
    "subtittle": "Pediatrician - LittleCare Clinic",
    "price": "₹700",
    "session": "30 min",
    "exp": "10 years",
    "rating": "4.9",
    "ratinguser": "254",
    "about":"Dr. Rohan Verma ek highly trusted Pediatrician hain, jo LittleCare Clinic me bachchon ki healthcare me expertise rakhte hain. Birth to teens tak ke health concerns, vaccinations, growth monitoring aur child-friendly treatment approach ke liye parents un par poora trust karte hain."
  },
  {
    "image": "assets/2.jpg",
    "tittle": "Glow & Glam Salon",
    "subtittle": "Haircut | Colour | Styling",
    "price": "₹350",
    "session": "45 min",
    "exp": "5 years",
    "rating": "4.4",
    "ratinguser": "86",
    "about":"Glow & Glam Salon ek premium \nbeauty & styling destination hai \njahan professional hairstylists \nhaircut, colouring, styling aur \nmakeover services provide karte\n hain. Modern techniques, hygienic \nsetup aur customer-first \napproach ki wajah se salon \nka experience smooth aur \nsatisfying hota hai."
    
  },
  // {
  //   "image": "https://example.com/images/salon_2.jpg",
  //   "tittle": "Studio Luxe",
  //   "subtittle": "Bridal Makeup Specialist",
  //   "price": "₹2500",
  //   "session": "120 min",
  //   "exp": "7 years",
  //   "rating": "4.8",
  //   "ratinguser": "63",
  // },
  // {
  //   "image": "https://example.com/images/spa_1.jpg",
  //   "tittle": "Tranquil Spa",
  //   "subtittle": "Aromatherapy | Full Body Massage",
  //   "price": "₹1200",
  //   "session": "60 min",
  //   "exp": "6 years",
  //   "rating": "4.6",
  //   "ratinguser": "142",
  // },
  // {
  //   "image": "https://example.com/images/spa_2.jpg",
  //   "tittle": "Ocean Bliss Spa",
  //   "subtittle": "Deep Tissue Massage",
  //   "price": "₹1500",
  //   "session": "75 min",
  //   "exp": "9 years",
  //   "rating": "4.5",
  //   "ratinguser": "98",
  // },
  // {
  //   "image": "https://example.com/images/therapist_1.jpg",
  //   "tittle": "Ms. Neha Kapoor",
  //   "subtittle": "Physiotherapist - Sports Rehab",
  //   "price": "₹600",
  //   "session": "40 min",
  //   "exp": "4 years",
  //   "rating": "4.3",
  //   "ratinguser": "57",
  // },
  // {
  //   "image": "https://example.com/images/therapist_2.jpg",
  //   "tittle": "Mr. Amit Joshi",
  //   "subtittle": "Counselling Therapist - CBT",
  //   "price": "₹800",
  //   "session": "50 min",
  //   "exp": "11 years",
  //   "rating": "4.8",
  //   "ratinguser": "201",
  // },
  // {
  //   "image": "https://example.com/images/dentist_1.jpg",
  //   "tittle": "Dr. Priya Menon",
  //   "subtittle": "Dentist - Cosmetic & Orthodontics",
  //   "price": "₹900",
  //   "session": "40 min",
  //   "exp": "12 years",
  //   "rating": "4.9",
  //   "ratinguser": "312",
  // },
  // {
  //   "image": "https://example.com/images/dentist_2.jpg",
  //   "tittle": "SmileCare Dental",
  //   "subtittle": "Teeth Cleaning | Root Canal",
  //   "price": "₹600",
  //   "session": "30 min",
  //   "exp": "6 years",
  //   "rating": "4.5",
  //   "ratinguser": "145",
  // },
  // {
  //   "image": "https://example.com/images/yoga_1.jpg",
  //   "tittle": "Yoga with Suman",
  //   "subtittle": "Hatha & Vinyasa - Group Classes",
  //   "price": "₹250",
  //   "session": "60 min",
  //   "exp": "3 years",
  //   "rating": "4.2",
  //   "ratinguser": "74",
  // },
  // {
  //   "image": "https://example.com/images/yoga_2.jpg",
  //   "tittle": "Rishi Yoga Studio",
  //   "subtittle": "Ashtanga | Private Sessions",
  //   "price": "₹800",
  //   "session": "60 min",
  //   "exp": "14 years",
  //   "rating": "4.9",
  //   "ratinguser": "410",
  // },
];
