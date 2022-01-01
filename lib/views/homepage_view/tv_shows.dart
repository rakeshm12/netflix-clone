import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_ui/services/api_data.dart';
import 'package:netflix_ui/widgets/bottom_sheet.dart';
import 'package:tmdb_api/tmdb_api.dart';

class TvShows extends StatefulWidget {
  const TvShows({Key? key}) : super(key: key);

  @override
  State<TvShows> createState() => _TvShowsState();
}

class _TvShowsState extends State<TvShows> {
  final ScrollController controller = ScrollController();

  bool isButton = false;

  var random = Random();

  List topRated = [];

  List trending = [];

  // List latest = [];

  List airingToday = [];

  loadShows() async {
    final tmdb = TMDB(
      //TMDB instance
      ApiKeys(Api.apiKey, Api.accessToken),
      logConfig: ConfigLogger(
          showLogs: true,
          showErrorLogs: true), //ApiKeys instance with your keys,
    );
    Map trendingResult = await tmdb.v3.tv.getPouplar();
    Map topRatedResult = await tmdb.v3.tv.getTopRated();
    // Map latestResult = await tmdb.v3.tv.getLatest();
    Map tvResult = await tmdb.v3.tv.getAiringToday();

    setState(() {
      trending = trendingResult['results'];
      topRated = topRatedResult['results'];
      // latest = latestResult['results'];
      airingToday = tvResult['results'];
    });

  }

  @override
  void initState() {
    loadShows();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var indexRandom = random.nextInt(10);
    return Scaffold(
      appBar: AppBar(
        title: const Text('TV Shows'),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Icon(Icons.widgets),
          )
        ],
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
                  height: MediaQuery.of(context).size.height - 300,
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
                                Api.imageUrl +
                                    trending[indexRandom]['poster_path'],
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
                        onPressed: () => Get.bottomSheet(SingleChildScrollView(
                            child: BottomModal(
                              title: trending[indexRandom]['title'] ?? 'No data',
                              image: Api.imageUrl +
                                  trending[indexRandom]['poster_path'],
                              date: trending[indexRandom]['release_date'] ??
                                  'no data',
                              rating: trending[indexRandom]['vote_average'] ?? 0,
                              desc: trending[indexRandom]['overview'] ??
                                  'No description available', onTap: () {  },
                            ))),
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
                          borderRadius: BorderRadius.all(Radius.circular(8.0))),
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
                                date: topRated[index]['release_date'] ?? 'No data',
                                rating: topRated[index]['vote_average'] ?? 0,
                                desc: topRated[index]['overview'] ?? 'No data', onTap: () {  },
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
                                image:
                                Api.imageUrl + trending[index]['poster_path'],
                                date: trending[index]['release_date'] ?? 'no data',
                                rating: trending[index]['vote_average'] ?? 0,
                                desc: trending[index]['overview'] ??
                                    'No description available', onTap: () {  },
                              )),
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
            // const Padding(
            //   padding: EdgeInsets.only(left: 10),
            //   child: Text(
            //     'Popular Shows',
            //     style: TextStyle(fontWeight: FontWeight.bold),
            //   ),
            // ),
            // SizedBox(
            //   height: 150,
            //   width: double.infinity,
            //   child: ListView.builder(
            //       itemCount: latest.length,
            //       scrollDirection: Axis.horizontal,
            //       itemBuilder: (context, index) {
            //         return Container(
            //           decoration: const BoxDecoration(
            //               borderRadius: BorderRadius.all(Radius.circular(8.0))),
            //           padding: const EdgeInsets.symmetric(
            //               horizontal: 3.0, vertical: 8.0),
            //           width: 100,
            //           child: GestureDetector(
            //             onTap: () => Get.bottomSheet(
            //               SingleChildScrollView(
            //                   child: BottomModal(
            //                     title: latest[index]['title'] ?? 'No data',
            //                     image: Api.imageUrl + latest[index]['poster_path'],
            //                     date: latest[index]['release_date'] ?? 'no data',
            //                     rating: latest[index]['vote_average'] ?? 0,
            //                     desc: latest[index]['overview'] ??
            //                         'No description available', onTap: () {  },
            //                   )),
            //             ),
            //             child: ClipRRect(
            //                 borderRadius: BorderRadius.circular(6.0),
            //                 child: Image.network(
            //                     Api.imageUrl + latest[index]['poster_path'],
            //                     fit: BoxFit.cover)),
            //           ),
            //         );
            //       }),
            // ),
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
                  itemCount: airingToday.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8.0))),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 3.0, vertical: 8.0),
                      width: 100,
                      child: GestureDetector(
                        onTap: () => Get.bottomSheet(
                          SingleChildScrollView(
                              child: BottomModal(
                                title: airingToday[index]['title'] ?? 'No data',
                                image: Api.imageUrl + airingToday[index]['poster_path'],
                                date: airingToday[index]['release_date'] ?? 'no data',
                                rating: airingToday[index]['vote_average'] ?? 0,
                                desc: airingToday[index]['overview'] ??
                                    'No description available', onTap: () {  },
                              )),
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(6.0),
                            child: Image.network(
                                Api.imageUrl + airingToday[index]['poster_path'],
                                fit: BoxFit.cover)),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
