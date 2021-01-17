import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:analog_clock/analog_clock.dart';
import 'package:intl/intl.dart';
import 'setup.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Clock(),
  ));
}

class Clock extends StatefulWidget {
  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  bool isSwitchedLeft = false;
  bool isSwitchedRight = false;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedTime = DateFormat('hh:mm').format(now);
    String formattedDate = DateFormat('EEEE, d MMMM', 'en_US').format(now);
    double bottomwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          //Analog Clock
          Container(
            margin: EdgeInsets.fromLTRB(0, 115, 0, 40),
            height: 230.0,
            child: AnalogClock(
              decoration: BoxDecoration(),
              isLive: true,
              hourHandColor: Colors.black,
              minuteHandColor: Colors.black,
              showSecondHand: true,
              numberColor: Colors.black,
              showNumbers: true,
              textScaleFactor: 1.6,
              showTicks: true,
              showDigitalClock: false,
            ),
          ),

          //Current Time
          Container(
            child: Text(
              formattedTime,
              style: TextStyle(
                fontSize: 60.0,
              ),
            ),
          ),

          //Current Date
          Container(
            child: Text(
                formattedDate,
                style: TextStyle(
                  fontSize: 25.0,
                )
            ),
          ),

          //Container
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(1),
                    spreadRadius: 10,
                    blurRadius: 200,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
              padding: EdgeInsets.fromLTRB(0, 45, 0, 40),
              width: bottomwidth,
              height: 50.0,

              //Row for buttons
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  //Button #1
                  FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Setup()),
                      );
                    },
                    minWidth: 160.0,
                    padding: EdgeInsets.fromLTRB(3, 16, 0, 0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      side: BorderSide(
                          color: Colors.grey,
                          width: 2
                      ),
                    ),

                    //Things inside of the 1st box
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [

                            //Time for the set alarm
                            Text(
                              '06:00',
                              style: TextStyle(
                                fontSize: 30,
                              ),
                            ),

                            //AM or PM
                            Text(
                              'AM',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),

                        //Repeat Weekly
                        Row(
                          children: [
                            Text(
                                'MTWTFSS',
                              style: TextStyle(
                                fontSize: 15,
                                letterSpacing: 6,
                              ),
                            ),
                          ],
                        ),

                        //Slider on/off
                        Row(
                          children: [
                            Switch(
                              activeColor: Colors.white,
                              inactiveThumbColor: Colors.white,
                              activeTrackColor: Colors.lightBlueAccent,
                              value: isSwitchedLeft,
                              onChanged: (value){
                                setState(() {
                                  isSwitchedLeft = value;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),

                  //button #2
                  FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Setup()),
                      );
                    },
                    minWidth: 160.0,
                    padding: EdgeInsets.fromLTRB(3, 16, 0, 0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      side: BorderSide(
                          color: Colors.grey,
                          width: 2,
                      ),
                    ),

                    //Things inside of the 2nd box
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [

                            //Time for set alarm
                            Text(
                              '05:00',
                              style: TextStyle(
                                fontSize: 30,
                              ),
                            ),

                            //AM or PM
                            Text(
                              'PM',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),

                        //Weekly repeat
                        Row(
                          children: [
                            Text(
                              'MTWTFSS',
                              style: TextStyle(
                                fontSize: 15,
                                letterSpacing: 6,
                              ),
                            ),
                          ],
                        ),

                        //Slider on/off
                        Row(
                          children: [
                            Switch(
                              activeColor: Colors.white,
                              inactiveThumbColor: Colors.white,
                              activeTrackColor: Colors.lightBlueAccent,
                              value: isSwitchedRight,
                              onChanged: (value){
                                setState(() {
                                  isSwitchedRight = value;
                                });
                               },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

