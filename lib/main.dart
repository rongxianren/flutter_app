import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_app/stateful_widget/ExampleEnter.dart';
import 'package:flutter_app/widgetExample/WidgetExample.dart';
import 'package:flutter_app/widget_listviewExample/ListViewLoadMore.dart';
import 'animationExample/AnimationTest.dart';
import 'channelExample/MethodChannel.dart';
import 'example1/FirstSimpleApp.dart';
import 'example2/LakeExample.dart';

void main() => runApp(EnterWidget());

final _biggerFont = const TextStyle(fontSize: 18.0);

class EnterWidget extends StatelessWidget {
  Map<String, Widget> widgetsMap = HashMap();

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
    widgetsMap.putIfAbsent('FirstSimpleApp', () => FirstSimpleApp());
    widgetsMap.putIfAbsent('LayoutSimpleApp', () => LayoutApp());
    widgetsMap['StateManagerment'] = StatefulWidgetLayout();
    widgetsMap['MethodChannel'] = ChannelWidget();
    widgetsMap['WidgetExample'] = WidgetExample();
    widgetsMap['ListViewLoadMore'] = ListViewWidget();
    widgetsMap['PainterContainer'] = PainterContainer();

    return Scaffold(
      appBar: AppBar(
        title: Text('Fluter Demo Enter'),
      ),
      body: ListView.builder(
          itemCount: widgetsMap.keys.length,
          itemBuilder: (BuildContext context, int index) {
            return getItem(widgetsMap.values.elementAt(index), context,
                widgetsMap.keys.elementAt(index));
          }),
    );
  }

  Widget getItem(Widget item, BuildContext context, String itemContent) {
    return Container(
      constraints: BoxConstraints.expand(height: 50.0),
      child: RaisedButton(
        onPressed: () {
          navigation(item, context);
        },
        child: Text(
          itemContent,
          style: _biggerFont,
        ),
      ),
      margin: EdgeInsets.all(10.0),
    );
  }

  navigation(Widget widget, BuildContext buildContext) {
    Navigator.of(buildContext).push(MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }
}
