
import 'package:flutter/material.dart';

final appBar = AppBar(
  elevation: 0.0,
  automaticallyImplyLeading: false,
  leadingWidth: 100,
  leading: Padding(
    padding: const EdgeInsets.only(left: 15),
    child: Image.asset(
      'assets/netflix.png',
      fit: BoxFit.fitWidth,
    ),
  ),
  actions: [
    TextButton(
        onPressed: () {},
        child: const Text(
          'HELP',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: Colors.white),
        )),
    TextButton(
      onPressed: () {},
      child: const Text(
        'SIGN IN',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            color: Colors.white),
      ),
    ),
  ],
);