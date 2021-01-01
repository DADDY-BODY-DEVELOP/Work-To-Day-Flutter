import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';

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

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  Widget build(BuildContext _history) {
    final List<Map<String, dynamic>> _history = [
      {
        'id': '1',
        'date': '14-12-20',
        'img_in': 'assets/image/test_view.jpg',
        'img_out': 'assets/image/test_view.jpg',
        'time_in': '13:11',
        'time_out': '21.00',
        'color': Colors.red[300]
      },
      {
        'id': '2',
        'date': '14-12-20',
        'img_in': 'assets/image/test_view.jpg',
        'img_out': 'assets/image/test_view.jpg',
        'time_in': '13:11',
        'time_out': '21.00',
        'color': Colors.yellow[300]
      },
      {
        'id': '3',
        'date': '14-12-20',
        'img_in': 'assets/image/test_view.jpg',
        'img_out': 'assets/image/test_view.jpg',
        'time_in': '13:11',
        'time_out': '21.00',
        'color': Colors.pink[300]
      },
      {
        'id': '4',
        'date': '14-12-20',
        'img_in': 'assets/image/test_view.jpg',
        'img_out': 'assets/image/test_view.jpg',
        'time_in': '13:11',
        'time_out': '21.00',
        'color': Colors.green[300]
      },
      {
        'id': '5',
        'date': '14-12-20',
        'img_in': 'assets/image/test_view.jpg',
        'img_out': 'assets/image/test_view.jpg',
        'time_in': '13:11',
        'time_out': '21.00',
        'color': Colors.orange[300]
      },
      {
        'id': '6',
        'date': '14-12-20',
        'img_in': 'assets/image/test_view.jpg',
        'img_out': 'assets/image/test_view.jpg',
        'time_in': '13:11',
        'time_out': '21.00',
        'color': Colors.blue[300]
      },
      {
        'id': '7',
        'date': '14-12-20',
        'img_in': 'assets/image/test_view.jpg',
        'img_out': 'assets/image/test_view.jpg',
        'time_in': '13:11',
        'time_out': '21.00',
        'color': Colors.purple[300]
      },
      {
        'id': '8',
        'date': '14-12-20',
        'img_in': 'assets/image/test_view.jpg',
        'img_out': 'assets/image/test_view.jpg',
        'time_in': '13:11',
        'time_out': '21.00',
        'color': Colors.grey[300]
      },
      {
        'id': '9',
        'date': '14-12-20',
        'img_in': 'assets/image/test_view.jpg',
        'img_out': 'assets/image/test_view.jpg',
        'time_in': '13:11',
        'time_out': '21.00',
        'color': Colors.black.withOpacity(0.6)
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          itemCount: _history.length,
          itemBuilder: (context, int index) {
            return Container(
              // height: MediaQuery.of(context).size.width * 0.5,
              child: Card(
                color: (_history[index]['color']),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                elevation: 8,
                child: ListTile(
                  leading: CircleAvatar(
                      backgroundImage: AssetImage(_history[index]['img_in'])),
                  title: Text(_history[index]['date']),
                  subtitle: Text(
                    'Secondary Text',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
