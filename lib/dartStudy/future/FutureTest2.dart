import 'dart:io';

void main() async {
  Future future = asyncMethod();
  future.then((value) {
    sleep(Duration(seconds: 2));
    print('this is the result from asyncMethod $value');
  });
  // Future((){
  //   asyncMethod();
  // });
  print('sleep 5 second');
  sleep(Duration(seconds: 5));
  print('end of main thread');
}

Future<dynamic> asyncMethod() async {
   await asyncMethod2();
  // await future;
  sleep(Duration(seconds: 3));
  print('asyncMethod is called');
  return 2;
  // return future.then((value) => print('this result from asyncMethod2 is $value'));
}

Future<dynamic> asyncMethod2() async {
  sleep(Duration(seconds: 2));
  print('asyncMethod2 is called');
  return 2;
}

