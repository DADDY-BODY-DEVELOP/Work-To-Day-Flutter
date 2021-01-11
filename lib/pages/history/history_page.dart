import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:work_to_day/components/header/appber.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:date_time_format/date_time_format.dart';

import 'package:intl/intl.dart';
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
  @override
  void initState() {
    super.initState();
    getHistory();
  }

  Future<Map<String, dynamic>> getHistory() async {
    try {
      await Future.delayed(Duration(milliseconds: 500));
      SharedPreferences preferences = await SharedPreferences.getInstance();
      setState(() {
        userID = preferences.getString('userID');
      });

      Dio().options.contentType = Headers.formUrlEncodedContentType;
      Response response = await Dio()
          .get("http://167.99.68.225:6001/api/checkin/history/$userID");
      setState(() {
        historyList = response.data['data'];
      });
    } on DioError catch (e) {
      if (e.response.statusCode == 404) {
        setState(() {
          errorCode = e.response.statusCode;
          errorMsg = e.response.statusMessage;
          historyList = null;
        });
      } else {
        setState(() {
          errorCode = e.response.statusCode;
          errorMsg = e.response.data["message"];
          historyList = null;
        });
      }
    }
  }

  Widget build(BuildContext _history) {
    var assetName = 'http://167.99.68.225:6001/api/images/checkin/';
    return Scaffold(
      appBar: BaseAppBar(
        title: Text('HISTORY'),
        appBar: AppBar(),
      ),
      body: RefreshIndicator(
        onRefresh: getHistory,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
          height: MediaQuery.of(context).size.height,
          child: historyList == null
              ? null
              : historyList.length == 0
                  ? null
                  : ListView.builder(
                      itemCount: historyList.length,
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
                                      image: NetworkImage(assetName +
                                          historyList[index]['imageIn']),
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
                                              : assetName +
                                                  historyList[index]
                                                      ['imageOut']),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(DateTime.parse(
                                          historyList[index]['checkIn']).toLocal()
                                      .format('d M Y')),
                                  Text(
                                    'เข้างาน ' +
                                        DateTime.parse(
                                                historyList[index]['checkIn']).toLocal()
                                            .format('H:i:s'),
                                  ),
                                  Text(
                                    historyList[index]['checkOut'] == null
                                        ? 'ออกงาน --:--:--'
                                        : 'ออกงาน ' +
                                            DateTime.parse(historyList[index]
                                                    ['checkOut']).toLocal()
                                                .format('H:i:s')
                                                .toString(),
                                  ),
                                ],
                              ),
                              subtitle: Text(
                                historyList[index]['isLate'] == true
                                    ? ' ปกติ'
                                    : ' สาย',
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
      ),
    );
  }
}
