import 'package:http/http.dart' as http;
import 'dart:async';
import '../model/plant_model.dart';
import '../utils/users.dart' as users;
import '../utils/constants.dart' as constant;


Future<Plant> searchByName(plantSearch, searchBy) async {
  String gardenUrl = constant.apiUrl + "/plantcyclopedia/search?token=";
  gardenUrl += users.apiToken;
  gardenUrl += "&searchBy=" + searchBy;
  gardulUrl += "&plantSearch=" + plantSearch;
  final response = await http.get(gardenUrl);
  print(response.body);
  return plantFromJson(response.body);
}
