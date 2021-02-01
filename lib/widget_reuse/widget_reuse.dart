/*
* widget复用逻辑
* */
import 'dart:math';

import 'package:flutter/material.dart';

class WidgetReuse extends StatefulWidget {
  @override
  State createState() {
    return new WidgetReuseState();
  }
}

class WidgetReuseState extends State<WidgetReuse> {
  var colorBlockItems = <ColorBlock>[];

  @override
  void initState() {
    super.initState();
    colorBlockItems.add(ColorBlock("色块11111"));
    colorBlockItems.add(ColorBlock("色块22222"));
    colorBlockItems.add(ColorBlock("色块33333"));
    colorBlockItems.add(ColorBlock("色块11111", key: UniqueKey()));
    colorBlockItems.add(ColorBlock("色块22222",key: UniqueKey()));
    colorBlockItems.add(ColorBlock("色块33333",key: UniqueKey()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Widget 复用测试"),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => colorBlockItems[index],
          separatorBuilder: (context, index) => _getDivider(),
          itemCount: colorBlockItems.length),
      floatingActionButton: FloatingActionButton.extended(
        label: Icon(Icons.delete),
        onPressed: () {
          if (colorBlockItems.isNotEmpty) {
            colorBlockItems.removeAt(0);
            setState(() {});
          }
        },
      ),
    );
  }

  Divider _getDivider() {
    return Divider(
      color: Color.fromARGB(255, 242, 243, 245),
      thickness: 1,
      height: 1,
    );
  }
}

class ColorBlock extends StatefulWidget {
  final Color _color = Color.fromARGB(255, Random().nextInt(255), Random().nextInt(255), Random().nextInt(255));
  final String title;

  ColorBlock(this.title, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ColorBlockState();
  }
}

class ColorBlockState extends State<ColorBlock> {
  final Color _color = Color.fromARGB(255, Random().nextInt(255), Random().nextInt(255), Random().nextInt(255));

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: _color),
      child: Text(widget.title),
    );

    // return Stack(
    //   children: [BackGround(), Center(child: Text(widget.title))],
    // );
  }
}

class BackGround extends StatefulWidget {
  BackGround({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return BackGroundState();
  }
}

class BackGroundState extends State<BackGround> {
  final Color _color = Color.fromARGB(255, Random().nextInt(255), Random().nextInt(255), Random().nextInt(255));

  @override
  Widget build(BuildContext context) {
    return Container(
      key: UniqueKey(),
      height: 60,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: _color),
    );
  }
}
