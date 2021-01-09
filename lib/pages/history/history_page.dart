import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:work_to_day/components/header/appber.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:date_time_format/date_time_format.dart';

class HistoryPage extends StatelessWidget {
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
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  List historyList;
  String userID;
  int errorCode;
  String errorMsg;
  // final dateTime = DateTime.now().subtract(Duration(minutes: 5));
  @override
  void initState() {
    super.initState();
    getHistory();
  }

  Future<Map<String, dynamic>> getHistory() async {
    try {
      Dio().options.contentType = Headers.formUrlEncodedContentType;
      Response response = await Dio().get(
        "http://api.sixty-six-develop.tech/checkin",
      );
      setState(() {
        historyList = response.data['data'];
      });
      print(historyList);

      // print(dateTime.format());
      // print(DateTimeFormat.format(dateTime));

      // print(new DateFormat.yMMMd().format(new DateTime.now()));
    } on DioError catch (e) {
      if (e.response.statusCode == 404) {
        setState(() {
          errorCode = e.response.statusCode;
          errorMsg = e.response.statusMessage;
        });
      } else {
        print(e.response.data["message"]);
        setState(() {
          errorCode = e.response.statusCode;
          errorMsg = e.response.data["message"];
        });
      }
      await _showMyDialog();
    }
  }

  // Future serviceLogin() async {
  //   try {
  //     SharedPreferences preferences = await SharedPreferences.getInstance();
  //     setState(() {
  //       userID = preferences.getString('userID');
  //     });
  //     Dio().options.contentType = Headers.formUrlEncodedContentType;
  //     Response response = await Dio().post(
  //       "http://api.sixty-six-develop.tech/chheckin/history",
  //       data: {
  //         "userID": userID,
  //       },
  //     );
  //     print("82");
  //     print(response);
  //   } on DioError catch (e) {
  //     if (e.response.statusCode == 404) {
  //       print(e.response);
  //       print(e.response.statusCode);
  //       setState(() {
  //         errorCode = e.response.statusCode;
  //         errorMsg = e.response.statusMessage;
  //       });
  //     } else {
  //       print(e.response.data["message"]);
  //       setState(() {
  //         errorCode = e.response.statusCode;
  //         errorMsg = e.response.data["message"];
  //       });
  //     }
  //   }
  // }

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

  Widget build(BuildContext _history) {
    var assetName = 'http://api.sixty-six-develop.tech/images/user/';
    print(DateTime.parse('2021-01-01T17:33:31+07:00'));
    // print(DateTime('2021-01-01T17:33:31+07:00').format('d M Y, H:i:s'));

    return Scaffold(
      appBar: BaseAppBar(
        title: Text('HISTORY'),
        appBar: AppBar(),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          itemCount: historyList == null
              ? null
              : historyList.length == 0
                  ? null
                  : historyList.length,
          itemBuilder: (context, int index) {
            return Container(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                elevation: 8,
                child: ListTile(
                  leading: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              assetName + historyList[index]['imageIn']),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  trailing: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              historyList[index]['checkOut'] == null
                                  ? assetName + 'default.png'
                                  : assetName + historyList[index]['imageOut']),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(DateTime.parse(historyList[index]['checkIn'])
                          .format('d M Y')
                          .toString()),
                      Text(
                        'เข้างาน ' +
                            DateTime.parse(historyList[index]['checkIn'])
                                .format('H:i:s')
                                .toString(),
                      ),
                      Text(
                        historyList[index]['checkOut'] == null
                            ? 'ออกงาน --:--:--'
                            : 'ออกงาน ' +
                                DateTime.parse(historyList[index]['checkOut'])
                                    .format('H:i:s')
                                    .toString(),
                      ),
                    ],
                  ),
                  subtitle: Text(
                    historyList[index]['isLate'] == true ? ' ปกติ' : ' สาย',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: historyList[index]['isLate'] == true
                            ? Colors.green[300]
                            : Colors.redAccent[700]),
                  ),
                  //   children: [
                  //     Text('เข้างาน ' + historyList[index]['checkIn']),
                  //     Text('ออกงาน ' + historyList[index]['checkOut']),
                  //   ],
                  // ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
