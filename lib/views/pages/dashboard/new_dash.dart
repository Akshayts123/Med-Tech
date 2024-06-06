
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medtech/views/pages/home/home.dart';

class NewDash extends StatefulWidget {
  const NewDash({Key? key}) : super(key: key);

  @override
  State<NewDash> createState() => _NewDashState();
}

class _NewDashState extends State<NewDash> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [    HomeScreen(),    Container(),    Container(),  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        // notchMargin: 8
        // ,
        notchMargin: 0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[

            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                setState(() {
                  _selectedIndex = 0;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                setState(() {
                  _selectedIndex = 1;
                });
              },
            ),
            SizedBox(width: 40.0),
            IconButton(
              icon: Icon(Icons.add_circle),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                setState(() {
                  _selectedIndex = 2;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
