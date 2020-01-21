import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:ece/models/notice.dart';
import 'package:ece/scoped-models/main.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class NoticeCard extends StatelessWidget {
  final Notice notice;
  final int index;
  NoticeCard(this.notice, this.index);

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return Container(
          width: 120,
          height: 100,
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          margin: EdgeInsets.all(10.0),
          child: Material(
            elevation: 14.0,
            borderRadius: BorderRadius.circular(24.0),
            shadowColor: Colors.black,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Flexible(
                            child: Container(
                              padding: EdgeInsets.only(top: 5.0, left: 10.0),
                              child: Text(
                                notice.name,
                                style: TextStyle(
                                    color: Color.fromRGBO(227, 0, 34, 1.0),
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                          ),
                          Flexible(
                            child: Container(
                              padding: EdgeInsets.only(top: 5.0, left: 10.0),
                              child: Text(
                                notice.date,
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 7.0),
                      Row(
                        children: <Widget>[
                          Flexible(
                              child: Text(
                                "Subject: ${notice.subject}",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color.fromRGBO(105, 105, 105, 1.0),
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat'),
                              ),
                              fit: FlexFit.tight),
                          SizedBox(height: 7.0),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Flexible(
                              child: Text(
                                'Desciption : ${notice.desc}',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color.fromRGBO(105, 105, 105, 1.0),
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat'),
                              ),
                              fit: FlexFit.tight),
                          SizedBox(height: 7.0),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
