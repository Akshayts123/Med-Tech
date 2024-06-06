import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../home/home.dart';

class MyBottomNavBar extends StatefulWidget {
  @override
  _MyBottomNavBarState createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [    HomeScreen(),    Container(),    Container(),Container(),Container(),  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
     bottomNavigationBar:  BottomNavigationBar(
       showSelectedLabels: false,
        showUnselectedLabels: false,
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: "Home",
            tooltip: "Home",

            icon: SvgPicture.asset(
              "assets/images/house.svg",
              fit: BoxFit.cover,
              color: Colors.grey,
            ),
            activeIcon: SvgPicture.asset(
              "assets/images/house.svg",
              fit: BoxFit.cover,
              color:Theme.of(context).primaryColor,
            ),
          ),
          BottomNavigationBarItem(
            label: "Notification",
            icon: SvgPicture.asset(
              "assets/images/notification.svg",
              fit: BoxFit.cover,
              color: Colors.grey,
            ),
            activeIcon: SvgPicture.asset(
              "assets/images/notification.svg",
              fit: BoxFit.cover,
              color:Theme.of(context).primaryColor,
            ),
          ),
          BottomNavigationBarItem(
            label: "Forum",
            icon:  SvgPicture.asset(
              "assets/images/plus.svg",
              fit: BoxFit.cover,
              color: Colors.grey,
            ),
            activeIcon:SvgPicture.asset(
              "assets/images/plus.svg",
              fit: BoxFit.cover,
              color:Theme.of(context).primaryColor,
            ),
            // activeIcon: iconAssetImage("assets/icons/cart.png"),
          ),
          BottomNavigationBarItem(
            label: "Inbox",
            icon:  SvgPicture.asset(
              "assets/images/inbox.svg",
              fit: BoxFit.cover,
              color: Colors.grey,
            ),
            activeIcon:SvgPicture.asset(
              "assets/images/inbox.svg",
              fit: BoxFit.cover,
              color:Theme.of(context).primaryColor,
            ),
          ),
          BottomNavigationBarItem(
            label: "Bookmark",
            icon: SvgPicture.asset(
              "assets/images/user.svg",
              fit: BoxFit.cover,
              color: Colors.grey,
            ),
            activeIcon: SvgPicture.asset(
              "assets/images/user.svg",
              fit: BoxFit.cover,
              color:Theme.of(context).primaryColor,
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
