
class AppointmentModel {
  String? image;
  String? tittle;
  String? catg;
  String? perps;
  String? date;
  String? time;
  String? location;
  String? bookingid;

  AppointmentModel({
    this.image,
    this.tittle,
    this.catg,
    this.perps,
    this.date,
    this.time,
    this.location,
    this.bookingid,
  });

  factory AppointmentModel.fromMap(Map<String, dynamic> m) {
    return AppointmentModel(
      image: m['image'] as String?,
      tittle: m['tittle'] as String?,
      catg: m['catg'] as String?,
      perps: m['perps'] as String?,
      date: m['date'] as String?,
      time: m['time'] as String?,
      location: m['location'] as String?,
      bookingid: m['bookingid'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'tittle': tittle,
      'catg': catg,
      'perps': perps,
      'date': date,
      'time': time,
      'location': location,
      'bookingid': bookingid,
    };
  }
}
