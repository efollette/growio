import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

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
      setState(() {
        print('Update the UI');
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: AppBar(
          title: new Text('Image Picker'),
        ),
        body: new Container(
          child: new Center(
              child: image==null?new Text('No Image To Show'):new Image.file(image),
          ),
        ),
        floatingActionButton: new FloatingActionButton(
          onPressed: picker,
          child: new Icon(Icons.camera_alt),
        ),
      ),
    );
  }
}