import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:netflix_ui/views/home_page.dart';

class PaymentSuccess extends StatefulWidget {
  const PaymentSuccess({Key? key}) : super(key: key);

  @override
  _PaymentSuccessState createState() => _PaymentSuccessState();
}

class _PaymentSuccessState extends State<PaymentSuccess> with TickerProviderStateMixin {

  late final AnimationController _controller;

  @override
  void initState() {
  _controller = AnimationController(vsync: this);
  Future.delayed(const Duration(seconds: 2)).then((value) => Get.off( () => const HomePage()));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Lottie.asset(
          'assets/payment.json',
          controller: _controller,
          onLoaded: (composition) {
            // Configure the AnimationController with the duration of the
            // Lottie file and start the animation.
            _controller
              ..duration = composition.duration
              ..forward();
          },
        ),
      ),
    );
  }
}
