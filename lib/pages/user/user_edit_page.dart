import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart' show DragStartBehavior;
import 'package:flutter/cupertino.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class UserEditPage extends StatelessWidget {
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

  Future getImage() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera,
        imageQuality: 50,
        preferredCameraDevice: CameraDevice.front,
        maxHeight: 500,
        maxWidth: 500);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
    final bytes = File(_image.path).readAsBytesSync();
    String img64 = base64Encode(bytes);

    var url = 'http://192.168.1.23:9000/api/user';
    var response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "username": "warayut.ta",
          "password": "abc@123",
          "status": "ADMIN",
          "name": "warayut",
          "linename": "taekrathok",
          "team": "CHUN",
          "image": "$img64",
          "statusFlag": "A",
          "createdBy": "000000000000000000000000",
          "updatedBy": "000000000000000000000000"
        }));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  GlobalKey<FormState> _oFormKey = GlobalKey<FormState>();
  TextEditingController _controller;

  String _valueChanged = '';
  String _valueToValidate = '';
  String _valueSaved = '';

  final List<Map<String, dynamic>> _items = [
    {
      'value': '',
      'label': 'เลือกทีม',
      'enable': false,
      'icon': Icon(Icons.stop),
    },
    {
      'value': 'Dong',
      'label': 'ทีม Dong',
      'icon': Icon(Icons.stop),
    },
    {
      'value': 'Jeeb',
      'label': 'ทีม Jeeb',
      'icon': Icon(Icons.stop),
    },
    {
      'value': 'Tae',
      'label': 'ทีม Tae',
      'icon': Icon(Icons.stop),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: Form(
          key: _oFormKey,
          child: Scrollbar(
            child: SingleChildScrollView(
              dragStartBehavior: DragStartBehavior.down,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 15),
                  _image == null
                      ? Image(image: AssetImage('assets/image/test_view.jpg'))
                      : Image.file(_image),
                  SizedBox(height: 15),
                  CupertinoButton.filled(
                    child: Text('Upload'),
                    onPressed: getImage,
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    decoration: const InputDecoration(
                      filled: true,
                      // icon: Icon(FontAwesomeIcons.person),
                      icon: Icon(Icons.person),
                      labelText: 'Username *',
                      hintText: 'Username 8 - 12',
                    ),
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    decoration: const InputDecoration(
                      filled: true,
                      icon: Icon(Icons.lock),
                      labelText: 'Password *',
                      hintText: 'Password 8 - 12 , a-z',
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    decoration: const InputDecoration(
                      filled: true,
                      icon: Icon(Icons.lock),
                      labelText: 'Confilm Password *',
                      hintText: 'Password',
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    decoration: const InputDecoration(
                      filled: true,
                      icon: Icon(Icons.folder_shared),
                      labelText: 'NickName *',
                      hintText: 'What Your Name ?',
                    ),
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    decoration: const InputDecoration(
                      filled: true,
                      icon: Icon(Icons.person),
                      labelText: 'LineName *',
                      hintText: 'Line Name ?',
                    ),
                  ),
                  SizedBox(height: 15),
                  SelectFormField(
                    decoration: InputDecoration(
                      filled: true,
                      icon: Icon(Icons.format_shapes),
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      hintText: "Name",
                    ),
                    controller: _controller,
                    labelText: 'Shape',
                    dialogTitle: 'Pick a item',
                    dialogCancelBtn: 'CANCEL',
                    enableSearch: true,
                    dialogSearchHint: 'Search item',
                    items: _items,
                    onChanged: (val) => setState(() => _valueChanged = val),
                    validator: (val) {
                      setState(() => _valueToValidate = val);
                      return null;
                    },
                    onSaved: (val) => setState(() => _valueSaved = val),
                  ),
                  SizedBox(height: 15),
                  SelectableText(_valueChanged),
                  SizedBox(height: 15),
                  SelectableText(_valueToValidate),
                  SizedBox(height: 15),
                  SelectableText(_valueSaved),
                  SizedBox(height: 15),
                  RaisedButton(
                    onPressed: () {
                      final loForm = _oFormKey.currentState;

                      if (loForm.validate()) {
                        loForm.save();
                      }
                    },
                    child: Text('Submit'),
                  ),
                  SizedBox(height: 15),
                  RaisedButton(
                    onPressed: () {
                      final loForm = _oFormKey.currentState;
                      loForm.reset();
                      setState(() {
                        _valueChanged = '';
                        _valueToValidate = '';
                        _valueSaved = '';
                      });
                    },
                    child: Text('Reset'),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
