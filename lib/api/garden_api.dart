import 'package:http/http.dart' as http;
import 'dart:async';
import '../model/plant_model.dart';
import '../utils/users.dart' as users;
import '../utils/constants.dart' as constant;
import 'dart:convert';


Future<List<Plant>> getAllPlants() async {
  String gardenUrl = constant.apiUrl + "/garden/plants?token=";
  gardenUrl += users.apiToken;
  final response = await http.get(gardenUrl);
  print(response.body);
  return allPlantsFromJson(response.body);
}


Future<bool> removePlant(String nickname) async {
  final client = http.Client();
  print(nickname);
  String removeUrl = constant.apiUrl + "/garden/plant?token=";
  removeUrl += users.apiToken;
  removeUrl += "&nickname=";
  removeUrl += nickname;
  final response = await client.send(
      http.Request('DELETE', Uri.parse(removeUrl))
        ..body = jsonEncode({'nickname': nickname}));
  print(response);

  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }

}

Future<bool> addToGarden(String scientificName, String nickname, String imageUrl) async {

  String addUrl = constant.apiUrl + "/garden/plant?token=";
  addUrl += users.apiToken;
  print ('cool');
  print (scientificName);
  print (nickname);
  if (imageUrl == null) {
    imageUrl = 'https://res.cloudinary.com/growio/image/upload/v1559880516/plants_identify/lilPlantDude_fxgb5h.png';
  }
  print (imageUrl);
  final response = await http.post(addUrl, body: {"sciName": scientificName, "nickname": nickname, "imageUrl": imageUrl});

  print ('suarbah');
  print(response.body);

  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}