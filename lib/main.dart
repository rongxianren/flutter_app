import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/gesture/gesture.dart';
import 'package:flutter_app/stateful_widget/ExampleEnter.dart';
import 'package:flutter_app/widgetExample/WidgetExample.dart';
import 'package:flutter_app/widget_listviewExample/ListViewLoadMore.dart';
import 'package:flutter_app/widget_reuse/widget_reuse.dart';
import 'animationExample/AnimationTest.dart';
import 'channelExample/MethodChannel.dart';
import 'example1/FirstSimpleApp.dart';
import 'example2/LakeExample.dart';

typedef RouteBuilder = Route Function(String name, dynamic args, Widget widget);

void main() => runApp(EnterWidget());

final _biggerFont = const TextStyle(fontSize: 18.0);

class EnterWidget extends StatelessWidget {
  final List<String> routes = [
    '/FirstSimpleApp',
    '/LayoutSimpleApp',
    '/StateManagerment',
    '/MethodChannel',
    '/WidgetExample',
    '/ListViewLoadMore',
    '/PainterContainer',
    '/WidgetReUse',
    '/GestureWidget'
  ];

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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter 学习demo"),
        ),
        body: ListView.builder(
            itemCount: routes.length,
            itemBuilder: (BuildContext context, int index) {
              return getItem(
                index,
                context,
              );
            }),
      ),
      initialRoute: '/',
      onGenerateRoute: (RouteSettings routeSettings) => getRoute(routeSettings.name, routeSettings.arguments),
      // routes: ,
    );
  }

  Route<dynamic> getRoute(String name, dynamic args) {
    Map<String, Route> routeMap = _generateRoutes(name, args);
    return routeMap[name];
  }

  Map<String, Route> _generateRoutes(String name, args) {
    Map<String, Route> routeMap = {
      '/FirstSimpleApp': getPageRoute(name, args, FirstSimpleApp()),
      '/LayoutSimpleApp': getPageRoute(name, args, LayoutApp()),
      '/StateManagerment': getPageRoute(name, args, StatefulWidgetLayout()),
      '/MethodChannel': getPageRoute(name, args, ChannelWidget()),
      '/WidgetExample': getPageRoute(name, args, WidgetExample()),
      '/ListViewLoadMore': getPageRoute(name, args, ListViewWidget()),
      '/PainterContainer': getPageRoute(name, args, PainterContainer()),
      '/WidgetReUse': getPageRoute(name, args, WidgetReuse()),
      '/GestureWidget': getPageRoute(name, args, GestureWidget()),
    };
    return routeMap;
  }

  PageRoute getPageRoute(String name, dynamic args, Widget widget) {
    return CupertinoPageRoute(settings: RouteSettings(name: name, arguments: args), builder: (context) => widget);
  }

  Widget getItem(int index, BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(height: 50.0),
      child: RaisedButton(
        onPressed: () {
          Navigator.pushNamed(context, routes[index]);
        },
        child: Text(
          routes[index].substring(1, routes[index].length),
          style: _biggerFont,
        ),
      ),
      margin: EdgeInsets.all(10.0),
    );
  }
}
