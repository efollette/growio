import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:io';
import '../model/plant_model.dart';
import '../utils/users.dart' as users;


Future<List<Plant>> getAllPlants() async {
  String gardenUrl = "https://growio-prod-test.herokuapp.com/garden/plants?token=";
  gardenUrl += users.apiToken;
  final response = await http.get(gardenUrl);
  print(response.body);
  return allPlantsFromJson(response.body);
}
