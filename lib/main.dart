import 'dart:async';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple,
      child: CircleAvatar(
        backgroundImage: AssetImage('assets/images/insomnapp.png'),
        radius: 70.0,
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: Text("Insomniapp"),
          //backgroundColor: Colors.grey[850],
          elevation: 0.0,
        ),
        // ignore: deprecated_member_use
        body: Center(
          // ignore: deprecated_member_use
          child: Row(
            children: [
              // ignore: deprecated_member_use

              // ignore: deprecated_member_use
              Column(
                children: <Widget> [
                  // ignore: deprecated_member_use
                  RaisedButton(
                    child: Text('Self Diagnosis'),
                    color: Colors.orangeAccent,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SecondRoute()),
                      );
                    },
                  ),

                  // ignore: deprecated_member_use
                  RaisedButton(
                    child: Text('Contact Psychiatrist'),
                    color: Colors.orangeAccent,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Contact()),
                      );
                    },
                  ),
                  // ignore: deprecated_member_use
                  RaisedButton(
                    child: Text('Play White noise'),
                    color: Colors.orangeAccent,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Contact()),
                      );
                    },
                  ),
                ],

                // ignore: deprecated_member_use
              ),

              // ignore: deprecated_member_use
            ],
          ),
        ));
  }
}

class SecondRoute extends StatefulWidget {
  @override
  _SecondRouteState createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  bool _checkbox = false;
  bool _checkboxListTile = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.grey[900],

        appBar: AppBar(
          title: Text("Self Diagnosis"),
          //backgroundColor: Colors.grey[850],
          elevation: 0.0,
        ),
        body: Center(
          child: Column(
            children: [
              Row(
                children: [
                  Text('Check what you do below:\n\n'),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: _checkbox,
                    onChanged: (value) {
                      setState(() {
                        _checkbox = !_checkbox;
                      });
                    },
                  ),
                  Text(
                    'Take Coffee before sleeping',
                    //style: TextStyle(color : Colors.white),
                  ),
                ],
              ),
              // ignore: deprecated_member_use

              CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: Text('Drink Alcohol'),
                value: _checkboxListTile,
                onChanged: (value) {
                  setState(() {
                    _checkboxListTile = !_checkboxListTile;
                  });
                },
              ),
              Row(
                children: [
                  // ignore: deprecated_member_use
                  RaisedButton(
                    color: Colors.orangeAccent,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Go back'),
                  ),
                ],
              ),
            ],

            // ignore: deprecated_member_use
          ),
        ));
  }
}

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  void customLaunch(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print(' could not launch $command');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey[900],

      appBar: AppBar(
        title: Text("Contacts"),
        //backgroundColor: Colors.grey[850],
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          // ignore: deprecated_member_use
          RaisedButton(
            onPressed: () {
              customLaunch('https://google.com');
            },
            child: Text('Website'),
          ),
          // ignore: deprecated_member_use
          RaisedButton(
            onPressed: () {
              customLaunch(
                  'mailto:allankosgei747@gmail.com?subject=test%20subject&body=test%20body');
            },
            child: Text('Email'),
          ),
          // ignore: deprecated_member_use
          RaisedButton(
            onPressed: () {
              customLaunch('tel:+254727880227');
            },
            child: Text('Phone'),
          ),
          // ignore: deprecated_member_use
          RaisedButton(
            onPressed: () {
              customLaunch('sms:0727880227');
            },
            child: Text('SMS'),
          ),
        ],
      ),
    );
  }
}
