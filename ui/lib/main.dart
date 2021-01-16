import 'package:flutter/material.dart';
import 'package:analog_clock/analog_clock.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Clock(),
    );
  }
}

class Clock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedTime = DateFormat('hh:mm').format(now);
    String formattedDate = DateFormat('EEEE, d MMMM', 'en_US').format(now);

    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 150, 0, 40),
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

          Container(
            child: Text(
              formattedTime,
              style: TextStyle(
                fontSize: 50.0,
              ),
            ),
          ),

          Container(
            child: Text(
                formattedDate,
                style: TextStyle(
                  fontSize: 25.0,
                )
            ),
          ),
        ],
      ),
    );
  }
}
