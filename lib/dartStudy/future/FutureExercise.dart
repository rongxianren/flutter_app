import 'dart:async';
import 'dart:io';

import 'dart:isolate';

void main() async{
  Isolate ios = await Isolate.spawn(func, 100);
  print("外部代码1");
  Future(() {}).then((value) => print("异步代码"));
  sleep(Duration(seconds: 2));
  print("外部代码2");

  sleep(Duration(seconds: 5));
  Future((){ return 1;}).then((value) => null);
  // scheduleMicrotask(callback)
}


void func(int count){
  print("count is $count");
  sleep(Duration(seconds: 4));
  print("count2 is $count");
}
