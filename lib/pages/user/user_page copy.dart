import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import './user_add_page.dart';
// import './user_list_page.dart';

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
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  GlobalKey<FormState> _oFormKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
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
        // alignment: Alignment.center,
        child: Column(
          children: [
            Form(
              key: _oFormKey,
              child: Scrollbar(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 15),
                      TextFormField(
                        decoration: const InputDecoration(
                          filled: true,
                          icon: Icon(Icons.search),
                          labelText: 'Search *',
                          hintText: 'กรอกข้อมูล',
                        ),
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),

            ListTile(
              leading: Icon(Icons.person),
              title: Text('น้องเมย์'),
              subtitle: Text('081-999-55xx'),
              trailing: Icon(Icons.call),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('น้องมายด์'),
              subtitle: Text('081-999-44xx'),
              trailing: Icon(Icons.call),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('น้องแตงกวา'),
              subtitle: Text('081-999-99xx'),
              trailing: Icon(Icons.call),
            ),
            ListTile(
              leading: ExcludeSemantics(
                child: Image(image: AssetImage('assets/image/test_view.jpg')),
              ),
              title: Text(
                'NickName : Est',
              ),
              subtitle: Text('LineName : SOS'),
              trailing: Icon(Icons.chevron_right),
            ),
            ListTile(
              leading: ExcludeSemantics(
                child: Image(image: AssetImage('assets/image/test_view.jpg')),
              ),
              title: Text(
                'NickName : Est',
              ),
              subtitle: Text('LineName : SOS'),
              trailing: IconButton(
                icon: Icon(Icons.chevron_right),
                // color: Colors.black26,
                onPressed: () {},
              ),
              // IconButton(
              //   icon: new Icon(Icons.chevron_right),
              //   color: Colors.black26,
              //   onPressed: () {},
              // ),
            ),
            // ),
          ],
        ),
      ),
    );
  }
}

class UserlistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return Slidable(
            key: ValueKey(index),
            actionPane: SlidableDrawerActionPane(),
            actions: <Widget>[
              IconSlideAction(
                caption: 'Archive',
                color: Colors.blue,
                icon: Icons.archive,
              ),
              IconSlideAction(
                caption: 'Share',
                color: Colors.indigo,
                icon: Icons.share,
              ),
            ],
            secondaryActions: <Widget>[
              IconSlideAction(
                caption: 'More',
                color: Colors.grey.shade200,
                icon: Icons.more_horiz,
              ),
              IconSlideAction(
                caption: 'Delete',
                color: Colors.red,
                icon: Icons.delete,
              ),
            ],
            dismissal: SlidableDismissal(
              child: SlidableDrawerDismissal(),
            ),
            child: ListTile(
              title: Text('น้องเมย์'),
              subtitle: Text('081-999-55xx'),
            ),
          );
        },
      ),
    );
  }
}
