import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instargramdemo/screen/scr_account.dart';
import 'package:instargramdemo/screen/scr_home.dart';
import 'package:instargramdemo/screen/scr_search.dart';

class TabPage extends StatefulWidget {

  final AuthCredential credential;
  TabPage(this.credential);

  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int _selectedIndex = 0;

  List? _pages;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _pages = [
      HomePage(widget.credential),
      SearchPage(widget.credential),
      AccountPage(widget.credential),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _pages![_selectedIndex],),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.black,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
