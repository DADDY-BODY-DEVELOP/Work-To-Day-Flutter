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
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('User'),
        actions: [
          ElevatedButton(
            child: Text('Add'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserAddPage()),
              );
            },
          ),
        ],
      ),
      body: Container(
        child: new Column(
          children: user_list
              .map((e) => new Slidable(
                    key: ValueKey(e["id"]),
                    actionPane: SlidableDrawerActionPane(),
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
                    dismissal: SlidableDismissal(
                      child: SlidableDrawerDismissal(),
                    ),
                    child: ListTile(
                      leading:
                          CircleAvatar(backgroundImage: AssetImage(e["img"])),
                      title: Text(e["name"]),
                      subtitle: Text(e["line_name"]),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
