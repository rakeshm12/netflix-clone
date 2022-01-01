import 'package:flutter/material.dart';

class PaymentButton extends StatelessWidget {
  const PaymentButton({
    Key? key,
    required this.headText,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  final String headText;
  final List<Widget> icon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        side: MaterialStateBorderSide.resolveWith(
                (states) => const BorderSide(color: Colors.grey)),
        padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(vertical: 16)),
        overlayColor: MaterialStateProperty.all(Colors.black),
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(4.0),
            ),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              headText,
              textAlign: TextAlign.left,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: icon)
          ],
        ),
      ),
    );
  }
}
