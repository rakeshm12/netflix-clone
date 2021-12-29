import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PlanSelector extends StatelessWidget {
  PlanSelector({
    Key? key,
    required this.plans,required this.isSelected
  }) : super(key: key);

  final String plans;
  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    return isSelected ?
    ClipPath(
      clipper: PlanSelected(),
      child: Container(
        height: 90,
        width: 80,
        color: Colors.red,
        child: Center(
            child: Text(
              plans,
              textAlign: TextAlign.center,
            )),
      ),
    ) : ClipPath(
      clipper: PlanNotSelected(),
      child: Container(
        height: 90,
        width: 80,
        color: Colors.red.shade300,
        child: Center(
            child: Text(
              plans,
              textAlign: TextAlign.center,
            )),
      ),
    );
  }
}

class PlanSelected extends CustomClipper<Path> {
  PlanSelected();
  final double borderRadius = 0.0;


  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;
    double rheight = height - height / 6;
    double oneThird = width / 3;

    final path = Path()
      ..cubicTo(0, rheight - borderRadius, 0, rheight, borderRadius, rheight)
      ..lineTo(oneThird, rheight)
      ..lineTo(width / 2 - borderRadius, height - borderRadius)
      ..lineTo(2 * oneThird, rheight)
      ..lineTo(width - borderRadius, rheight)
      ..lineTo(width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class PlanNotSelected extends CustomClipper<Path> {
  PlanNotSelected();
  final double borderRadius = 0.0;


  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;
    double rheight = height - height / 6;
    double oneThird = width / 3;

    final path = Path()
      ..cubicTo(0, rheight - borderRadius, 0, rheight, borderRadius, rheight)
      ..lineTo(oneThird, rheight)
      ..lineTo(2 * oneThird, rheight)
      ..lineTo(width - borderRadius, rheight)
      ..lineTo(width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}