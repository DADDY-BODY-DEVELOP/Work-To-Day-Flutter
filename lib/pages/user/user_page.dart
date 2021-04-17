import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:work_to_day/components/header/appber.dart';
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

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  List userList;
  int errorCode;
  String errorMsg;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<Map<String, dynamic>> getData() async {
    try {
      Dio().options.contentType = Headers.formUrlEncodedContentType;
      Response response = await Dio().get(
        "https://work-to-day-service.herokuapp.com/api/user",
      );
      setState(() {
        userList = response.data['data'];
      });
    } on DioError catch (e) {
      if (e.response.statusCode == 404) {
        setState(() {
          errorCode = e.response.statusCode;
          errorMsg = e.response.statusMessage;
        });
      } else {
        setState(() {
          errorCode = e.response.statusCode;
          errorMsg = e.response.data["message"];
        });
      }
      await _showMyDialog();
    }
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
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

  Widget build(BuildContext context) {
    var assetName =
        'https://work-to-day-service.herokuapp.com/api/images/user/';

    return Scaffold(
      appBar: BaseAppBar(
        title: Text('USER'),
        appBar: AppBar(),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
        child: ListView.builder(
          itemCount: userList == null
              ? null
              : userList.length == 0
                  ? null
                  : userList.length,
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
                        backgroundImage: NetworkImage(
                            userList[index]['image'] == []
                                ? assetName + 'default.png'
                                : assetName + userList[index]['image']),
                      ),
                      title: Text(userList[index]['username']),
                      subtitle: Text(userList[index]['linename']),
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
                        caption: 'Re Pass',
                        color: Colors.grey.shade200,
                        icon: Icons.lock_open,
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => UserEditPage(
                          //         userID: userList[index]['index']),
                          //   ),
                          // );
                        },
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UserAddPage()),
        ),
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterTop,
    );
  }
}
