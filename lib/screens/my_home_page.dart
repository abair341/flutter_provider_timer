import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_timer_provider/models/timer_info.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int a = 60;

  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (t) {
      var timerInfo = Provider.of<TimerInfo>(context, listen: false);
      timerInfo.setA();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("ok");
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider with Timer"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Timer"),
            Consumer<TimerInfo>(
              builder: (context, data, child) {
                print(data.getA());
                if (data.getA() <= 0) {
                  return Text("");
                } else {
                  return Text(data.getA().toString());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
