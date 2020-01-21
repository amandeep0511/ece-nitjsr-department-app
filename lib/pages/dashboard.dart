import 'package:ece/pages/about.dart';
import 'package:ece/pages/addNotice.dart';
import 'package:ece/pages/day_routine.dart';
import 'package:ece/pages/dropdown.dart';
import 'package:ece/pages/home.dart';
import 'package:ece/pages/notices.dart';
import 'package:ece/pages/profile.dart';
import 'package:ece/pages/routine.dart';
import 'package:ece/scoped-models/main.dart';
//import 'package:ece/pages/routine_card.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class DashboardPage extends StatefulWidget {
  Function fetchNotice;
  DashboardPage({Key key, this.title, this.fetchNotice}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<DashboardPage>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;

  TabController _tabController;

  List<Widget> _tabList = [
    Container(
      color: Colors.yellow,
      child: DropDownPage(),
    ),
    Container(
      color: Colors.red,
      child: AboutPage(),
    ),
    Container(
      color: Colors.purple,
      child: ProfilePage(),
    ),
    Container(
      color: Colors.purple,
      child: DayRoutine(),
    ),
    Container(
      color: Colors.purple,
      child: AddNoticePage(),
    )
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _tabList.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: _tabList,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: _currentIndex,
        onTap: (currentIndex) {
          setState(() {
            _currentIndex = currentIndex;
          });

          _tabController.animateTo(_currentIndex);
        },
        items: [
          BottomNavigationBarItem(
              title: Text("Home"),
              icon: Icon(Icons.home),
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              title: Text("About"),
              icon: Icon(Icons.info),
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              title: Text("Profile"),
              icon: Icon(Icons.person),
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              title: Text("Routine"),
              icon: Icon(Icons.table_chart),
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              title: Text("Notice"),
              icon: Icon(Icons.add),
              backgroundColor: Colors.black)
        ],
      ),
    );
  }
}
