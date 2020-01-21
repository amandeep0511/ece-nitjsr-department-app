import 'package:ece/pages/addNotice.dart';
import 'package:ece/pages/image_slider.dart';
import 'package:ece/scoped-models/main.dart';
import 'package:ece/widgets/routine/profile_card.dart';
import 'package:ece/widgets/routine/routine.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scoped_model/scoped_model.dart';

class DropDownPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DropDownPageState();
  }
}

class _DropDownPageState extends State<DropDownPage> {
  String dropdownValue = 'Select Day';
  String dropdownValueT = 'Select Faculty';

  List<String> _days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday'
  ]; // Option 2
  Map<String, String> _selectedLocation;

  String _selectedDay;

  List<Map<String, String>> userList = [
    {"name": "Dr. Prashant Kumar", "id": "8yA5WauUhFNFp2cAGY0UivBIpZL2"},
    {"name": "Dr. Swagatadeb Sahoo", "id": "5ZdOhjTt7uVKnJ0BpyGPTrhB1of1"},
    {"name": "Dr. Kunal Singh", "id": "29bnrdDpy0QUdxB0hPsUNGO5uWU2"},
    {"name": "Dr. Mrutyunjay Rout", "id": "2D0uODGvZbQ8jVHaIy9vZoyz3xJ3"},
    {"name": "Dr. Ajay Kumar", "id": "CrQnFNEZGtbzZ9FlEr4ah5dyHIU2"},
    {"name": "Dr. Basudeba Behera", "id": "M5W8gT2znph7upGM21Pd8MeJKzm2"},
    {"name": "Prof. S N Singh", "id": "S5yPm0qzgThrss33haDdZP2qw9p1"},
    {"name": "Dr. Akhilesh Kumar", "id": "VxNY8TGJnpcmw2NZLfIvW1McqbY2"},
    {"name": "Dr. Dilip Kumar", "id": "XLWq2cwEaKSjaQ3wE6lWXgfm53V2"},
    {"name": "Mr. Amit Prakash", "id": "XjepQAQtKzMJS0HAqlPmbg4f2KP2"},
    {"name": "Dr. Nagendra Kumar", "id": "bXGiG1IpsjSVcJ348lfcECyy5pi1"},
    {"name": "Dr. Basanta Bhowmik", "id": "gzWy8baVdtgaR6H1eCp7IjOAdE23"},
    {"name": "Dr. Rashmi Sinha", "id": "h5aTdNrANyYJ14nFH71iSU0VsbI3"},
    {"name": "Dr. Jayendra Kumar", "id": "hUCpVnMoP5WYd7Ltf5AzTAcCOS03"},
    {"name": "Dr. Mayank Srivastava", "id": "oSOxxzP9m5Ytr2DFNBZ47WpfGGw2"},
    {"name": "Mr Bhut Nath Singh Munda", "id": "uZXV58rWy8eUxskzMpI223N0JB13"},
  ];

  Widget getYourRoutineCard() {
    return Container(
      width: 600,
      height: 70,
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      margin: EdgeInsets.all(10.0),
      child: Material(
          elevation: 14.0,
          borderRadius: BorderRadius.circular(24.0),
          shadowColor: Colors.black,
          child: ListTile(
            title: Text(
              "Check Your Today's Schedule",
              style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.red,
                  fontWeight: FontWeight.bold),
            ),
            trailing: IconButton(
              icon: Icon(Icons.arrow_right),
              onPressed: () {
                Navigator.of(context).pushNamed('/home');
              },
            ),
          )),
    );
  }

  Widget buildGetRoutineCard() {
    return Container(
      width: 600,
      height: 180,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      margin: EdgeInsets.all(10.0),
      child: Material(
        elevation: 14.0,
        borderRadius: BorderRadius.circular(24.0),
        shadowColor: Colors.black,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            Title(
              child: Text(
                "Get Faculty Routine",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.blue),
              ),
              color: Colors.red,
            ),
            DropdownButton(
              hint: Text(
                  "Please Select the Faculty name"), // Not necessary for Option 1
              value: _selectedLocation,
              onChanged: (newValue) {
                setState(() {
                  _selectedLocation = newValue;
                  print(_selectedLocation);
                });
              },
              items: userList.map((Map<String, String> location) {
                return new DropdownMenuItem<Map<String, String>>(
                  child: new Text(location["name"]),
                  value: location,
                );
              }).toList(),
            ),
            DropdownButton(
              hint: Text(
                "Please Select the Day",
              ), // Not necessary for Option 1
              value: _selectedDay,
              onChanged: (newValue) {
                setState(() {
                  _selectedDay = newValue;
                  print(_selectedDay);
                });
              },
              items: _days.map((String location) {
                return new DropdownMenuItem<String>(
                  child: new Text(location),
                  value: location,
                );
              }).toList(),
            ),
            ScopedModelDescendant<MainModel>(
              builder: (BuildContext context, Widget child, MainModel model) {
                return model.isLoading
                    ? CircularProgressIndicator(
                        strokeWidth: 2.0,
                        backgroundColor: Colors.blue,
                      )
                    : RaisedButton(
                        child: Text("Get Routine"),
                        onPressed: () {
                          model
                              .fetchAnyRoutine(
                                  _selectedLocation["id"], _selectedDay)
                              .then((result) {
                            Navigator.of(context).pushNamed('/anyRoutine');
                          });
                        },
                      );
              },
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        title: Text("WELCOME"),
        actions: <Widget>[
          ScopedModelDescendant<MainModel>(
            builder: (BuildContext context, Widget child, MainModel model) {
              return IconButton(
                icon:
                    Icon(1 == 1 ? Icons.notifications : Icons.favorite_border),
                onPressed: () {
                  DateTime date = DateTime.now();
                  String getDate = DateFormat("dd-MM-yyyy").format(date);

                  Navigator.pushNamed(context, '/notices');
                },
              );
            },
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          // DropdownButton<String>(
          //   value: dropdownValue,
          //   icon: Icon(Icons.arrow_downward),
          //   iconSize: 24,
          //   elevation: 16,
          //   style: TextStyle(color: Colors.deepPurple),
          //   underline: Container(
          //     height: 2,
          //     color: Colors.deepPurpleAccent,
          //   ),
          //   onChanged: (String newValue) {
          //     setState(() {
          //       dropdownValue = newValue;
          //     });
          //   },
          //   items: <String>[
          //     'Monday',
          //     'Tuesday',
          //     'Wednesday',
          //     'Thursday',
          //     'Friday'
          //   ].map<DropdownMenuItem<String>>((String value) {
          //     return DropdownMenuItem<String>(
          //       value: value,
          //       child: Text(value),
          //     );
          //   }).toList(),
          // ),
          // DropdownButton<String>(
          //   value: dropdownValueT,
          //   icon: Icon(Icons.arrow_downward),
          //   iconSize: 24,
          //   elevation: 16,
          //   style: TextStyle(color: Colors.deepPurple),
          //   underline: Container(
          //     height: 2,
          //     color: Colors.deepPurpleAccent,
          //   ),
          //   onChanged: (String newValue) {
          //     setState(() {
          //       dropdownValue = newValue;
          //     });
          //   },
          //   items: <String>[
          //     'Prof. Shiva Nand Singh',
          //     'Prof. Arvind Choubey',
          //     'Dr. Akhilesh Kumar',
          //     'Dr. Rashmi Sinha',
          //     'Mr. Amit Prakash',
          //     'Mr. Bhut Nath Singh Munda',
          //     'Mr. Dilip Kumar',
          //     'Dr. Ajay Kumar',
          //     'Dr. Basanta Bhowmik',
          //     'Dr. Basudeba Behera',
          //     'Dr. Jayendra Kumar',
          //     'Dr. Kunal Singh',
          //     'Dr. Mayank Srivastava',
          //     'Dr. Mrutyunjay Rout',
          //     'Dr. Nagendra Kumar',
          //     'Dr. Prashant Kumar',
          //     'Dr. Swagatadeb Sahoo'
          //   ].map<DropdownMenuItem<String>>((String value) {
          //     return DropdownMenuItem<String>(
          //       value: value,
          //       child: Text(value),
          //     );
          //   }).toList(),
          // ),
          ImageSlider(),
          ProfileCard(),
          buildGetRoutineCard(),
          getYourRoutineCard()
        ],
      )),
    );
  }
}
