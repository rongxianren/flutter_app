import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChannelWidget extends StatefulWidget {
  @override
  State createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ChannelWidget> {
  static const platform =
      const MethodChannel("com.rongxianren.flutter_app/battery");
  String _batteryLevel = 'Unknow battery level';

  Future<Null> _getBatteryLevel() async {
    String batteryLevel;
    try {
      batteryLevel = 'Battery level at ${ await result}';
    } on PlatformException catch (e) {
      batteryLevel = "failed to get battery level: '${e.message}'.";
      print(e);
    }
    setState(() {
      _batteryLevel = batteryLevel;
    });
  }
  Future<int> result;
  @override
  void initState() {
    super.initState();
    result =  Future(getBatteryLevel);
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              child: Text('Get Battery Level'),
              onPressed: _getBatteryLevel,
            ),
            Text(_batteryLevel),
          ],
        ),
      ),
    );
  }

  Future<int> getBatteryLevel() async{
    return platform.invokeMethod('getBatteryLevel');
  }
}
