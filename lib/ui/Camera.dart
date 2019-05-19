import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:convert';

class Camera extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return new CameraState();
  }
}

class CameraState extends State<Camera> {
  File image;
  picker() async{
    print('Picker is called');
    File img= await ImagePicker.pickImage(source: ImageSource.gallery);
    if(img!=null){
      image=img;
      print(img.path);
      //updates our UI
      List<int> imageBytes= image.readAsBytesSync();
      String base64Image = base64Encode(imageBytes);
      print('Printing the image path');
      print(base64Image);
      setState(() {
        print('Update the UI');
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Image Picker'),
        ),
        body: Container(
          child: Center(
              child: image == null ? Text('No Image To Show'): Image.file(image),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: picker,
          child: Icon(Icons.camera_alt),
        ),
    );
  }
}