import 'package:ece/pages/addNotice.dart';
import 'package:ece/pages/anyRoutine.dart';
import 'package:ece/pages/dashboard.dart';
import 'package:ece/pages/notices.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import './pages/auth.dart';
import './pages/profile.dart';
import './scoped-models/main.dart';
import './pages/home.dart';

void main() {
  runApp(MyApp());
  return;
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  MainModel _model = MainModel();
  bool _isAuthenticated = false;

  @override
  void initState() {
    // TODO: implement initState
    _model.autoAuth();
    //print(_model.user.name);
    _model.userSubject.listen((bool isAuthenticated) {
      setState(() {
        _isAuthenticated = isAuthenticated;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //MainModel model = MainModel();
    return ScopedModel(
        model: _model,
        child: MaterialApp(
          theme: ThemeData(
              primarySwatch: Colors.red,
              accentColor: Colors.yellow,
              brightness: Brightness.light),

          routes: {
            '/': (BuildContext context) =>
                _isAuthenticated ? DashboardPage() : AuthPage(),
            '/dashboard': (BuildContext context) => DashboardPage(
                  title: 'Flutter Sample',
                ),
            '/profile': (BuildContext context) => ProfilePage(),
            '/home': (BuildContext context) => HomePage(),
            '/anyRoutine': (BuildContext context) => AnyRoutinePage(),
            '/addNotice': (BuildContext context) => AddNoticePage(),
            '/notices': (BuildContext context) => NoticesPage(
                  fetchNotice: _model.fetchNotice,
                )
          },
          // onGenerateRoute: (RouteSettings settings) {
          //   final List<String> pathElement = settings.name.split('/');
          //   if (pathElement[0] != '') return null;
          //   if (pathElement[1] == 'product') {
          //     final int index = int.parse(pathElement[2]);
          //     return MaterialPageRoute<bool>(
          //         builder: (BuildContext context) => ProductPage(index));
          //   }
          //   return null;
          // },
          // onUnknownRoute: (RouteSettings settings) {
          //   return MaterialPageRoute(
          //       builder: (BuildContext context) => ProductsPage());
          // },
        ));
  }
}
