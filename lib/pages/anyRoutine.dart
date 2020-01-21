import 'package:ece/scoped-models/main.dart';
import 'package:ece/widgets/routine/anyRoutine.dart';
import 'package:ece/widgets/routine/routine.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class AnyRoutinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AnyRoutinePageState();
  }
}

Widget _buildRoutineList() {
  return ScopedModelDescendant<MainModel>(
    builder: (BuildContext context, Widget child, MainModel model) {
      Widget content = Center(child: Text("No routine available for today"));

      print(model.anyRoutine);

      if (model.anyRoutine != null &&
          model.anyRoutine.length > 0 &&
          model.isLoading == false) {
        content = anyRoutines();
      } else if (model.isLoading) {
        content = Center(child: CircularProgressIndicator());
      }

      return content;
    },
  );
}

class _AnyRoutinePageState extends State<AnyRoutinePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Routine"),
        ),
        body: _buildRoutineList());
  }
}
