import 'package:auto_size_text/auto_size_text.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:ece/models/routine.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RoutineCard extends StatelessWidget {
  final Routine routine;
  final int index;
  final String day;
  RoutineCard(this.routine, this.index, this.day);

  @override
  Widget build(BuildContext context) {
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
            Container(
                padding: EdgeInsets.only(
                    left: 5.0, top: 5.0, bottom: 5.0, right: 10.0),
                child: CircularProfileAvatar(
                  'https://avatars0.githubusercontent.com/u/8264639?s=460&v=4', //sets image path, it should be a URL string. default value is empty string, if path is empty it will display only initials
                  radius: 45, // sets radius, default 50.0
                  backgroundColor: Colors
                      .transparent, // sets background color, default Colors.white
                  borderWidth: 10, // sets border, default 0.0
                  initialsText: Text(
                    day.substring(0, 3).toUpperCase(),
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ), // sets initials text, set your own style, default Text('')
                  borderColor: Color.fromRGBO(1, 127, 22,
                      1.0), // sets border color, default Colors.white
                  elevation:
                      5.0, // sets elevation (shadow of the profile picture), default value is 0.0
                  foregroundColor: Color.fromRGBO(101, 233, 72, 1.0).withOpacity(
                      1), //sets foreground colour, it works if showInitialTextAbovePicture = true , default Colors.transparent
                  cacheImage:
                      true, // allow widget to cache image against provided url
                  onTap: () {
                    print('adil');
                  }, // sets on tap
                  showInitialTextAbovePicture:
                      true, // setting it true will show initials text above profile picture, default false
                )),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 5.0),
                    child: Text(
                      routine.subject,
                      style: TextStyle(
                          color: Color.fromRGBO(227, 0, 34, 1.0),
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat'),
                    ),
                  ),
                  SizedBox(height: 7.0),
                  Row(
                    children: <Widget>[
                      Flexible(
                          child: Text(
                            routine.time,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Color.fromRGBO(105, 105, 105, 1.0),
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat'),
                          ),
                          fit: FlexFit.tight),
                      Flexible(
                        child: Text(
                          'Year : ${routine.year}',
                          //textAlign: TextAlign.right,
                          style: TextStyle(
                              color: Color.fromRGBO(105, 105, 105, 1.0),
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'),
                        ),
                        fit: FlexFit.tight,
                      ),
                      SizedBox(height: 7.0),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Flexible(
                          child: Text(
                            'Semester : ${routine.sem}',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Color.fromRGBO(105, 105, 105, 1.0),
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat'),
                          ),
                          fit: FlexFit.tight),
                      Flexible(
                        child: Text(
                          'Branch : ECE',
                          //textAlign: TextAlign.right,
                          style: TextStyle(
                              color: Color.fromRGBO(105, 105, 105, 1.0),
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'),
                        ),
                        fit: FlexFit.tight,
                      ),
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
  }
}
