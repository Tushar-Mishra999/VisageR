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
      backgroundColor: Colors.grey.shade900,
      body: Center(
          child: NeumorphicButton(
        onTap: () {},
        child: Image.asset(
          'assets/apple.png',
          height: 80,
          color: Colors.grey[700],
        ),
        BorderRadius: 12,
        bottomRightShadowBlurRadius: 15,
        bottomRightShadowSpreadRadius: 1,
        borderWidth: 5,
        backgroundColor: Colors.grey.shade900,
        topLeftShadowBlurRadius: 15,
        topLeftShadowSpreadRadius: 1,
        topLeftShadowColor: Colors.grey.shade800,
        bottomRightShadowColor: Colors.black,
        height: size.width * 0.5,
        width: size.width * 0.5,
        padding: EdgeInsets.all(50),
        bottomRightOffset: Offset(5, 5),
        topLeftOffset: Offset(-5, -5),
      )),
    );
  }
}

class NeumorphicButton extends StatefulWidget {
  const NeumorphicButton(
      {Key? key,
      required this.width,
      required this.height,
      required this.child,
      this.padding,
      this.margin,
      required this.backgroundColor,
      required this.BorderRadius,
      this.boxShape,
      required this.bottomRightShadowColor,
      required this.bottomRightShadowBlurRadius,
      required this.bottomRightShadowSpreadRadius,
      required this.topLeftShadowColor,
      required this.topLeftShadowBlurRadius,
      required this.topLeftShadowSpreadRadius,
      required this.onTap,
      required this.borderWidth,
      this.borderColor,
      this.gradientColors,
      required this.topLeftOffset,
      required this.bottomRightOffset})
      : super(key: key);
  final double width;
  final double height;
  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color backgroundColor;
  final double BorderRadius;
  final BoxShape? boxShape;
  final Color bottomRightShadowColor;
  final double bottomRightShadowBlurRadius;
  final double bottomRightShadowSpreadRadius;
  final Color topLeftShadowColor;
  final double topLeftShadowBlurRadius;
  final Offset topLeftOffset;
  final Offset bottomRightOffset;
  final double topLeftShadowSpreadRadius;
  final Function onTap;
  final double? borderWidth;
  final Color? borderColor;
  final List<Color>? gradientColors;
  @override
  State<NeumorphicButton> createState() => _NeumorphicButtonState();
}

class _NeumorphicButtonState extends State<NeumorphicButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap(),
      child: Container(
        width: widget.width,
        height: widget.height,
        child: widget.child,
        padding: widget.padding ?? EdgeInsets.all(15),
        margin: widget.margin ?? EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.circular(widget.BorderRadius),
            shape: widget.boxShape ?? BoxShape.rectangle,
            border: Border.all(
              width: widget.borderWidth ?? 0,
              color: widget.borderColor ?? widget.backgroundColor,
            ),
            boxShadow: [
              BoxShadow(
                  color: widget.bottomRightShadowColor,
                  offset: widget.bottomRightOffset,
                  blurRadius: widget.bottomRightShadowBlurRadius,
                  spreadRadius: widget.bottomRightShadowSpreadRadius),
              BoxShadow(
                  color: widget.topLeftShadowColor,
                  offset: widget.topLeftOffset,
                  blurRadius: widget.topLeftShadowBlurRadius,
                  spreadRadius: widget.topLeftShadowSpreadRadius),
            ]),
      ),
    );
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
