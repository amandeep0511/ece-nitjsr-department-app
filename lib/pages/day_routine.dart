import 'package:flutter/material.dart';
import '../models/auth.dart';

import '../scoped-models/main.dart';
import 'package:scoped_model/scoped_model.dart';

class DayRoutine extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DayRoutineState();
  }
}

class _DayRoutineState extends State<DayRoutine> {
  final Map<String, dynamic> _formData = {
    'time': null,
    'subject': null,
    'day': null,
    'year': null,
    'sem': null
  };
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  DecorationImage _buildBackgroundImage() {
    return DecorationImage(
      fit: BoxFit.cover,
      image: AssetImage('assets/background.jpg'),
    );
  }

  Widget _buildSubjectTextFiled() {
    return TextFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          prefixStyle:
              TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
          labelText: "Subject",
          filled: true,
          fillColor: Colors.white),
      keyboardType: TextInputType.text,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please enter a valid Subject';
        }
      },
      onSaved: (String value) {
        _formData['subject'] = value;
      },
    );
  }

  Widget _buildYearTextFiled() {
    return TextFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          labelText: "Year",
          filled: true,
          fillColor: Colors.white),
      keyboardType: TextInputType.text,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please enter a valid Year';
        }
      },
      onSaved: (String value) {
        _formData['year'] = value;
      },
    );
  }

  Widget _buildSemTextField() {
    return TextFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          labelText: "Sem",
          filled: true,
          fillColor: Colors.white),
      keyboardType: TextInputType.text,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please enter your semester';
        }
      },
      onSaved: (String value) {
        _formData['sem'] = value;
      },
    );
  }

  Widget _buildDayTextFiled() {
    return TextFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          labelText: "Day",
          filled: true,
          fillColor: Colors.white),
      keyboardType: TextInputType.emailAddress,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please enter a valid Day';
        }
      },
      onSaved: (String value) {
        _formData['day'] = value;
      },
    );
  }

  Widget _buildTimeTextFiled() {
    return TextFormField(
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.timer),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          labelText: "Time",
          filled: true,
          fillColor: Colors.white),
      keyboardType: TextInputType.datetime,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please enter valid time';
        }
      },
      onSaved: (String value) {
        _formData['time'] = value;
      },
    );
  }

  Map<String, String> _selectedLocation;

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

  Widget _buildFacultyDropDown() {
    return DropdownButton(
      hint:
          Text("Please Select the Faculty name"), // Not necessary for Option 1
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
    );
  }

  List<String> _days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'];
  List<String> _semester = [
    '1st',
    '2nd',
    '3rd',
    '4th',
    '5th',
    '6th',
    '7th',
    '8th'
  ];
  List<String> _year = ['First', 'Second', 'Third', 'Fourth'];
  String _selectedDay;
  String _selectedYear;
  String _selectedSemester;

  Widget _buildDayDropDown() {
    return DropdownButton(
      hint: Text("Please Select the Day"), // Not necessary for Option 1
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
    );
  }

  Widget _buildSemesterDropDown() {
    return DropdownButton(
      hint: Text("Please Select the Semester"), // Not necessary for Option 1
      value: _selectedSemester,
      onChanged: (newValue) {
        setState(() {
          _selectedSemester = newValue;
          print(_selectedDay);
        });
      },
      items: _semester.map((String location) {
        return new DropdownMenuItem<String>(
          child: new Text(location),
          value: location,
        );
      }).toList(),
    );
  }

  Widget _buildYearDropDown() {
    return DropdownButton(
      hint: Text("Please Select the Year"), // Not necessary for Option 1
      value: _selectedYear,
      onChanged: (newValue) {
        setState(() {
          _selectedYear = newValue;
          print(_selectedYear);
        });
      },
      items: _year.map((String location) {
        return new DropdownMenuItem<String>(
          child: new Text(location),
          value: location,
        );
      }).toList(),
    );
  }

  void _submitForm(Function addRoutine) async {
    if (!_formKey.currentState.validate()) return;
    _formKey.currentState.save();

    print("1st case passed");

    await addRoutine(_formData['subject'], _selectedDay, _formData['time'],
        _selectedSemester, _selectedYear, _selectedLocation['id']);

    //Navigator.of(context).pushReplacementNamed('/dashboard');

    print("@nd passed");
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;

    double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(image: _buildBackgroundImage()),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
              // decoration: BoxDecoration(image: _buildBackgroundImage()),
              padding: EdgeInsets.all(10.0),
              child: Center(
                  child: SingleChildScrollView(
                      child: Container(
                width: targetWidth,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Title(
                        child: Text("Add/Update Subject to Routine",
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold)),
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      _buildFacultyDropDown(),
                      _buildDayDropDown(),
                      SizedBox(
                        height: 10.0,
                      ),
                      _buildTimeTextFiled(),
                      SizedBox(
                        height: 10.0,
                      ),
                      _buildSubjectTextFiled(),
                      SizedBox(
                        height: 10.0,
                      ),
                      _buildYearDropDown(),
                      SizedBox(
                        height: 10.0,
                      ),
                      _buildSemesterDropDown(),
                      SizedBox(
                        height: 10.0,
                      ),
                      //_buildSwitchTile(),
                      ScopedModelDescendant<MainModel>(
                        builder: (BuildContext context, Widget child,
                            MainModel model) {
                          return model.isLoading
                              ? CircularProgressIndicator()
                              : ButtonTheme(
                                  minWidth: 200.0,
                                  height: 15.0,
                                  padding: const EdgeInsets.all(20.0),
                                  child: RaisedButton(
                                    child: Text(
                                      'Submit',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    color: Colors.blue,
                                    splashColor: Colors.blueGrey,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0)),
                                    onPressed: () {
                                      _submitForm(model.addRoutine);
                                    },
                                  ));
                        },
                      )
                    ],
                  ),
                ),
              ))))),
    );
  }
}
