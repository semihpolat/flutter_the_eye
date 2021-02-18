import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:the_eye/light_dot.dart';

class Draw2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Stack(
          children: [
            Positioned(
              left: 100,
              top: 330,
              child: Container(
                height: 200,
                width: 200,
                color: Color(0xff000000),
              ),
            ),
            Positioned(
              left: 50,
              top: 345,
              child: CustomPaint(
                size: Size(310, (310 * 0.5833333333333334).toDouble()),
                painter: RPSCustomPainter(),
              ),
            ),
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return CustomPaint(
                  painter: MyPainter(),
                  size: Size(constraints.maxWidth, constraints.maxHeight),
                );
              },
            ),
            LightDot(
              left: 190,
              top: 390,
              width: 60,
              height: 60,
            ),
            LightDot(
              left: 187,
              top: 402,
              width: 40,
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint linePaint = Paint()..strokeWidth = 1;
    linePaint.style = PaintingStyle.fill;

    Paint linePaint2 = Paint()..strokeWidth = 2;
    linePaint2.style = PaintingStyle.fill;

    Paint circle3Paint = Paint()..strokeWidth = 5;
    circle3Paint.style = PaintingStyle.fill;
    circle3Paint.color = Colors.green.shade600;
    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2), 30, circle3Paint);

    //goz bebegi cevresi
    Paint circlePaint = Paint()..strokeWidth = 3;
    circlePaint.style = PaintingStyle.stroke;
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 30, circlePaint);

    //goz bebegi içi
    Paint circle2Paint = Paint()..strokeWidth = 5;
    circle2Paint.style = PaintingStyle.fill;
    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2), 10, circle2Paint);

    int x = 15;
    int y = 15;

    double polarToCartesianX(double speed, double theta) {
      return speed * math.cos(theta);
    }

    double polarToCartesianY(double speed, double theta) {
      return speed * math.sin(theta);
    }

    //dış sınır çizgileri
    for (int i = 0; i < 360; i++) {
      if (i % 9 == 0) {
        canvas.drawLine(
            Offset((size.width / 2) + polarToCartesianX(22, i.ceilToDouble()),
                (size.height / 2) + polarToCartesianY(22, i.ceilToDouble())),
            Offset((size.width / 2) + polarToCartesianX(30, i.ceilToDouble()),
                (size.height / 2) + polarToCartesianY(30, i.ceilToDouble())),
            linePaint);
      } else if (i % 5 == 0) {
        canvas.drawLine(
            Offset((size.width / 2) + polarToCartesianX(25, i.ceilToDouble()),
                (size.height / 2) + polarToCartesianY(25, i.ceilToDouble())),
            Offset((size.width / 2) + polarToCartesianX(30, i.ceilToDouble()),
                (size.height / 2) + polarToCartesianY(30, i.ceilToDouble())),
            linePaint);
      } else if (i % 2 == 0) {
        canvas.drawLine(
            Offset((size.width / 2) + polarToCartesianX(28, i.ceilToDouble()),
                (size.height / 2) + polarToCartesianY(28, i.ceilToDouble())),
            Offset((size.width / 2) + polarToCartesianX(30, i.ceilToDouble()),
                (size.height / 2) + polarToCartesianY(30, i.ceilToDouble())),
            linePaint);
      }
    }
    //orta çizgiler
    for (int i1 = 0; i1 < 360; i1++) {
      if (i1 % 13 == 0) {
        canvas.drawLine(
            Offset((size.width / 2) + polarToCartesianX(13, i1.ceilToDouble()),
                (size.height / 2) + polarToCartesianY(13, i1.ceilToDouble())),
            Offset((size.width / 2) + polarToCartesianX(19, i1.ceilToDouble()),
                (size.height / 2) + polarToCartesianY(19, i1.ceilToDouble())),
            linePaint);
      } else if (i1 % 10 == 0) {
        canvas.drawLine(
            Offset((size.width / 2) + polarToCartesianX(14, i1.ceilToDouble()),
                (size.height / 2) + polarToCartesianY(14, i1.ceilToDouble())),
            Offset((size.width / 2) + polarToCartesianX(17, i1.ceilToDouble()),
                (size.height / 2) + polarToCartesianY(17, i1.ceilToDouble())),
            linePaint);
      }
    }

    //3
    final curvePath = Path()
      // ..moveTo(50, 50) //4
      ..quadraticBezierTo(1, 1, 5, 5) //8
      ..close(); //9

    //10
    canvas.drawPath(curvePath, linePaint);

    //beyaz leke
    Paint whitePaint = Paint()..strokeWidth = 1;
    whitePaint.style = PaintingStyle.fill;
    whitePaint.color = Colors.white;

    /*   for (int i2 = 30; i2 < 40; i2++) {
      canvas.drawLine(
          Offset((size.width / 2) + 10 - polarToCartesianX(5, i2.toDouble()),
              (size.height / 2) - polarToCartesianY(5, i2.toDouble())),
          Offset((size.width / 2) + 15 - polarToCartesianX(15, i2.toDouble()),
              (size.height / 2) - polarToCartesianY(15, i2.toDouble())),
          whitePaint);
    } */

    /* canvas.drawLine(Offset(size.width / 2, size.height / 2),
        Offset(size.width / 2 + 25, size.height / 2), whitePaint);

    canvas.drawLine(Offset(size.width / 2, size.height / 2),
        Offset(size.width / 2 + 25, size.height / 2 - 5), whitePaint); */
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return true;
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Color.fromARGB(255, 210, 210, 210)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.97;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.2157333, size.height * 0.5527571);
    path_0.quadraticBezierTo(size.width * 0.3995667, size.height * 0.0389714,
        size.width * 0.7549083, size.height * 0.4755429);
    path_0.cubicTo(
        size.width * 0.3679667,
        size.height * 0.7474857,
        size.width * 0.4104667,
        size.height * 0.5457000,
        size.width * 0.2695417,
        size.height * 0.5366571);
    path_0.quadraticBezierTo(size.width * 0.2544333, size.height * 0.5362571,
        size.width * 0.2157333, size.height * 0.5527571);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
