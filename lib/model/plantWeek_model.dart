// To parse this JSON data, do
//
//     final plant = plantFromJson(jsonString);

import 'dart:convert';
import 'package:flutter/foundation.dart';

PlantWeek plantFromJson(String str) {
  final jsonData = json.decode(str);
  print(jsonData[0].runtimeType);
  return PlantWeek.fromJson(jsonData[0]);
}

String plantToJson(PlantWeek data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}


String allPlantsToJson(List<PlantWeek> data) {
  final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

class PlantWeek {
  String scientificName;
  String commonName;
  String plantImage;

  PlantWeek({
    this.scientificName,
    this.commonName,
    this.plantImage
  });

  factory PlantWeek.fromJson(Map<String, dynamic> json) => new PlantWeek(
      scientificName: json["sciName"],
      commonName: json["commonName"],
      plantImage: json["imageUrl"]
  );

  Map<String, dynamic> toJson() => {
    "scientificName": scientificName,
    "commonName": commonName,
    "plantImage": plantImage
  };
}