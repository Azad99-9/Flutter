import 'package:flutter/material.dart';
import 'package:sample/pages/profile.dart';
import 'package:sample/classes/designSystem.dart';
import 'package:sample/pages/explore.dart';
import 'package:sample/pages/notifications.dart';
import 'package:sample/pages/home.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late int _currentIndex;
  late Widget _currentPage;
  List<Widget> _pages = [];

  void initState() {
    super.initState();

    _pages
      ..add(home())
      ..add(Notifications())
      ..add(Explore())
      ..add(Profile());
    _currentIndex = 3;
    _currentPage = _pages[_currentIndex];
  }

  void _changePage(int index) {
    setState(() {
      _currentIndex = index;
      _currentPage = _pages[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: _currentPage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: iconColor,
            ),
            backgroundColor: compColor,
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications_outlined,
              color: iconColor,
            ),
            backgroundColor: compColor,
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.compass_calibration_outlined,
              color: iconColor,
            ),
            backgroundColor: compColor,
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle_outlined,
              color: iconColor,
            ),
            backgroundColor: compColor,
            label: 'Profile',
          ),
        ],
        onTap: (selectedIndex) => _changePage(selectedIndex),
      ),
    );
  }

  Column bottomAppBarItem(String text, IconData icoon) {
    return Column(
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              icoon,
              color: cardColor,
              size: 20,
            )),
        Text(
          text,
          style: TextStyle(
            fontSize: 13,
            color: cardColor,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
