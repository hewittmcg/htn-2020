import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:analog_clock/analog_clock.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Setup(),
  ));
}

class Setup extends StatefulWidget {
  Setup({Key key}) : super(key: key);

  @override
  _SetupState createState() => _SetupState();
}

class _SetupState extends State<Setup> {
  String dropdownValue = '1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(50, 200, 0, 0),
                  padding: EdgeInsets.fromLTRB(40, 30, 20, 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    border: Border.all(
                      color: Colors.grey[800],
                      width: 2,
                    )
                  ),
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    iconSize: 0,
                    elevation: 16,
                    underline: SizedBox(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: <String>['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12',]
                      .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 200, 0, 0),
                color: Colors.green[200],
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        //Monday
                        FlatButton(
                          onPressed: () {

                          },
                          minWidth: 10,
                          color: Colors.blue,
                          child: Text(
                            'M',
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                        ),

                        //Tuesday
                        FlatButton(
                          onPressed: () {

                          },
                          minWidth: 10,
                          color: Colors.blue,
                          child: Text(
                            'T',
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                        ),

                        //Wednesday
                        FlatButton(
                          onPressed: () {

                          },
                          minWidth: 10,
                          color: Colors.blue,
                          child: Text(
                            'W',
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                        ),

                        //Thursday
                        FlatButton(
                          onPressed: () {

                          },
                          minWidth: 10,
                          color: Colors.blue,
                          child: Text(
                            'T',
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                        ),

                        //Friday
                        FlatButton(
                          onPressed: () {

                          },
                          minWidth: 10,
                          color: Colors.blue,
                          child: Text(
                            'F',
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                        ),

                        //Saturday
                        FlatButton(
                          onPressed: () {

                          },
                          minWidth: 10,
                          color: Colors.blue,
                          child: Text(
                            'S',
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                        ),

                        //Sunday
                        FlatButton(
                          onPressed: () {

                          },
                          minWidth: 10,
                          color: Colors.blue,
                          child: Text(
                            'S',
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
    );
  }
}
