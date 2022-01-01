import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
        required this.onTap,
        required this.text, required this.padding,
      })
      : super(key: key);

  final Function() onTap;
  final Widget text;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.white,
        highlightColor: Colors.white,
        child: Container(
          alignment: Alignment.center,
          width: double.maxFinite,
          height: 43,
          color: const Color(0xFFdb2612),
          child: text
        ),
      ),
    );
  }
}