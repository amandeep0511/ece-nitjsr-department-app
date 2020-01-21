import 'package:ece/widgets/routine/routine_card.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:intl/intl.dart';

import '../../scoped-models/main.dart';
import '../../models/routine.dart';

class Routines extends StatelessWidget {
  Widget _buildRoutineList(List<Routine> routines) {
    DateTime date = DateTime.now();
    String day = DateFormat('EEEE').format(date);
    Widget routineCards = Center(
      child: Text("No routine currently available"),
    );

    if (routines.length > 0) {
      routineCards = ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return RoutineCard(routines[index], index, day);
        },
        itemCount: routines.length,
      );
    }

    return routineCards;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return _buildRoutineList(model.routine);
      },
    );
  }
}
