import 'package:flutter/material.dart';
import 'package:get/get.dart';

class catgmodel {
  String? image;
  String? name;

  catgmodel({this.image, this.name});

  catgmodel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['name'] = this.name;
    return data;
  }
}

List catgList = [
  {"image": "assets/doctor.png", "name": "Doctor"},
  {"image": "assets/salon.png", "name": "Salon"},
  {"image": "assets/spa.png", "name": "Spa"},
  {"image": "assets/therapist.png", "name": "Therapist"},
    {"image": "assets/dentist.png", "name": "Dentist"},
  {"image": "assets/yoga.png", "name": "Yoga"},
];
