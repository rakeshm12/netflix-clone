import 'package:flutter/material.dart';
import 'package:netflix_ui/views/homepageview/coming_soon.dart';
import 'package:netflix_ui/views/homepageview/home.dart';
import 'package:netflix_ui/views/plans_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  late TabController _controller;


  void onChanged(int pageIndex) {
    setState(() {
      _currentIndex = pageIndex;
    });
  }


  final pages = const [
   HomeView(),
    PlansPage(),
    ComingSoon(),
    PlansPage(),
    PlansPage(),
  ];

  @override
  void initState() {
  _controller = TabController(length: 5, vsync: this);
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
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) => setState(() => _currentIndex = index),
          showUnselectedLabels: true,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          enableFeedback: false,
          currentIndex: _currentIndex,
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.videogame_asset_outlined), label: 'Game'),
            BottomNavigationBarItem(
                icon: Icon(Icons.video_library_outlined), label: 'Coming Soon'),
            BottomNavigationBarItem(
                icon: Icon(Icons.emoji_emotions_outlined),
                label: 'Fast Laughs'),
            BottomNavigationBarItem(
                icon: Icon(Icons.arrow_circle_down), label: 'Downloads'),
          ]),
      body: pages[_currentIndex]

      // PageView(
      //   children: _pages,
      //   controller: _controller,
      //   onPageChanged: onChanged,
      //   physics: ScrollPhysics(),
    // ),
    );
  }
}
