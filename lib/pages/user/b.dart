// Gig
import 'package:flutter/material.dart';

class App04Gig extends StatefulWidget {
  @override
  _App04GigState createState() => _App04GigState();
}

class _App04GigState extends State<App04Gig> {
  int index = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text('สมุดลับ ห้ามเมียรู้'),
      ),
      body: Container(
        child: Column(
          children: [
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add, color: Colors.white),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.green,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'รายชื่อ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'โรงแรม',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank_outlined),
            label: 'ร้านอาหาร',
          ),
        ],
        currentIndex: index,
        onTap: (int i) {
          setState(() {
            index = i;
          });
        },
        selectedItemColor: Colors.amber[800],
      ),
    );
  }
}
