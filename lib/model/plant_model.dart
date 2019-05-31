// To parse this JSON data, do
//
//     final plant = plantFromJson(jsonString);

import 'dart:convert';
import 'package:flutter/foundation.dart';

Plant plantFromJson(String str) {
  final jsonData = json.decode(str);
  return Plant.fromJson(jsonData);
}

String plantToJson(Plant data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}


List<Plant> allPlantsFromJson(String str) {
  final jsonData = json.decode(str);
  debugPrint(jsonData);
  return new List<Plant>.from(jsonData.map((x) => Plant.fromJson(x)));
}

String allPlantsToJson(List<Plant> data) {
  final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

class Plant {
  String nickname;
  String scientificName;
  String commonName;
  String moistureUse;
  String temperature;
  String sunlight;
  String plantImage;

  Plant({
    this.nickname,
    this.scientificName,
    this.commonName,
    this.moistureUse,
    this.temperature,
    this.sunlight,
    this.plantImage
  });

  factory Plant.fromJson(Map<String, dynamic> json) => new Plant(
    nickname: json["nickname"],
    scientificName: json["scientificName"],
    commonName: json["commonName"],
    temperature: json["temperature"],
    sunlight: json["sunlight"],
    plantImage: json["plantImage"]
  );

  Map<String, dynamic> toJson() => {
    "nickname": nickname,
    "scientificName": scientificName,
    "commonName": commonName,
    "moistureUse": moistureUse,
    "temperature": temperature,
    "sunlight": sunlight,
    "plantImage": plantImage
  };
}