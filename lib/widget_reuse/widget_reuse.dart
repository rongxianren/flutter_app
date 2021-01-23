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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Widget 复用测试"),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: colorBlockItems,
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Icon(Icons.add),
        onPressed: () {
          if (colorBlockItems.isNotEmpty) {
            colorBlockItems.removeAt(0);
            setState(() {});
          }
        },
      ),
    );
  }
}

// class ColorBlock extends StatelessWidget {
//   final Color color;
//   final String title;
//
//   ColorBlock(this.color, this.title);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 60,
//       height: 60,
//       alignment: Alignment.center,
//       decoration: BoxDecoration(color: color),
//       child: Text(title),
//     );
//   }
// }

class ColorBlock extends StatefulWidget {
  // final Color _color = Color.fromARGB(255, Random().nextInt(255), Random().nextInt(255), Random().nextInt(255));
  final String title;

  ColorBlock(this.title, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ColorBlockState();
  }
}

class ColorBlockState extends State<ColorBlock> {
  Random random = Random();
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
  }
}
