import 'package:flutter/material.dart';
import 'package:ytclone/HomeTab.dart';

class TabView extends StatefulWidget {
  @override
  _TabViewState createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {
  int selectedTab=2;

  @override
  Widget build(BuildContext context) {
    Widget body=Container();
    if(selectedTab==0)body=HomeTab();
    return Scaffold(
      body: body,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor:  Color(0xFF6200EE),
        unselectedItemColor: Colors.deepOrange,
        selectedItemColor: Colors.blue,
        currentIndex: selectedTab,
        onTap: (value){setState(() {
            selectedTab=value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "home"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "home",
          ),
        ],
      ),
    );
  }
}
