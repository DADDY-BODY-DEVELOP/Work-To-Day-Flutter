import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:work_to_day/components/header/appber.dart';
import 'package:work_to_day/pages/checkin/check_in_page.dart';

class CheckOutPage extends StatelessWidget {
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
  String userID;
  String workShiftID;
  @override
  void initState() {
    super.initState();
    checkPrereferences();
  }

  Future<Null> checkPrereferences() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      setState(() {
        userID = preferences.getString('userID');
        workShiftID = preferences.getString('workShiftID');
      });
    } catch (e) {}
  }

  File _image;
  final picker = ImagePicker();

  void getHttp() async {
    try {
      final bytes = File(_image.path).readAsBytesSync();
      String img64 = base64Encode(bytes);

      Response response = await Dio()
          .post("http://api.sixty-six-develop.tech/checkin", data: {
        "userId": userID,
        "image": img64,
        "location": "123",
        "workShiftID": workShiftID
      });
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => CheckInPage()),
      );
    } catch (e) {}
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera,
        preferredCameraDevice: CameraDevice.front,
        maxHeight: 400.0,
        maxWidth: 400.0,
        imageQuality: 90);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });

    if (_image == null) {
      _showMyDialog();
    } else {
      getHttp();
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
          color: Colors.amber, // button color
          child: checkImage(),
        ),
      );

  Widget checkImage() => InkWell(
        splashColor: Colors.white, // splash color
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
            "CHECK OUT",
            style: TextStyle(fontSize: 40),
          ), // text
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text('CHECK OUT'),
        appBar: AppBar(),
      ),
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
