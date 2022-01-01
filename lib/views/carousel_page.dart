import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:netflix_ui/views/get_started.dart';
import 'package:netflix_ui/views/sign_in.dart';
import 'package:netflix_ui/views/widgets/custom_button.dart';
import 'package:netflix_ui/views/widgets/page_dots.dart';
class CarouselPage extends StatefulWidget {
  const CarouselPage({Key? key}) : super(key: key);

  @override
  _CarouselPageState createState() => _CarouselPageState();
}

class _CarouselPageState extends State<CarouselPage> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentPage = 0;
  bool _isLoading = false;

//uncomment for auto scrolling fn
  // @override
  // void initState() {
  //   Timer.periodic(const Duration(seconds: 3), (timer) {
  //     if (currentPage < 4) {
  //       currentPage++;
  //     } else {
  //       currentPage = 0;
  //     }
  //     _pageController.animateToPage(currentPage,
  //         duration: const Duration(seconds: 2), curve: Curves.ease);
  //   });
  //   super.initState();
  // }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  onPageChanged(int index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Image.asset(
          'assets/logo.png',
          fit: BoxFit.cover,
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: const Text(
                'PRIVACY',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.white),
              )),
          TextButton(
              onPressed: () => Get.to(const SigninPage()),
              child: const Text(
                'SIGN IN',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.white),
              )),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Stack(
              children: [
                PageView(
                  physics: const ScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: onPageChanged,
                  children: [
                    Image.asset(
                      'assets/first.png',
                      fit: BoxFit.contain,
                    ),
                    Image.asset('assets/second.png', fit: BoxFit.contain),
                    Image.asset('assets/third.png', fit: BoxFit.contain),
                    Image.asset('assets/fourth.png', fit: BoxFit.contain),
                  ],
                ),
                Positioned(
                    bottom: 10,
                    left: 130,
                    child: Row(
                      children: List.generate(
                          4,
                          (index) => index == currentPage
                              ? PageDots(isTrue: true)
                              : PageDots(isTrue: false)),
                    )),
              ],
            ),
          ),
          CustomButton(
            onTap: () {
              setState(() {
                _isLoading = true;
              });
              Get.to(const GetStartedPage())!.then((value) {
                setState(() {
                  _isLoading = false;
                });
              });
            },
            text: _isLoading
                ? const CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2.0,
                  )
                : const Text(
                    'GET STARTED',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
            padding: 10.0,
          )
        ],
      ),
    );
  }
}
