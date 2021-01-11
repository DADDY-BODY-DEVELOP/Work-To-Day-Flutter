import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart' show DragStartBehavior;
import 'package:flutter/cupertino.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:work_to_day/components/header/appber.dart';

class ProfilePage extends StatelessWidget {
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
  var assetName = 'http://167.99.68.225:6001/api/images/userProfile/';

  File _image;
  String username;
  String password;
  String status;
  String name;
  String linename;

  String imageProfile;
  String statusFlag;
  String workShiftID;
  String createBy;
  String updateBy;
  String userID;

  int errorCode;
  String errorMsg;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repasswordController = TextEditingController();
  TextEditingController nicknameController = TextEditingController();
  TextEditingController linenameController = TextEditingController();
  TextEditingController workShiftController = TextEditingController();

  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    initValue();
  }

  initValue() async {
    checkPrereferences();
    workShiftController = TextEditingController(text: 'starValue');
    _getValue();
  }

  Future<Null> checkPrereferences() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      setState(() {
        userID = preferences.getString('userID');
        password = preferences.getString('password');
      });

      try {
        Dio().options.contentType = Headers.formUrlEncodedContentType;
        Response response =
            await Dio().get("http://167.99.68.225:6001/api/user/$userID");
        setState(() {
          usernameController.text = response.data["data"]["username"];
          passwordController.text = password;
          status = response.data["data"]["status"];
          nicknameController.text = response.data["data"]["name"];
          linenameController.text = response.data["data"]["linename"];

          imageProfile = response.data["data"]["image"];
          statusFlag = response.data["data"]["statusFlag"];
          workShiftController.text = response.data["data"]["workShiftID"];
          createBy = response.data["data"]["createdBy"];
          updateBy = response.data["data"]["updatedBy"];
        });
      } on DioError catch (e) {
        if (e.response.statusCode == 404) {
          setState(() {
            errorCode = e.response.statusCode;
            errorMsg = e.response.statusMessage;
          });
        } else {
          setState(() {
            errorCode = e.response.statusCode;
            errorMsg = e.response.data["message"];
          });
        }
        await _showMyDialog();
      }
    } catch (e) {}
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(errorCode.toString()),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(errorMsg),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
                initValue();
              },
            ),
          ],
        );
      },
    );
  }

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
      }
    });

    final bytes = File(_image.path).readAsBytesSync();
    String img64 = base64Encode(bytes);
    updateUserImg(img64);
  }

  updateUserImg(imagesData) async {
    try {
      Dio().options.contentType = Headers.formUrlEncodedContentType;
      Response response = await Dio().put(
          "http://167.99.68.225:6001/api/user/img/$userID",
          data: {"image": imagesData});
      setState(() {
        errorCode = response.statusCode;
        errorMsg = response.data["message"];
      });
      await _showMyDialog();
    } on DioError catch (e) {
      if (e.response.statusCode == 404) {
        setState(() {
          errorCode = e.response.statusCode;
          errorMsg = e.response.statusMessage;
        });
      } else {
        setState(() {
          errorCode = e.response.statusCode;
          errorMsg = e.response.data["message"];
        });
      }
      await _showMyDialog();
    }
  }

  updateUser(imagesData) async {
    try {
      Dio().options.contentType = Headers.formUrlEncodedContentType;
      Response response = await Dio()
          .put("http://167.99.68.225:6001/api/user/$userID", data: {
        "username": usernameController.text,
        "password": passwordController.text,
        "status": status,
        "name": nicknameController.text,
        "linename": linenameController.text,
        "team": workShiftController.text,
        "workShiftID": workShiftController.text,
        "image": imagesData,
        "statusFlag": statusFlag,
        "createdBy": userID,
        "updatedBy": userID
      });
      setState(() {
        errorCode = response.statusCode;
        errorMsg = response.data["message"];
      });
      await _showMyDialog();
    } on DioError catch (e) {
      if (e.response.statusCode == 404) {
        setState(() {
          errorCode = e.response.statusCode;
          errorMsg = e.response.statusMessage;
        });
      } else {
        setState(() {
          errorCode = e.response.statusCode;
          errorMsg = e.response.data["message"];
        });
      }
      await _showMyDialog();
    }
  }

  GlobalKey<FormState> _oFormKey = GlobalKey<FormState>();

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
      'value': '5fc3c171f4877e1c38aeede1',
      'label': 'กะเช้า',
      'icon': Icon(Icons.stop),
    },
    {
      'value': '5fc3c373f4877e1c38aeede2',
      'label': 'กะเที่ยง',
      'icon': Icon(Icons.stop),
    },
    {
      'value': '5fc3c4f7f4877e1c38aeedea',
      'label': 'กะดึก',
      'icon': Icon(Icons.stop),
    },
  ];

  Future<void> _getValue() async {
    await Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        workShiftController.text = workShiftID;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text('PROFILE'),
        appBar: AppBar(),
      ),
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
                      ? assetName + imageProfile == null
                          ? Image(
                              image: NetworkImage(assetName + 'default.png'))
                          : Image(image: NetworkImage(assetName + imageProfile))
                      : Image.file(_image),
                  SizedBox(height: 15),
                  CupertinoButton.filled(
                    child: Text('Upload'),
                    onPressed: getImage,
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    controller: usernameController,
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
                    controller: passwordController,
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
                    controller: nicknameController,
                    decoration: const InputDecoration(
                      filled: true,
                      icon: Icon(Icons.folder_shared),
                      labelText: 'NickName *',
                      hintText: 'What Your Name ?',
                    ),
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    controller: linenameController,
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
                    controller: workShiftController,
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
                  RaisedButton(
                    onPressed: () {
                      final loForm = _oFormKey.currentState;

                      if (loForm.validate()) {
                        updateUser(imageProfile);
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
