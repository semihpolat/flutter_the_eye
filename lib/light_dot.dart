import 'package:flutter/material.dart';

///A white dot in top left corner
class LightDot extends StatelessWidget {
  final double top;
  final double left;
  final double width;
  final double height;

  const LightDot({Key key, this.top, this.left, this.width, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left + width / 5,
      top: top + height / 5,
      width: width / 5,
      height: height / 5,
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              blurRadius: 3,
              color: Colors.white.withOpacity(0.9),
            ),
          ],
        ),
      ),
    );
  }
}
