import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'dart:io';
import '../model/plant_model.dart';
import '../utils/users.dart' as users;
import '../utils/constants.dart' as constant;


Future<List<dynamic>> identifyPlant (String base64Image) async {

  String identifyUrl = constant.apiUrl + "/plant/identify?token=";
  identifyUrl += users.apiToken;

  final response = await http.post(identifyUrl, body: {'image': base64Image});

  print("API" + response.body);
  final jsonData = json.decode(response.body)['body'][0]['suggestions'];
  //final suggestions = jsonData['suggestions'];
  print(jsonData);

  return jsonData;

}