import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ReportListPage extends StatelessWidget {
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
  final List<Map<String, dynamic>> _testUser = [
    {
      'id': '1',
      'date': '01-12-63',
      'shift': 'morning',
      'user': 'nong A',
      'team': 'doong',
      'time_in': '13.00',
      'status_in': 'ตรงเวลา',
      'time_out': '21.30',
      'status_out': 'ออกก่อนเวลา',
    },
    {
      'id': '2',
      'date': '02-12-63',
      'shift': 'morning',
      'user': 'nong B',
      'team': 'doong',
      'time_in': '13.00',
      'status_in': 'ตรงเวลา',
      'time_out': '21.30',
      'status_out': 'ออกก่อนเวลา',
    },
    {
      'id': '3',
      'date': '02-12-63',
      'shift': 'morning',
      'user': 'nong C',
      'team': 'doong',
      'time_in': '13.00',
      'status_in': 'ตรงเวลา',
      'time_out': '21.30',
      'status_out': 'ออกก่อนเวลา',
    },
    {
      'id': '4',
      'date': '02-12-63',
      'shift': 'morning',
      'user': 'nong D',
      'team': 'doong',
      'time_in': '13.00',
      'status_in': 'ตรงเวลา',
      'time_out': '21.30',
      'status_out': 'ออกก่อนเวลา',
    },
    {
      'id': '5',
      'date': '02-12-63',
      'shift': 'morning',
      'user': 'nong E',
      'team': 'doong',
      'time_in': '13.00',
      'status_in': 'ตรงเวลา',
      'time_out': '21.30',
      'status_out': 'ออกก่อนเวลา',
    },
    {
      'id': '6',
      'date': '02-12-63',
      'shift': 'morning',
      'user': 'nong F',
      'team': 'doong',
      'time_in': '13.00',
      'status_in': 'ตรงเวลา',
      'time_out': '21.30',
      'status_out': 'ออกก่อนเวลา',
    },
    {
      'id': '7',
      'date': '02-12-63',
      'shift': 'morning',
      'user': 'nong G',
      'team': 'doong',
      'time_in': '13.00',
      'status_in': 'ตรงเวลา',
      'time_out': '21.30',
      'status_out': 'ออกก่อนเวลา',
    },
    {
      'id': '8',
      'date': '01-12-63',
      'shift': 'afternoon',
      'user': 'nong A',
      'team': 'doong',
      'time_in': '13.00',
      'status_in': 'ตรงเวลา',
      'time_out': '21.30',
      'status_out': 'ออกก่อนเวลา',
    },
    {
      'id': '9',
      'date': '02-12-63',
      'shift': 'afternoon',
      'user': 'nong B',
      'team': 'doong',
      'time_in': '13.00',
      'status_in': 'ตรงเวลา',
      'time_out': '21.30',
      'status_out': 'ออกก่อนเวลา',
    },
    {
      'id': '10',
      'date': '02-12-63',
      'shift': 'afternoon',
      'user': 'nong C',
      'team': 'doong',
      'time_in': '13.00',
      'status_in': 'ตรงเวลา',
      'time_out': '21.30',
      'status_out': 'ออกก่อนเวลา',
    },
    {
      'id': '11',
      'date': '02-12-63',
      'shift': 'afternoon',
      'user': 'nong D',
      'team': 'doong',
      'time_in': '13.00',
      'status_in': 'ตรงเวลา',
      'time_out': '21.30',
      'status_out': 'ออกก่อนเวลา',
    },
    {
      'id': '12',
      'date': '02-12-63',
      'shift': 'afternoon',
      'user': 'nong E',
      'team': 'doong',
      'time_in': '13.00',
      'status_in': 'ตรงเวลา',
      'time_out': '21.30',
      'status_out': 'ออกก่อนเวลา',
    },
    {
      'id': '13',
      'date': '02-12-63',
      'shift': 'afternoon',
      'user': 'nong F',
      'team': 'doong',
      'time_in': '13.00',
      'status_in': 'ตรงเวลา',
      'time_out': '21.30',
      'status_out': 'ออกก่อนเวลา',
    },
    {
      'id': '14',
      'date': '02-12-63',
      'shift': 'afternoon',
      'user': 'nong G',
      'team': 'doong',
      'time_in': '13.00',
      'status_in': 'ตรงเวลา',
      'time_out': '21.30',
      'status_out': 'ออกก่อนเวลา',
    },
    {
      'id': '15',
      'date': '01-12-63',
      'shift': 'midnight',
      'user': 'nong A',
      'team': 'doong',
      'time_in': '13.00',
      'status_in': 'ตรงเวลา',
      'time_out': '21.30',
      'status_out': 'ออกก่อนเวลา',
    },
    {
      'id': '16',
      'date': '02-12-63',
      'shift': 'midnight',
      'user': 'nong B',
      'team': 'doong',
      'time_in': '13.00',
      'status_in': 'ตรงเวลา',
      'time_out': '21.30',
      'status_out': 'ออกก่อนเวลา',
    },
    {
      'id': '17',
      'date': '02-12-63',
      'shift': 'midnight',
      'user': 'nong C',
      'team': 'doong',
      'time_in': '13.00',
      'status_in': 'ตรงเวลา',
      'time_out': '21.30',
      'status_out': 'ออกก่อนเวลา',
    },
    {
      'id': '18',
      'date': '02-12-63',
      'shift': 'midnight',
      'user': 'nong D',
      'team': 'doong',
      'time_in': '13.00',
      'status_in': 'ตรงเวลา',
      'time_out': '21.30',
      'status_out': 'ออกก่อนเวลา',
    },
    {
      'id': '19',
      'date': '02-12-63',
      'shift': 'midnight',
      'user': 'nong E',
      'team': 'doong',
      'time_in': '13.00',
      'status_in': 'ตรงเวลา',
      'time_out': '21.30',
      'status_out': 'ออกก่อนเวลา',
    },
    {
      'id': '20',
      'date': '02-12-63',
      'shift': 'midnight',
      'user': 'nong F',
      'team': 'doong',
      'time_in': '13.00',
      'status_in': 'ตรงเวลา',
      'time_out': '21.30',
      'status_out': 'ออกก่อนเวลา',
    },
    {
      'id': '21',
      'date': '02-12-63',
      'shift': 'midnight',
      'user': 'nong G',
      'team': 'doong',
      'time_in': '13.00',
      'status_in': 'ตรงเวลา',
      'time_out': '21.30',
      'status_out': 'ออกก่อนเวลา',
    },
    {
      'id': '22',
      'date': '03-12-63',
      'shift': 'morning',
      'user': 'nong H',
      'team': 'doong',
      'time_in': '13.00',
      'status_in': 'ตรงเวลา',
      'time_out': '21.30',
      'status_out': 'ออกก่อนเวลา',
    },
    {
      'id': '23',
      'date': '03-12-63',
      'shift': 'afternoon',
      'user': 'nong i',
      'team': 'doong',
      'time_in': '13.00',
      'status_in': 'ตรงเวลา',
      'time_out': '21.30',
      'status_out': 'ออกก่อนเวลา',
    },
    {
      'id': '24',
      'date': '03-12-63',
      'shift': 'midnight',
      'user': 'nong h',
      'team': 'doong',
      'time_in': '13.00',
      'status_in': 'ตรงเวลา',
      'time_out': '21.30',
      'status_out': 'ออกก่อนเวลา',
    },
    {
      'id': '25',
      'date': '04-12-63',
      'shift': 'morning',
      'user': 'nong H',
      'team': 'doong',
      'time_in': '13.00',
      'status_in': 'ตรงเวลา',
      'time_out': '21.30',
      'status_out': 'ออกก่อนเวลา',
    },
    {
      'id': '26',
      'date': '04-12-63',
      'shift': 'afternoon',
      'user': 'nong i',
      'team': 'doong',
      'time_in': '13.00',
      'status_in': 'ตรงเวลา',
      'time_out': '21.30',
      'status_out': 'ออกก่อนเวลา',
    },
    {
      'id': '27',
      'date': '04-12-63',
      'shift': 'midnight',
      'user': 'nong h',
      'team': 'doong',
      'time_in': '13.00',
      'status_in': 'ตรงเวลา',
      'time_out': '21.30',
      'status_out': 'ออกก่อนเวลา',
    },
    {
      'id': '28',
      'date': '05-12-63',
      'shift': 'morning',
      'user': 'nong H',
      'team': 'doong',
      'time_in': '13.00',
      'status_in': 'ตรงเวลา',
      'time_out': '21.30',
      'status_out': 'ออกก่อนเวลา',
    },
    {
      'id': '29',
      'date': '05-12-63',
      'shift': 'afternoon',
      'user': 'nong i',
      'team': 'doong',
      'time_in': '13.00',
      'status_in': 'ตรงเวลา',
      'time_out': '21.30',
      'status_out': 'ออกก่อนเวลา',
    },
    {
      'id': '30',
      'date': '05-12-63',
      'shift': 'midnight',
      'user': 'nong h',
      'team': 'doong',
      'time_in': '13.00',
      'status_in': 'ตรงเวลา',
      'time_out': '21.30',
      'status_out': 'ออกก่อนเวลา',
    },
    {
      'id': '31',
      'date': '06-12-63',
      'shift': 'morning',
      'user': 'nong H',
      'team': 'doong',
      'time_in': '13.00',
      'status_in': 'ตรงเวลา',
      'time_out': '21.30',
      'status_out': 'ออกก่อนเวลา',
    },
    {
      'id': '32',
      'date': '06-12-63',
      'shift': 'afternoon',
      'user': 'nong i',
      'team': 'doong',
      'time_in': '13.00',
      'status_in': 'ตรงเวลา',
      'time_out': '21.30',
      'status_out': 'ออกก่อนเวลา',
    },
    {
      'id': '33',
      'date': '06-12-63',
      'shift': 'midnight',
      'user': 'nong h',
      'team': 'doong',
      'time_in': '13.00',
      'status_in': 'ตรงเวลา',
      'time_out': '21.30',
      'status_out': 'ออกก่อนเวลา',
    },
  ];
  List<String> litems = [];
  final TextEditingController eCtrl = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Report'),
      ),
      body: new Column(
        children: <Widget>[
          Card(
            child: new Center(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: <InlineSpan>[
                        TextSpan(
                          text: '14-12-63',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red[600]),
                        ),
                      ]),
                    ),
                  ),
                  Expanded(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: <InlineSpan>[
                        TextSpan(
                          text: 'Moning',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red[600]),
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
          new Expanded(
            child: new ListView(
              padding: new EdgeInsets.all(7.0),
              children: List.generate(10, (i) => new CustomCard()).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Column(
        children: <Widget>[
          new Container(
            padding: new EdgeInsets.all(7.0),
            child: new Row(
              children: <Widget>[
                new Expanded(
                  flex: 2,
                  child: new Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(
                        'Name : ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.brown[600],
                        ),
                      ),
                      Text(
                        'Est',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.brown[600],
                        ),
                      ),
                    ],
                  ),
                ),
                new Expanded(
                  flex: 8,
                  child: new Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: <Widget>[
                      new Container(
                        padding: new EdgeInsets.all(7.0),
                        child: new Row(
                          children: <Widget>[
                            new Expanded(
                              flex: 3,
                              child: new Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Icon(
                                    Icons.exit_to_app,
                                    color: Colors.green[600],
                                  ),
                                  Text(
                                    ' 17:11',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.brown[600],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            new Expanded(
                              flex: 3,
                              child: new Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Icon(
                                    Icons.alarm,
                                    color: Colors.red[600],
                                  ),
                                  Text(
                                    ' 30 นาที',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.brown[600],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      new Container(
                        padding: new EdgeInsets.all(7.0),
                        child: new Row(
                          children: <Widget>[
                            new Expanded(
                              flex: 3,
                              child: new Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Icon(
                                    Icons.launch,
                                    color: Colors.green[600],
                                  ),
                                  Text(
                                    ' 21:00',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.brown[600],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            new Expanded(
                              flex: 3,
                              child: new Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Text(
                                    '',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.brown[600],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
