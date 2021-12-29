import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_ui/views/homepageview/categories.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Image.asset(
          'assets/logo.png',
          fit: BoxFit.contain,
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.cast)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.widgets)),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text(
                  'TV Shows',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Movies',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              TextButton(
                onPressed: () => Get.to(() => const GenreList()),
                child: const Text(
                  'Categories ▼',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Image.network(
                  'https://picsum.photos/200',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                Container(
                  color: Colors.black.withOpacity(0.5),
                  width: 500,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Column(
                          children: const [
                            Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            Text(
                              'My List',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      ElevatedButton.icon(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                        ),
                        icon: const Icon(
                          Icons.play_arrow,
                          color: Colors.black,
                        ),
                        label: const Text(
                          'Play',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Column(
                          children: const [
                            Icon(
                              Icons.info_outline,
                              color: Colors.white,
                            ),
                            Text(
                              'Info',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Watch Together for Older Kids',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 150,
              width: double.infinity,
              child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8.0))),
                      padding:
                          const EdgeInsets.symmetric(horizontal: 3.0, vertical: 8.0),
                      width: 100,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(6.0),
                          child: Image.network('https://picsum.photos/300/400',
                              fit: BoxFit.cover)),
                    );
                  }),
            ),
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Trending Now',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 150,
              width: double.infinity,
              child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 3.0, vertical: 8.0),
                      width: 100,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(6.0),
                          child: Image.network('https://picsum.photos/300/400',
                              fit: BoxFit.cover)),
                    );
                  }),
            ),
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Released in the Past Year',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 150,
              width: double.infinity,
              child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8.0))),
                      padding:
                          const EdgeInsets.symmetric(horizontal: 3.0, vertical: 8.0),
                      width: 100,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(6.0),
                          child: Image.network('https://picsum.photos/300/400',
                              fit: BoxFit.cover)),
                    );
                  }),
            ),
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'TV Sci-Fi & Horror',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 150,
              width: double.infinity,
              child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8.0))),
                      padding:
                          const EdgeInsets.symmetric(horizontal: 3.0, vertical: 8.0),
                      width: 100,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(6.0),
                          child: Image.network('https://picsum.photos/300/400',
                              fit: BoxFit.cover)),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
