import 'dart:io';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './../history/history_page.dart';

class CheckInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  File _image;
  final picker = ImagePicker();

  void getHttp() async {
    try {
      Response response = await Dio().get("http://178.128.215.172:9000/");
      print(response.data["status"]);
    } catch (e) {
      print(e);
    }
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera,
        preferredCameraDevice: CameraDevice.front,
        maxHeight: 300.0,
        maxWidth: 300.0,
        imageQuality: 90);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });

    if (_image == null) {
      _showMyDialog();
    } else {
      getHttp();
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => HistoryPage()),
      // );
    }
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('CAMERA ERROR'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('ไม่สามารถถ่ายภาพได้'),
                Text('โปรดลองอีกครั้ง'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget routerAfterPhoto() => Container(
        child: Material(
          color: Colors.orange, // button color
          child: checkImage(),
        ),
      );

  Widget checkImage() => InkWell(
        splashColor: Colors.green, // splash color
        onTap: getImage,
        child: buttonName(),
      );

  Widget buttonName() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.camera_alt,
            size: 100,
          ), // icon
          Text(
            "Check IN",
            style: TextStyle(fontSize: 50),
          ), // text
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox.fromSize(
              size: Size(300, 300), // button width and height
              child: ClipOval(child: routerAfterPhoto()),
            ),
          ],
        ),
      ),
    );
  }
}
