import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart' show DragStartBehavior;
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/cupertino.dart';

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
  String dropdownValue = 'เลือกทีม';
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    const sizedBoxSpace = SizedBox(height: 24);
    return Scaffold(
      body: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: Form(
          key: _formKey,
          // autovalidateMode: _autoValidateMode,
          child: Scrollbar(
            child: SingleChildScrollView(
              dragStartBehavior: DragStartBehavior.down,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  sizedBoxSpace,
                  Image(image: AssetImage('assets/image/test_view.jpg')),
                  sizedBoxSpace,
                  CupertinoButton.filled(
                    child: Text('Upload'),
                    onPressed: () {},
                  ),
                  sizedBoxSpace,
                  TextFormField(
                    decoration: const InputDecoration(
                      filled: true,
                      icon: Icon(Icons.person),
                      labelText: 'Username *',
                      hintText: 'Username 8 - 12',
                    ),
                  ),
                  sizedBoxSpace,
                  TextFormField(
                    decoration: const InputDecoration(
                      filled: true,
                      icon: Icon(Icons.person),
                      labelText: 'Password *',
                      hintText: 'Password 8 - 12 , a-z',
                    ),
                    obscureText: true,
                  ),
                  sizedBoxSpace,
                  TextFormField(
                    decoration: const InputDecoration(
                      filled: true,
                      icon: Icon(Icons.person),
                      labelText: 'Confilm Password *',
                      hintText: 'Password',
                    ),
                    obscureText: true,
                  ),
                  sizedBoxSpace,
                  TextFormField(
                    decoration: const InputDecoration(
                      filled: true,
                      icon: Icon(Icons.person),
                      labelText: 'NickName *',
                      hintText: 'What Your Name ?',
                    ),
                  ),
                  sizedBoxSpace,
                  TextFormField(
                    decoration: const InputDecoration(
                      filled: true,
                      icon: Icon(Icons.person),
                      labelText: 'LineName *',
                      hintText: 'Line Name ?',
                    ),
                  ),
                  sizedBoxSpace,
                  DropdownButton<String>(
                    value: dropdownValue,
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.deepPurple),
                    // underline: Container(
                    //   height: 2,
                    //   color: Colors.deepPurpleAccent,
                    // ),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: <String>['เลือกทีม', 'Two', 'Free', 'Four']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  sizedBoxSpace,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
