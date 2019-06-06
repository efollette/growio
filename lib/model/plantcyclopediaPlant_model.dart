// To parse this JSON data, do
//
//     final plant = plantFromJson(jsonString);

import 'dart:convert';
import 'package:flutter/foundation.dart';

PlantcycPlant plantFromJson(String str) {
  final jsonData = json.decode(str)['data'];
  print(jsonData);
  return PlantcycPlant.fromJson(jsonData);
}

String plantToJson(PlantcycPlant data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}


String allPlantsToJson(List<PlantcycPlant> data) {
  final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

class PlantcycPlant {
  String scientificName;
  String commonName;
  String plantImage;
  String moisture;
  String temp;
  String light;

  PlantcycPlant({
    this.scientificName,
    this.commonName,
    this.plantImage,
    this.moisture,
    this.temp,
    this.light
  });

  factory PlantcycPlant.fromJson(Map<String, dynamic> json) => new PlantcycPlant(
      scientificName: json["scientificName"],
      commonName: json["commonName"],
      plantImage: json["img"],
      moisture: json["moisture_use"],
      temp: json["temperature"],
      light: json["sunlight"]
  );

  Map<String, dynamic> toJson() => {
    "scientificName": scientificName,
    "commonName": commonName,
    "plantImage": plantImage,
    "moisture": moisture,
    "temp": temp,
    "light": light
  };
}