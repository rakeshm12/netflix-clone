import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix_ui/services/api_data.dart';
import 'package:tmdb_api/tmdb_api.dart';

class Games extends StatefulWidget {
  const Games({Key? key}) : super(key: key);

  @override
  State<Games> createState() => _GamesState();
}

class _GamesState extends State<Games> {
  List games = [];
  final random = Random();

  loadComingSoon() async {
    final tmDbInstance = TMDB(
      ApiKeys(Api.apiKey, Api.accessToken),
      logConfig: ConfigLogger(
          showLogs: true,
          showErrorLogs: true), //ApiKeys instance with your keys,
    );
    Map result = await tmDbInstance.v3.movies.getUpcoming();

    setState(() {
      games = result['results'];
    });
  }

  @override
  void initState() {
    loadComingSoon();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final randomIndex = random.nextInt(10);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('Games'),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.widgets)),
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 300,
                  child: ListView.builder(
                      itemCount: games.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            child: Image.network(
                              Api.imageUrl + games[randomIndex]['poster_path'],
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 120.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: games.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 100.0,
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            child: Image.network(
                              Api.imageUrl + games[index]['poster_path'],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            Api.imageUrl + games[index]['backdrop_path']),
                      ),
                    ),
                  ),
                );
              },
              childCount: games.length,
            ),
          ),
        ],
      ),
    );
  }
}
