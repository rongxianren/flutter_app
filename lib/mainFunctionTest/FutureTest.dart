void main() async {
  await getAJoke().then((value) {
    print(value);
  }).catchError((error) {
    print('error');
  });

  print('Another print statement.');
}

Future<String> getAJoke() {
  return Future<String>.delayed(Duration(milliseconds: 2000), () {
//    throw new Exception("No joke for you");
    return "this is a joke??";
  });
}
