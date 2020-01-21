import 'package:flutter/material.dart';

class Routine {
  final String userId;
  final String day;
  final String subject;
  final String time;
  final String year;
  final String sem;

  Routine({
    @required this.userId,
    @required this.subject,
    @required this.time,
    @required this.day,
    @required this.year,
    @required this.sem,
  });
}
