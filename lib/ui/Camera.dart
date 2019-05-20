import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:convert';

class Camera extends StatefulWidget {
  final bool cameraStatus;

  Camera(this.cameraStatus);
  @override
  CameraState createState() => CameraState();
  }
}

class CameraState extends State<Camera> {
  File image;
  picker() async{
    print('Picker is called');
    File img= await ImagePicker.pickImage(source: ImageSource.gallery);
    print('Imageexec');
    if(img!=null){
      image=img;
      print(img.path);
      //updates our UI
      List<int> imageBytes= image.readAsBytesSync();
      String base64Image = base64Encode(imageBytes);
      print('Printing the image path');
      print(widget.cameraStatus);
      print(base64Image);
      setState(() {
        print('Update the UI');
      });
    }
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Take Picture"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text("Upload From Gallery"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: new Text('Image Picker'),
        ),
        body: new Container(
          child: new Center(
              child: image==null?new Text('No Image To Show'):new Image.file(image),
          ),
        ),
        floatingActionButton: new FloatingActionButton(
          onPressed: _showDialog,
          child: new Icon(Icons.camera_alt),
        ),
      ),
    );
  }
}