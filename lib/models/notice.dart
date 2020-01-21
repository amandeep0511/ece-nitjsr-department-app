import 'package:flutter/material.dart';

class Notice {
  final String userId;
  final String date;
  final String subject;
  final String time;
  final String name;
  final String desc;

  Notice({
    @required this.userId,
    @required this.subject,
    @required this.time,
    @required this.name,
    @required this.date,
    @required this.desc,
  });
}
