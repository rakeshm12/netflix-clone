import 'package:flutter/material.dart';
import 'package:netflix_ui/services/api_service.dart';
import 'package:netflix_ui/widgets/custom_button.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieInfo extends StatefulWidget {
  const MovieInfo({Key? key, required this.id}) : super(key: key);

  final int id;

  @override
  _MovieInfoState createState() => _MovieInfoState();
}

class _MovieInfoState extends State<MovieInfo> {
  late YoutubePlayerController controller;
  late Future video;
  late Future details;

  @override
  void initState() {
    video = ApiManager().getVideos(widget.id);
    details = ApiManager().getVideoDetails(widget.id);
    controller = YoutubePlayerController(initialVideoId: '');
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: FutureBuilder(
          future: video,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              controller = YoutubePlayerController(
                initialVideoId: snapshot.data.toString(),
                flags: const YoutubePlayerFlags(
                  controlsVisibleAtStart: true,
                  autoPlay: true,
                  mute: false,
                ),
              );
              return ListView(
                children: [
                  YoutubePlayerBuilder(
                    player: YoutubePlayer(
                      controller: controller,
                    ),
                    builder: (context, player) {
                      return player;
                    },
                  ),
                  FutureBuilder(
                      future: details,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List data = [snapshot.data];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 15,),
                                Text(data[0]['original_title'] ?? 'Title', style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                                CustomButton(onTap: (){}, text: const Text('▶ Play', style: TextStyle(color: Colors.white, fontSize: 18),), padding: 12),
                                CustomButton(onTap: (){}, text: const Text('Download', style: TextStyle(color: Colors.white, fontSize: 18),), padding: 12),
                                Text(data[0]['overview'] ?? 'Title'),
                              ],
                            ),
                          );
                        }
                        if (snapshot.hasError) {
                          return const Text('No data to show');
                        } else {
                          return Container();
                        }
                      })
                ],
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Loading.. Please wait..')
                  ],
                ),
              );
            } else {
              return const Center(
                  child: Text('Something went wrong.. Try Later..'));
            }
          },
        ),
      ),
    );
  }
}
