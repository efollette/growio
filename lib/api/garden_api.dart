import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:io';
import '../model/plant_model.dart';
import '../utils/users.dart' as users;
import '../utils/constants.dart' as constant;


Future<List<Plant>> getAllPlants() async {
  String gardenUrl = constant.apiUrl + "/garden/plants?token=";
  gardenUrl += users.apiToken;
  final response = await http.get(gardenUrl);
  print(response.body + "got till here");
  return allPlantsFromJson(response.body);
}
