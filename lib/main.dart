import 'package:flutter/material.dart';
import 'package:flutter_app/stateful_widget/ExampleEnter.dart';
import 'example1/FirstSimpleApp.dart';
import 'example2/LakeExample.dart';

void main() => runApp(EnterWidget());

final _biggerFont = const TextStyle(fontSize: 18.0);

class EnterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Enter',
      home: Builder(
          builder: (context) => Center(
                child: createItemList(context),
              )),
    );
  }

  Widget createItemList(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          new ListTile(
            title: new Text(
              'FirstSimpleApp',
              style: _biggerFont,
              textAlign: TextAlign.center,
            ),
            onTap: () {
              navigation(FirstSimpleApp(), context);
            },
          ),
          new ListTile(
            title: new Text(
              'LayoutSimpleApp',
              style: _biggerFont,
              textAlign: TextAlign.center,
            ),
            onTap: () {
              navigation(LayoutApp(), context);
            },
          ),
          new ListTile(
            title: new Text(
              'StateManagerment',
              style: _biggerFont,
              textAlign: TextAlign.center,
            ),
            onTap: () {
              navigation(StatefulWidgetLayout(), context);
            },
          ),
        ],
      ),
    );
  }

  navigation(Widget widget, BuildContext buildContext) {
    Navigator.of(buildContext).push(MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }
}
