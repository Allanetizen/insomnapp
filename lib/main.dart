import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:tflite/tflite.dart';
import 'package:flutter/services.dart';

void main() => runApp(MaterialApp(
      home: MyId(),
    ));

class MyId extends StatelessWidget {
  bool _myBoolean = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('User Avatar'),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
      ),

      body: Row(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                Center(
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/child.jpg'),
                    radius: 70.0,
                  ),

                ),
                Divider(
                  height: 60.0,
                  color: Colors.black,
                ),
                Text(
                  'NAME',
                  style: TextStyle(
                    color: Colors.grey,
                    letterSpacing: 2.0,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Allan',
                  style: TextStyle(
                    color: Colors.amberAccent[200],
                    letterSpacing: 2.0,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30.0),
                Text(
                  'AGE',
                  style: TextStyle(
                    color: Colors.grey,
                    letterSpacing: 2.0,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  '22',
                  style: TextStyle(
                    color: Colors.amberAccent[200],
                    letterSpacing: 2.0,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <widget>[
                    TextField(
                      autofocus: False,

                    ),
                    RaisedButton(
                      onPressed(){
                        Navigator.of(context) => Options()
                    }
                    )

                  ]
                ),
                Center(
                  child: ElevatedButton(
                    child: Text('Self diagnose'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Options()),
                      );
                    },
                  ),
                ),


              ],
            ),
          ),
        ],
      ),

    );
  }
}




// ignore: must_be_immutable

