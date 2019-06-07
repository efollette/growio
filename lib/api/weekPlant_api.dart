import 'package:http/http.dart' as http;
import 'dart:async';
import '../utils/users.dart' as users;
import '../utils/constants.dart' as constant;
import '../model/plantWeek_model.dart';


Future<PlantWeek> getPlantOfTheWeek() async {
  String plantWeekUrl = constant.apiUrl + "/plant/week?token=";
  plantWeekUrl += users.apiToken;
  final response = await http.get(plantWeekUrl);
  print(response.body + " plant of the week");
  return plantFromJson(response.body);
}

