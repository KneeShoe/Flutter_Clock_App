import 'package:clock_mad_proj/stopWatch.dart';
import 'package:clock_mad_proj/timer1.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

import 'Clock.dart';
import 'Timer.dart';

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int _pageIndex = 0;
  PageController _pageController;

  List<Widget> tabPages = [
    clock(),
    CountDownTimer(),
    stopWatch(),
  ];

  @override
  void initState(){
    super.initState();
    _pageController = PageController(initialPage: _pageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("The Clock", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.lightBlue,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageIndex,
        onTap: onTabTapped,
        backgroundColor: Colors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.watch_later),
            title: Text("Analog Clock"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_alarm),
            title: Text("Timer"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.watch),
            title: Text("Stopwatch"),
          ),
        ],

      ),
      body: PageView(
        children: tabPages,
        onPageChanged: onPageChanged,
        controller: _pageController,
      ),
    );
  }
  void onPageChanged(int page) {
    setState(() {
      this._pageIndex = page;
    });
  }

  void onTabTapped(int index) {
    this._pageController.animateToPage(index,duration: const Duration(milliseconds: 500),curve: Curves.easeInOut);
    log(index.toString());
  }
}