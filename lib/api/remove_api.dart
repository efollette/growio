import 'package:http/http.dart' as http;
import 'dart:async';
import '../model/plant_model.dart';
import '../utils/users.dart' as users;
import '../utils/constants.dart' as constant;
import 'dart:convert';

Future<void> removePlant(String nickname) async {
  final client = http.Client();
  String removeUrl = constant.apiUrl + "/garden/plant?token=";
  removeUrl += users.apiToken;
  final response = await client.send(
      http.Request("DELETE", Uri.parse(removeUrl))
        ..body = json.encode({"nickname": nickname}));
  //print(response.body);

}