import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ParentWidgetState.dart';
import 'TapBoxA.dart';
import 'TapBoxC.dart';

class StatefulWidgetLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: <Widget>[
            Center(
              child: TapboxA(),
            ),
            Center(
              child: ParentWidget(),
            ),
            Center(
              child: ParentWidgetC(),
            ),
          ],
        ),
      ),
    );
  }
}
