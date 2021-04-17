import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:work_to_day/pages/checkOut/check_out_page.dart';
import 'package:work_to_day/pages/checkin/check_in_page.dart';

class CheckinOrCheckout extends StatefulWidget {
  @override
  _CheckinOrCheckoutState createState() => _CheckinOrCheckoutState();
}

class _CheckinOrCheckoutState extends State<CheckinOrCheckout> {
  String userID;

  int resCode = 0;

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
      });

      try {
        Dio().options.contentType = Headers.formUrlEncodedContentType;
        await Dio().post(
          "https://work-to-day-service.herokuapp.com/api/checkin/check",
          data: {"userId": userID},
        );
        setState(() {
          resCode = 1;
        });
      } on DioError catch (e) {
        setState(() {
          resCode = 0;
        });
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (resCode) == 0 ? CheckInPage() : CheckOutPage(),
    );
  }
}
