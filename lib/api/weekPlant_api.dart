import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:io';
import '../utils/users.dart' as users;
import '../utils/constants.dart' as constant;
import '../model/plant_model.dart';


Future<Plant> getAllPlants() async {
  String gardenUrl = constant.apiUrl + "/garden/plants?token=";
  gardenUrl += users.apiToken;
  final response = await http.get(gardenUrl);
  print(response.body + " plant of the week");
  return plantFromJson(response.body);
}

