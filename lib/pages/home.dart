import 'package:ece/scoped-models/main.dart';
import 'package:ece/widgets/routine/routine.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class HomePage extends StatefulWidget {
  HomePage();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageState();
  }
}

Widget _buildRoutineList() {
  return ScopedModelDescendant<MainModel>(
    builder: (BuildContext context, Widget child, MainModel model) {
      Widget content = Center(child: Text("No routine available for today"));

      if (model.routine != null &&
          model.routine.length > 0 &&
          model.isLoading == false) {
        content = Routines();
      } else if (model.isLoading) {
        content = Center(child: CircularProgressIndicator());
      }

      return content;
    },
  );
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Schedule"),
      ),
      body: _buildRoutineList(),
    );
  }
}
