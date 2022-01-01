import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:netflix_ui/services/api_data.dart';
import 'package:netflix_ui/views/homepage_view/tv_shows.dart';
import 'package:netflix_ui/views/movie_info.dart';
import 'package:netflix_ui/widgets/bottom_sheet.dart';
import 'package:tmdb_api/tmdb_api.dart';

import 'categories.dart';
import 'movies.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ScrollController controller = ScrollController();
  bool isButton = false;
  var videos = Random();
  List topRated = [];
  List trending = [];
  List latest = [];
  List tv = [];

  loadTrending() async {
    final tmDbInstance = TMDB(
      ApiKeys(Api.apiKey, Api.accessToken),
      logConfig: ConfigLogger(
          showLogs: true,
          showErrorLogs: true), //ApiKeys instance with your keys,
    );
    Map trendingResult = await tmDbInstance.v3.trending.getTrending();
    Map topRatedResult = await tmDbInstance.v3.movies.getTopRated();
    Map latestResult = await tmDbInstance.v3.movies.getPouplar();
    Map tvResult = await tmDbInstance.v3.tv.getAiringToday();

    setState(() {
      trending = trendingResult['results'];
      topRated = topRatedResult['results'];
      latest = latestResult['results'];
      tv = tvResult['results'];
    });
  }

  scrollTrack() {
    controller.addListener(() {
      if (controller.offset > 60) {
        setState(() {
          isButton = false;
        });
      } else {
        setState(() {
          isButton = true;
        });
      }
    });
  }

  @override
  void initState() {
    loadTrending();
    scrollTrack();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var randomIndex = videos.nextInt(10);
    return Scaffold(
        extendBodyBehindAppBar: true,
        floatingActionButton: isButton
            ? FloatingActionButton.extended(
                backgroundColor: Colors.white,
                onPressed: () =>
                    Get.to(MovieInfo(id: trending[randomIndex]['id'])),
                label: Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.random,
                      color: Colors.red.withBlue(226),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Play Something',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    )
                  ],
                ))
            : FloatingActionButton(
                backgroundColor: Colors.white,
                onPressed: () =>
                    Get.to(MovieInfo(id: trending[randomIndex]['id'])),
                child: FaIcon(
                  FontAwesomeIcons.random,
                  color: Colors.red.withBlue(230),
                ),
              ),
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
                  onPressed: () => Get.to(() => const TvShows()),
                  child: const Text(
                    'TV Shows',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                TextButton(
                  onPressed: () => Get.to(() => const MoviesPage()),
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
          controller: controller,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Container(
                    color: Colors.black,
                    height: MediaQuery.of(context).size.height - 250,
                    width: double.infinity,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: trending.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  Api.imageUrl + trending[index]['poster_path'],
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        }),
                  ),
                  Container(
                    color: Colors.black.withOpacity(0.5),
                    width: 500,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              isButton = !isButton;
                            });
                          },
                          child: Column(
                            children: [
                              Icon(
                               isButton ? Icons.add : Icons.check,
                                color: Colors.white,
                              ),
                              const Text(
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
                          onPressed: () => Get.to(
                              MovieInfo(id: trending[randomIndex]['id'])),
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
                  'Top Rated',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 150,
                width: double.infinity,
                child: ListView.builder(
                    itemCount: topRated.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0))),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 3.0, vertical: 8.0),
                        width: 100,
                        child: GestureDetector(
                          onTap: () => Get.bottomSheet(
                            SingleChildScrollView(
                                child: BottomModal(
                              title: topRated[index]['title'] ?? 'No data',
                              image:
                                  Api.imageUrl + topRated[index]['poster_path'],
                              date:
                                  topRated[index]['release_date'] ?? 'No data',
                              rating: topRated[index]['vote_average'] ?? 0,
                              desc: topRated[index]['overview'] ?? 'No data',
                              onTap: () =>
                                  Get.to(MovieInfo(id: topRated[index]['id'])),
                            )),
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(6.0),
                              child: Image.network(
                                  Api.imageUrl + topRated[index]['poster_path'],
                                  fit: BoxFit.cover)),
                        ),
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
                    itemCount: trending.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 3.0, vertical: 8.0),
                        width: 100,
                        child: GestureDetector(
                          onTap: () => Get.bottomSheet(
                            SingleChildScrollView(
                              child: BottomModal(
                                title: trending[index]['title'] ?? 'No data',
                                image: Api.imageUrl +
                                    trending[index]['poster_path'],
                                date: trending[index]['release_date'] ??
                                    'no data',
                                rating: trending[index]['vote_average'] ?? 0,
                                desc: trending[index]['overview'] ??
                                    'No description available',
                                onTap: () => Get.to(
                                  MovieInfo(id: trending[index]['id']),
                                ),
                              ),
                            ),
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(6.0),
                              child: Image.network(
                                  Api.imageUrl + trending[index]['poster_path'],
                                  fit: BoxFit.cover)),
                        ),
                      );
                    }),
              ),
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Popular Movies',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 150,
                width: double.infinity,
                child: ListView.builder(
                    itemCount: latest.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0))),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 3.0, vertical: 8.0),
                        width: 100,
                        child: GestureDetector(
                          onTap: () => Get.bottomSheet(
                            SingleChildScrollView(
                                child: BottomModal(
                              title: latest[index]['title'] ?? 'No data',
                              image:
                                  Api.imageUrl + latest[index]['poster_path'],
                              date: latest[index]['release_date'] ?? 'no data',
                              rating: latest[index]['vote_average'] ?? 0,
                              desc: latest[index]['overview'] ??
                                  'No description available',
                              onTap: () =>
                                  Get.to(MovieInfo(id: latest[index]['id'])),
                            )),
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(6.0),
                              child: Image.network(
                                  Api.imageUrl + latest[index]['poster_path'],
                                  fit: BoxFit.cover)),
                        ),
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
                    itemCount: tv.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0))),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 3.0, vertical: 8.0),
                        width: 100,
                        child: GestureDetector(
                          onTap: () => Get.bottomSheet(
                            SingleChildScrollView(
                                child: BottomModal(
                              title: tv[index]['title'] ?? 'No data',
                              image: Api.imageUrl + tv[index]['poster_path'],
                              date: tv[index]['release_date'] ?? 'no data',
                              rating: tv[index]['vote_average'] ?? 0,
                              desc: tv[index]['overview'] ??
                                  'No description available',
                              onTap: () =>
                                  Get.to(MovieInfo(id: tv[index]['id'])),
                            )),
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(6.0),
                              child: Image.network(
                                  Api.imageUrl + tv[index]['poster_path'],
                                  fit: BoxFit.cover)),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ));
  }
}
