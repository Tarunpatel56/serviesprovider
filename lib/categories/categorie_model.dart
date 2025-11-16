class CategorieModel {
  String? image;
  String? tittle;
  String? subtittle;
  String? price;
  String? session;
  String? exp;
  String? rating;
  String? ratinguser;
  String? about;
  String? patientCount; // NEW
  String? location; // NEW

  CategorieModel({
    this.image,
    this.tittle,
    this.subtittle,
    this.price,
    this.session,
    this.exp,
    this.rating,
    this.ratinguser,
    this.about,
    this.patientCount, // NEW
    this.location, // NEW
  });

  CategorieModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    tittle = json['tittle'];
    subtittle = json['subtittle'];
    price = json['price'];
    session = json['session'];
    exp = json['exp'];
    rating = json['rating'];
    ratinguser = json['ratinguser'];
    about = json['about'];
    patientCount = json['patientCount']; // NEW
    location = json['location']; // NEW
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
    data['patientCount'] = this.patientCount; // NEW
    data['location'] = this.location; // NEW
    return data;
  }
}

