import 'dart:async';
import 'dart:io';

import 'dart:isolate';

import 'package:flutter/foundation.dart';

Map<String, Map> _dataCache = {}; //缓存打开详情页数据

void main() async {
  Isolate.spawn(func, 100);
  print("外部代码1");
  var future = Future(func2);
  compute(func3, '');
  await future.then((value) => print("异步代码1"));
  future.then((value) => print("异步代码2"));
  future.then((value) => print("异步代码3"));
  future.then((value) => print("异步代码4"));
  sleep(Duration(seconds: 2));
  print("外部代码2");

  sleep(Duration(seconds: 5));
  Future(() {
    return 1;
  }).then((value) => null);
  // scheduleMicrotask(callback)
}

void func(int count) {
  print("count is $count");
  sleep(Duration(seconds: 2));
  print("count2 is $count");
}

void func2() {
  print("before sleep");
  sleep(Duration(seconds: 2));
  print("after sleep");
}

void func3(String param) async{
  print("耗时任务开始");
  sleep(Duration(seconds: 3));
  print("耗时任务结束");
  return Future.value('haha');
}
