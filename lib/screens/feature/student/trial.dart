import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';

class TrialScreen extends StatelessWidget {
  const TrialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: Column(children: [
        Row(
          children: [
            Container(
              width: size.width * 0.5,
              height: size.width * 0.5,
              color: Colors.green,
            ),
            FittedBox(
              child: SizedBox(
                width: size.width * 0.5,
                height: size.width * 0.5,
                child: CustomPaint(
                  painter: CurvePainter(),
                  child: Container(),
                ),
              ),
            ),
          ],
        ),
        Row(children: [
          Spacer(),
          Container(
            width: size.width * 0.5,
            height: size.width * 0.5,
            color: Colors.green,
          ),
        ])
      ]),
    ));
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();

    paint.color = Colors.red;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 3;

    var startPoint = Offset(size.width * 0.0, size.width * 0.2);
    var controlPoint1 = Offset(size.width * 0.4, size.width * 0.2);
    var controlPoint2 = Offset(size.width * 0.8, size.width * 0.5);
    var endPoint = Offset(size.width * 0.8, size.width * 1.0);

    var path = Path();
    path.moveTo(startPoint.dx, startPoint.dy);
    path.cubicTo(controlPoint1.dx, controlPoint1.dy, controlPoint2.dx,
        controlPoint2.dy, endPoint.dx, endPoint.dy);

    canvas.drawPath(
      dashPath(
        path,
        dashArray: CircularIntervalList<double>(<double>[15.0, 10]),
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
