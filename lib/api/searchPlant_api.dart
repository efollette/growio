import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import '../model/plantcyclopediaPlant_model.dart';
import '../utils/users.dart' as users;
import '../utils/constants.dart' as constant;


Future<PlantcycPlant> searchByName(plantSearch, searchBy) async {
  String gardenUrl = constant.apiUrl + "/plantcyclopedia/search?token=";
  gardenUrl += users.apiToken;
  gardenUrl += "&searchBy=" + searchBy;
  gardenUrl += "&searchPlant=" + plantSearch;
  final response = await http.get(gardenUrl);
  print(response.body);
  return plantFromJson(response.body);
}
