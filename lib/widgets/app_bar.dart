
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_ui/views/sign_in.dart';

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
      onPressed: () {
        Get.to(const SigninPage());
      },
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

final appBarLoggedIn = AppBar(
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
      onPressed: () {
      },
      child: const Text(
        'SIGN OUT',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            color: Colors.white),
      ),
    ),
  ],
);