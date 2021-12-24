import 'package:flutter/material.dart';

class PageDots extends StatelessWidget {
  PageDots( {Key? key, required this.isTrue}) : super(key: key);

  bool isTrue = true;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        color: isTrue ? Colors.white : Colors.grey,
        borderRadius: const BorderRadius.all(Radius.circular(10),
        )
      )

    );
  }
}
