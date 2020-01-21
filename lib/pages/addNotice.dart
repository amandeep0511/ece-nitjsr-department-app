import 'package:ece/scoped-models/main.dart';

import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class AddNoticePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AddNoticePageState();
  }
}

class _AddNoticePageState extends State<AddNoticePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  DecorationImage _buildBackgroundImage() {
    return DecorationImage(
      fit: BoxFit.cover,
      image: AssetImage('assets/background.jpg'),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    String _subject;
    String _desc;

    Widget _buildNotifyCard() {
      return Container(
        width: 600,
        height: 250,
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
                  "Add Notice",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.blue),
                ),
                color: Colors.red,
              ),
              Form(
                  key: _formKey,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.timer),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                labelText: "Subject",
                                filled: true,
                                fillColor: Colors.white),
                            keyboardType: TextInputType.text,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Please enter valid Subject';
                              }
                            },
                            onSaved: (String value) {
                              _subject = value;
                            }),
                        TextFormField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.timer),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                labelText: "Description",
                                filled: true,
                                fillColor: Colors.white),
                            keyboardType: TextInputType.text,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Please enter Description';
                              }
                            },
                            onSaved: (String value) {
                              _desc = value;
                            }),
                        ScopedModelDescendant<MainModel>(
                          builder: (BuildContext context, Widget child,
                              MainModel model) {
                            return model.isLoading
                                ? CircularProgressIndicator(
                                    strokeWidth: 3.0,
                                    backgroundColor: Colors.blue,
                                  )
                                : RaisedButton(
                                    child: Text("Add Notice"),
                                    onPressed: () {
                                      if (!_formKey.currentState.validate())
                                        return;
                                      _formKey.currentState.save();

                                      model
                                          .addNotice(_subject, _desc)
                                          .then((result) {
                                        print(_subject);
                                        print(_desc);
                                        //Navigator.of(context).pushNamed('/anyRoutine');
                                      });
                                    },
                                  );
                          },
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Notice"),
      ),
      backgroundColor: Colors.yellow,
      body: _buildNotifyCard(),
    );
  }
}
