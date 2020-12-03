import 'package:analog_clock/analog_clock.dart';
import 'package:flutter/material.dart';

class clock extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnalogClock(
          decoration: BoxDecoration(
              border: Border.all(width: 3.0, color: Colors.black),
              color: Colors.black,
              shape: BoxShape.circle),
          width: 300.0,
          height: 300.0,
          isLive: true,
          hourHandColor: Colors.white,
          minuteHandColor: Colors.white,
          showSecondHand: true,
          numberColor: Colors.white,
          showNumbers: true,
          textScaleFactor: 1.5,
          showTicks: true,
          datetime: DateTime(2020, 8, 4, 9, 11, 0),
        ),
      ),
    ),
  );
}
