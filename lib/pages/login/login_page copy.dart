import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:work_to_day/custom/dialogs.dart';
import 'package:work_to_day/screens/home_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  String userID;
  String username;
  String password;
  String status;
  String name;
  String linename;
  String image;
  String workShiftID;
  int errorCode;
  String errorMsg;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formkey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  bool statusRemeber = false;
  SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
  }

  loginUser() async {
    setState(() {
      username = usernameController.text;
      password = passwordController.text;
    });
    Dialogs.showLoadingDialog(context, _keyLoader);
    await serviceLogin();
  }

  Future serviceLogin() async {
    try {
      var url =
          Uri.parse('https://work-to-day-service.herokuapp.com/api/login');
      final response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: convert.jsonEncode(
              <String, String>{'username': username, 'password': password}));
      print('object');
      String logResponse = response.statusCode.toString();
      if (response.statusCode == 200) {
        print('ResponseStatusCode: $logResponse'); // Check Status Code = 200
        print('ResponseBody: ' + response.body); // Read Data in Array
        // await sharedPreferences.setString('userData', response.body);
        // List<dynamic> responseJson = convert.json.decode(response.body);
      } else {
        throw Exception('error :(');
      }
      // setState(() {
      //   userID = response.data["data"]["id"];
      //   status = response.data["data"]["status"];
      //   name = response.data["data"]["name"];
      //   linename = response.data["data"]["linename"];
      //   image = response.data["data"]["image"];
      //   workShiftID = response.data["data"]["workShiftID"];
      // });
      // await loginSuccess();
    } catch (e) {
      // if (e.response.statusCode == 404) {
      //   setState(() {
      //     errorCode = e.response.statusCode;
      //     errorMsg = e.response.statusMessage;
      //   });
      // } else {
      //   setState(() {
      //     errorCode = e.response.statusCode;
      //     errorMsg = e.response.data["message"];
      //   });
      // }
      // await _showMyDialog();
    }
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
              },
            ),
          ],
        );
      },
    );
  }

  Future loginSuccess() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      sharedPreferences.setString('userID', userID);
      sharedPreferences.setString('username', username);
      sharedPreferences.setString('password', password);
      sharedPreferences.setString('status', status);
      sharedPreferences.setString('name', name);
      sharedPreferences.setString('linename', linename);
      sharedPreferences.setString('image', image);
      sharedPreferences.setString('workShiftID', workShiftID);
    });

    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: width,
                height: height * 0.45,
                child: Image.asset(
                  'assets/image/cute-welsh-corgi-dog-waving-paw-cartoon_42750-623-removebg-preview.png',
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'WORK TO DAY',
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  children: [
                    TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        suffixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextField(
                      obscureText: true,
                      controller: passwordController,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        suffixIcon: Icon(Icons.visibility_off),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RaisedButton(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 14.0),
                            ),
                            color: Color(0xffEE7B23),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
                            onPressed: loginUser,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
