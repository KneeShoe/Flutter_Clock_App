import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown.dart';
import 'package:flutter_countdown_timer/countdown_controller.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_picker/Picker.dart';

class timer extends StatefulWidget {
  State createState() => new _timerState();
}

class _timerState extends State<timer> with TickerProviderStateMixin {
  static int endTime = 0;
  var startvals = new List(3);

  showPickerNumber(BuildContext context) {
    new Picker(
        adapter: NumberPickerAdapter(data: [
          NumberPickerColumn(
              begin: 0,
              end: 24,
              onFormatValue: (v) {
                return v < 10 ? "0$v" : "$v";
              }),
          NumberPickerColumn(
              begin: 0,
              end: 60,
              onFormatValue: (v) {
                return v < 10 ? "0$v" : "$v";
              }),
          NumberPickerColumn(
              begin: 0,
              end: 60,
              onFormatValue: (v) {
                return v < 10 ? "0$v" : "$v";
              }),
        ]),
        delimiter: [
          PickerDelimiter(
              child: Container(
                width: 30.0,
                alignment: Alignment.center,
                child: Icon(Icons.more_vert),
              ),
              column: 1),
          PickerDelimiter(
              child: Container(
                width: 30.0,
                alignment: Alignment.center,
                child: Icon(Icons.more_vert),
              ),
              column: 3)
        ],
        hideHeader: true,
        title: new Text("Please Select"),
        onConfirm: (Picker picker, List value) {
          startvals = picker.getSelectedValues();
          endTime = DateTime.now().millisecondsSinceEpoch +
              startvals[0] +
              startvals[1] * 60 +
              startvals[2] * 360;
          print(startvals);
          countdownController = CountdownController(
              duration: Duration(
                  hours: startvals[0],
                  minutes: startvals[1],
                  seconds: startvals[2]));
        }).showDialog(context);
  }

  CountdownController countdownController = CountdownController(
      duration: Duration(hours: 00, minutes: 00, seconds: 00));

  void setTime(BuildContext context) {
    showPickerNumber(context);
  }

  Widget buildItem(String title, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
          return page;
        }));
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        color: Colors.blue,
        width: double.infinity,
        alignment: Alignment.center,
        height: 100,
        child: Text(title, style: TextStyle(fontSize: 36),),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
          child: new Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
//                    CountdownTimer(
//                      endTime: endTime,
//                      widgetBuilder: (BuildContext context, CurrentRemainingTime time) {
//                        List<Widget> list = [];
//                        if(time.days != null) {
//                          list.add(Row(
//                            children: <Widget>[
//                              Icon(Icons.sentiment_dissatisfied),
//                              Text(time.days.toString()),
//                            ],
//                          ));
//                        }
//                        if(time.hours != null) {
//                          list.add(Row(
//                            children: <Widget>[
//                              Icon(Icons.sentiment_satisfied),
//                              Text(time.hours.toString()),
//                            ],
//                          ));
//                        }
//                        if(time.min != null) {
//                          list.add(Row(
//                            children: <Widget>[
//                              Icon(Icons.sentiment_very_dissatisfied),
//                              Text(time.min.toString()),
//                            ],
//                          ));
//                        }
//                        if(time.sec != null) {
//                          list.add(Row(
//                            children: <Widget>[
//                              Icon(Icons.sentiment_very_satisfied),
//                              Text(time.sec.toString()),
//                            ],
//                          ));
//                        }
//
//                        return Row(
//                          mainAxisAlignment: MainAxisAlignment.center,
//                          children: list,
//                        );
//                      },
//                    ),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      new RaisedButton(
                        onPressed: () {
                          setTime(context);
                        },
                        child: Text("Set Time"),
                      ),
                      new RaisedButton(
                        onPressed: () {
                          countdownController.start();
                        },
                        child: Text("Start Timer"),
                      ),
                      new RaisedButton(
                        onPressed: () {
                          countdownController.stop();
                        },
                        child: Text("Stop"),
                        color: Colors.red,
                      )
                    ],
                  )
          ]))),
    );
  }
}
