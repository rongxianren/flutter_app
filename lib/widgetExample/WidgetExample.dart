import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: ListView(
        children: <Widget>[
          getImage(),
          getDivider(),
          getFlex(),
          getDivider(),
          getFlexible(),
          getDivider(),
          getStack(),
          getDivider(),
          getCard(),
        ],
      ),
    ));
  }

  Widget getDivider() {
    return Padding(padding: EdgeInsets.all(10));
  }

  Widget getImage() {
    return Image.network(
      "https://gw.alicdn.com/tfs/TB1CgtkJeuSBuNjy1XcXXcYjFXa-906-520.png",
      fit: BoxFit.contain,
      width: 150.0,
      height: 100.0,
    );
  }

  Widget getFlex() {
    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 40,
          height: 60,
          color: Colors.pink,
          child: Center(
            child: Text('left'),
          ),
        ),
        Container(
          width: 80,
          height: 60,
          color: Colors.grey,
          child: Center(
            child: Text('left'),
          ),
        ),
        Container(
          width: 60,
          height: 60,
          color: Colors.yellow,
          child: Center(
            child: Text('left'),
          ),
        ),
      ],
    );
  }

  Widget getFlexible() {
    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Flexible(
          flex: 2,
          fit: FlexFit.loose,
          child: Container(
            color: Colors.blue,
            height: 60,
            alignment: Alignment.center,
            child: Text(
              'left!',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black),
              textDirection: TextDirection.ltr,
            ),
          ),
        ),
        Flexible(
          flex: 1,
          fit: FlexFit.loose,
          child: Container(
            color: Colors.red,
            height: 60,
            alignment: Alignment.center,
            child: Text(
              'right!',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black),
              textDirection: TextDirection.ltr,
            ),
          ),
        )
      ],
    );
  }

  Widget getStack() {
    return Container(
        color: Colors.yellow,
        height: 150.0,
        width: 500.0,
        child: new Stack(children: <Widget>[
          new Container(
            color: Colors.blueAccent,
            height: 50.0,
            width: 100.0,
            alignment: Alignment.center,
            child: Text('unPositioned'),
          ),
          new Positioned(
              left: 40.0,
              top: 80.0,
              child: new Container(
                color: Colors.pink,
                height: 50.0,
                width: 95.0,
                alignment: Alignment.center,
                child: Text('Positioned'),
              )),
        ]));
  }

  TextStyle _itemTextStyle =
      new TextStyle(fontWeight: FontWeight.w500, fontSize: 14.0);

  Widget getCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: <Widget>[
          Image.asset('images/lake.jpg'),
          ListTile(
            title: Text(
              'title',
              style: _itemTextStyle,
            ),
            subtitle: Text('A'),
            leading: Icon(
              Icons.theaters,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
