
import 'package:flutter/material.dart';
import 'package:netflix_ui/models/services/api_data.dart';
import 'package:tmdb_api/tmdb_api.dart';

class ComingSoon extends StatefulWidget {
   const ComingSoon({Key? key}) : super(key: key);

  @override
  State<ComingSoon> createState() => _ComingSoonState();
}

class _ComingSoonState extends State<ComingSoon> {
  List comingSoon = [];

  loadComingSoon() async {
    final tmDbInstance = TMDB(
      ApiKeys(Api.apiKey, Api.accessToken),
      logConfig: ConfigLogger(
          showLogs: true,
          showErrorLogs: true), //ApiKeys instance with your keys,
    );
    Map result = await tmDbInstance.v3.movies.getUpcoming();


    setState(() {
      comingSoon = result['results'];
    });

  }

  @override
  void initState() {
    loadComingSoon();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            collapsedHeight: 100,
            expandedHeight: 60,
            title: const Text('Coming Soon'),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.cast)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.widgets)),
            ],
            bottom: PreferredSize(
              preferredSize: Size.zero,
              child: Row(
                children: const [
                  Expanded(
                    child: ListTile(
                      leading: Icon(Icons.notifications_none),
                      title: Text('Notifications'),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                Api.imageUrl + comingSoon[index]['backdrop_path']
                            ),
                        ),
                      ),
                    ),
                  );
              },
              childCount: comingSoon.length,
            ),
          ),
        ],
      ),
    );
  }
}
