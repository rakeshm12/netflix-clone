import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_ui/views/carousel_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2))
        .then((value) => Get.off( () => const CarouselPage()));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logofull.png' , fit: BoxFit.contain,),
            CircularProgressIndicator(color: Colors.red,strokeWidth: 2,)
          ],
        )
        // Text(
        //   'NETFLIX',
        //   style: TextStyle(
        //       fontSize: 50,
        //       fontWeight: FontWeight.bold,
        //       color: Colors.red.shade600,
        //     decorationStyle: TextDecorationStyle.wavy
        //   ),),
        
      ),
    );
  }
}
