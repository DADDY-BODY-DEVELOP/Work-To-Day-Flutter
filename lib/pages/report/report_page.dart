import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:work_to_day/components/header/appber.dart';
import './report_list_page.dart';

class ReportPage extends StatelessWidget {
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
  final List<Map<String, dynamic>> _testDay = [
    {
      'id': '1',
      'date': '01-12-63',
    },
    {
      'id': '2',
      'date': '02-12-63',
    },
    {
      'id': '3',
      'date': '03-12-63',
    },
    {
      'id': '4',
      'date': '04-12-63',
    },
    {
      'id': '5',
      'date': '05-12-63',
    },
    {
      'id': '6',
      'date': '06-12-63',
    },
    {
      'id': '7',
      'date': '07-12-63',
    },
    {
      'id': '8',
      'date': '08-12-63',
    },
    {
      'id': '9',
      'date': '09-12-63',
    },
    {
      'id': '6',
      'date': '06-12-63',
    },
    {
      'id': '6',
      'date': '06-12-63',
    },
    {
      'id': '6',
      'date': '06-12-63',
    },
    {
      'id': '6',
      'date': '06-12-63',
    },
    {
      'id': '6',
      'date': '06-12-63',
    },
    {
      'id': '6',
      'date': '06-12-63',
    },
    {
      'id': '6',
      'date': '06-12-63',
    },
    {
      'id': '6',
      'date': '06-12-63',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text('REPORT'),
        appBar: AppBar(),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
        child: ListView.builder(
          itemCount: _testDay.length,
          itemBuilder: (context, int index) {
            return Column(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: ListTile(
                    title: Text(_testDay[index]['date']),
                    subtitle: Column(
                      //   itemCount: _testShift.length,
                      //   itemBuilder: (context, int index) {
                      //     return Column(
                      //       children: [
                      //         Card(
                      //           shape: RoundedRectangleBorder(
                      //             borderRadius: BorderRadius.circular(12.0),
                      //           ),
                      //           child: ListTile(
                      //             title: Text(_testShift[index]['shift']),
                      //             subtitle: Card(),
                      //           ),
                      //         )
                      //       ],
                      //     );
                      //   },
                      children: [
                        new Card(
                          child: new InkWell(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ReportListPage()),
                            ),
                            child: new Container(
                              padding: new EdgeInsets.all(7.0),
                              child: new Row(
                                children: <Widget>[
                                  new Expanded(
                                    flex: 3,
                                    child: new Wrap(
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.wb_sunny,
                                          color: Colors.amberAccent[400],
                                        ),
                                        Icon(
                                          Icons.person,
                                          color: Colors.brown[700],
                                        ),
                                        Text(
                                          ' : 7',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.brown[600],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  new Expanded(
                                    flex: 2,
                                    child: new Wrap(
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.exit_to_app,
                                          color: Colors.green[600],
                                        ),
                                        Text(
                                          ' : 7',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green[600],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  new Expanded(
                                    flex: 2,
                                    child: new Wrap(
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.alarm,
                                          color: Colors.red[600],
                                        ),
                                        Text(
                                          ' : 0',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red[600],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  new Expanded(
                                    flex: 2,
                                    child: new Wrap(
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.launch,
                                          color: Colors.green[600],
                                        ),
                                        Text(
                                          ' : 7',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green[600],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        new Card(
                          child: new InkWell(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ReportListPage()),
                            ),
                            child: new Container(
                              padding: new EdgeInsets.all(7.0),
                              child: new Row(
                                children: <Widget>[
                                  new Expanded(
                                    flex: 3,
                                    child: new Wrap(
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.wb_twighlight,
                                          color: Colors.orange[700],
                                        ),
                                        Icon(
                                          Icons.person,
                                          color: Colors.brown[700],
                                        ),
                                        Text(
                                          ' : 7',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.brown[600],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  new Expanded(
                                    flex: 2,
                                    child: new Wrap(
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.exit_to_app,
                                          color: Colors.green[600],
                                        ),
                                        Text(
                                          ' : 7',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green[600],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  new Expanded(
                                    flex: 2,
                                    child: new Wrap(
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.alarm,
                                          color: Colors.red[600],
                                        ),
                                        Text(
                                          ' : 0',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red[600],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  new Expanded(
                                    flex: 2,
                                    child: new Wrap(
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.launch,
                                          color: Colors.green[600],
                                        ),
                                        Text(
                                          ' : 7',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green[600],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        new Card(
                          child: new InkWell(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ReportListPage()),
                            ),
                            child: new Container(
                              padding: new EdgeInsets.all(7.0),
                              child: new Row(
                                children: <Widget>[
                                  new Expanded(
                                    flex: 3,
                                    child: new Wrap(
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.bedtime,
                                          color: Colors.purpleAccent[700],
                                        ),
                                        Icon(
                                          Icons.person,
                                          color: Colors.brown[700],
                                        ),
                                        Text(
                                          ' : 7',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.brown[600],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  new Expanded(
                                    flex: 2,
                                    child: new Wrap(
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.exit_to_app,
                                          color: Colors.green[600],
                                        ),
                                        Text(
                                          ' : 7',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green[600],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  new Expanded(
                                    flex: 2,
                                    child: new Wrap(
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.alarm,
                                          color: Colors.red[600],
                                        ),
                                        Text(
                                          ' : 0',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red[600],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  new Expanded(
                                    flex: 2,
                                    child: new Wrap(
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.launch,
                                          color: Colors.green[600],
                                        ),
                                        Text(
                                          ' : 7',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green[600],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
