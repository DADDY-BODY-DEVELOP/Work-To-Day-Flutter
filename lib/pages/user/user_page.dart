import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import './user_add_page.dart';
import './user_edit_page.dart';

class UserPage extends StatelessWidget {
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
  Widget build(BuildContext context) {
    const user_list = [
      {
        'id': '1',
        'img': 'assets/image/test_view.jpg',
        'name': 'ไก่',
        'line_name': 'AOT',
      },
      {
        'id': '2',
        'img': 'assets/image/test_view.jpg',
        'name': 'หนอน',
        'line_name': 'PRA',
      },
      {
        'id': '2',
        'img': 'assets/image/test_view.jpg',
        'name': 'หนอน',
        'line_name': 'PRA',
      },
      {
        'id': '2',
        'img': 'assets/image/test_view.jpg',
        'name': 'หนอน',
        'line_name': 'PRA',
      },
      {
        'id': '2',
        'img': 'assets/image/test_view.jpg',
        'name': 'หนอน',
        'line_name': 'PRA',
      },
      {
        'id': '2',
        'img': 'assets/image/test_view.jpg',
        'name': 'หนอน',
        'line_name': 'PRA',
      },
      {
        'id': '2',
        'img': 'assets/image/test_view.jpg',
        'name': 'หนอน',
        'line_name': 'PRA',
      },
      {
        'id': '2',
        'img': 'assets/image/test_view.jpg',
        'name': 'หนอน',
        'line_name': 'PRA',
      },
      {
        'id': '2',
        'img': 'assets/image/test_view.jpg',
        'name': 'หนอน',
        'line_name': 'PRA',
      },
      {
        'id': '2',
        'img': 'assets/image/test_view.jpg',
        'name': 'หนอน',
        'line_name': 'PRA',
      },
      {
        'id': '2',
        'img': 'assets/image/test_view.jpg',
        'name': 'หนอน',
        'line_name': 'PRA',
      },
      {
        'id': '2',
        'img': 'assets/image/test_view.jpg',
        'name': 'หนอน',
        'line_name': 'PRA',
      },
      {
        'id': '2',
        'img': 'assets/image/test_view.jpg',
        'name': 'หนอน',
        'line_name': 'PRA',
      },
      {
        'id': '2',
        'img': 'assets/image/test_view.jpg',
        'name': 'หนอน',
        'line_name': 'PRA',
      },
      {
        'id': '2',
        'img': 'assets/image/test_view.jpg',
        'name': 'หนอน',
        'line_name': 'PRA',
      },
      {
        'id': '2',
        'img': 'assets/image/test_view.jpg',
        'name': 'หนอน',
        'line_name': 'PRA',
      },
      {
        'id': '2',
        'img': 'assets/image/test_view.jpg',
        'name': 'หนอน',
        'line_name': 'PRA',
      },
    ];

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
        child: ListView.builder(
          itemCount: user_list.length,
          itemBuilder: (context, int index) {
            return Column(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Slidable(
                    actionPane: SlidableDrawerActionPane(),
                    actionExtentRatio: 0.25,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(user_list[index]["img"]),
                      ),
                      title: Text(user_list[index]['name']),
                      subtitle: Text(user_list[index]["line_name"]),
                    ),
                    secondaryActions: <Widget>[
                      IconSlideAction(
                        caption: 'Edit',
                        color: Colors.grey.shade200,
                        icon: Icons.more_horiz,
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserEditPage()),
                        ),
                      ),
                      IconSlideAction(
                        caption: 'Delete',
                        color: Colors.red,
                        icon: Icons.delete,
                        // onTap: () => _showSnackBar('Delete'),
                      ),
                    ],
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
