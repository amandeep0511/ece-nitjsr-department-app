import 'dart:async';

import 'package:ece/widgets/routine/notices.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scoped-models/main.dart';
import '../models/notice.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NoticesPage extends StatefulWidget {
  final Function fetchNotice;
  NoticesPage({this.fetchNotice});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NoticesPageState();
  }
}

class _NoticesPageState extends State<NoticesPage> {
  @override
  initState() {
    super.initState();
    DateTime date = DateTime.now();
    String getDate = DateFormat("dd-MM-yyyy").format(date);
    widget.fetchNotice(getDate);
  }

  Widget _buildNoticeList() {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        Widget content = Center(child: Text("No notice available for today"));

        DateTime date = DateTime.now();
        String getDate = DateFormat("dd-MM-yyyy").format(date);

        print(model.notices.length);

        if (model.notices != null &&
            model.notices.length > 0 &&
            model.isLoading == false) {
          content = Notices();
        } else if (model.isLoading) {
          content = Center(child: CircularProgressIndicator());
        }

        return content;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Notices")),
      body: _buildNoticeList(),
    );
    _buildNoticeList();
  }
}
