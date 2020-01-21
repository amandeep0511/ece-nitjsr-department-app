import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:intl/intl.dart';

import '../../scoped-models/main.dart';
import '../../models/notice.dart';
import './notice_card.dart';

class Notices extends StatelessWidget {
  Widget _buildNoticeList(List<Notice> notices) {
    DateTime date = DateTime.now();
    String day = DateFormat('EEEE').format(date);
    Widget noticeCards = Center(
      child: Text("No routine currently available"),
    );

    if (notices.length > 0) {
      noticeCards = ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return NoticeCard(notices[index], index);
        },
        itemCount: notices.length,
      );
    }

    return noticeCards;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return _buildNoticeList(model.notices);
      },
    );
  }
}
