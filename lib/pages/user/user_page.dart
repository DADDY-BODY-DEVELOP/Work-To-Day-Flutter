import 'package:flutter/material.dart';
import './user_add_page.dart';

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

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  GlobalKey<FormState> _oFormKey = GlobalKey<FormState>();
  @override
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
        child: Form(
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
                  ListView(
                    restorationId: 'list_demo_list_view',
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    children: [
                      // for (int index = 1; index < 21; index++)
                      ListTile(
                          leading: ExcludeSemantics(
                            child: CircleAvatar(child: Text('1')),
                          ),
                          title: Text(
                              "GalleryLocalizations.of(context).demoListsSecondary")),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
