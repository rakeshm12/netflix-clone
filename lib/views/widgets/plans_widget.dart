import 'package:flutter/material.dart';

class PlansWidget extends StatelessWidget {
  const PlansWidget({
    Key? key, required this.childrens, required this.head,
  }) : super(key: key);

  final List<Widget> childrens;
  final String head;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(head),
        const SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: childrens
        ),
        const SizedBox(height: 15),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Divider(thickness: 0.8,color: Colors.grey,),
        )
      ],
    );
  }
}