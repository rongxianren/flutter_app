import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class PainterContainer extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
        painter: DemoPainter(0.0, 3.14159),),
      height: 200,
      width: 200,
      color: Colors.deepOrange,
      padding: EdgeInsets.all(30.0),
    );
  }
}

class DemoPainter extends CustomPainter {
  final double _arcStart;
  final double _arcSweep;

  DemoPainter(this._arcStart, this._arcSweep);

  @override
  void paint(Canvas canvas, Size size) {
    double side = size.width > size.height ? size.height : size.width;
    Paint paint = Paint()
    ..color = Colors.blue
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 4.0
    ..style = PaintingStyle.stroke;
    canvas.drawArc(Offset.zero & Size(side, side), _arcStart, _arcSweep, false, paint);
  }

  @override
  bool shouldRepaint(DemoPainter oldDelegate) {
    return _arcStart != oldDelegate._arcStart || _arcSweep != oldDelegate._arcSweep;;
  }
}
