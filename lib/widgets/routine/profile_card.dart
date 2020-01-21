import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:ece/scoped-models/main.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return Container(
          width: 600,
          height: 180,
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
                      model.user
                          .image, //sets image path, it should be a URL string. default value is empty string, if path is empty it will display only initials
                      radius: 45, // sets radius, default 50.0
                      backgroundColor: Colors
                          .transparent, // sets background color, default Colors.white
                      borderWidth: 4, // sets border, default 0.0
                      // sets initials text, set your own style, default Text('')
                      borderColor: Color.fromRGBO(1, 127, 22,
                          1.0), // sets border color, default Colors.white
                      elevation:
                          5.0, // sets elevation (shadow of the profile picture), default value is 0.0
                      foregroundColor: Color.fromRGBO(101, 233, 72, 1.0)
                          .withOpacity(
                              0), //sets foreground colour, it works if showInitialTextAbovePicture = true , default Colors.transparent
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
                          model.user.name,
                          style: TextStyle(
                              color: Color.fromRGBO(227, 0, 34, 1.0),
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'),
                        ),
                      ),
                      SizedBox(height: 7.0),
                      Container(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Text(
                          model.user.designation,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 13.0,
                              fontFamily: 'Montserrat'),
                        ),
                      ),
                      SizedBox(height: 7.0),
                      Container(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Text(
                          "Electronics And Communicstion Engineering",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 13.0,
                              fontFamily: 'Montserrat'),
                        ),
                      ),
                      SizedBox(height: 7.0),
                      Container(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Text(
                          model.user.email,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 13.0,
                              fontFamily: 'Montserrat'),
                        ),
                      ),
                      SizedBox(height: 7.0),
                      Container(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Text(
                          model.user.mob,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 13.0,
                              fontFamily: 'Montserrat'),
                        ),
                      ),
                      SizedBox(height: 7.0),
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
