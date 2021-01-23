

import 'package:flutter/material.dart';

class MyData<T> extends InheritedWidget{

  final T data;
  MyData({this.data, Widget child}) : super(child: child);


  static MyData of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<MyData>();
  }

  @override
  bool updateShouldNotify(covariant MyData oldWidget) {
    return this.data == oldWidget;
  }

}