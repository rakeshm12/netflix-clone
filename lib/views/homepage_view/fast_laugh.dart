
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class FastLaughs extends StatefulWidget {
  const FastLaughs({Key? key}) : super(key: key);



  @override
  _FastLaughsState createState() => _FastLaughsState();
}

class _FastLaughsState extends State<FastLaughs> {
  late VideoPlayerController controller;
  bool isChanged = true;


  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset('assets/sample-mp4-file.mp4')
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => controller.play());
  }

  @override
  Widget build(BuildContext context) {
    final isVolume = controller.value.volume == 0;
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            controller != null && controller.value.isInitialized
                ? InkWell(
                    onTap: () => controller.value.isPlaying
                        ? controller.pause()
                        : controller.play(),
                    child: VideoPlayer(controller))
                : const Center(child: CircularProgressIndicator()),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      controller.setVolume(isVolume ? 1 : 0);
                    },
                    icon: Icon(
                      isVolume ? Icons.volume_off : Icons.volume_up,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  controller.value.isPlaying
                      ? Container()
                      : const Center(
                          child: Icon(
                          Icons.play_arrow,
                          size: 80,
                          color: Colors.white,
                        )),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const CircleAvatar(
                        radius: 25.0,
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            isChanged = !isChanged;
                          });
                        },
                        child: Column(
                          children: [
                            isChanged ? const FaIcon(
                            FontAwesomeIcons.laughBeam ,
                              color: Colors.white,
                            ) : const FaIcon(
                              FontAwesomeIcons.grinTears ,
                              color: Colors.yellow,
                            ),
                            const Text(
                              '35.6K',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
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
                      TextButton(
                        onPressed: () {},
                        child: Column(
                          children: const [
                            Icon(
                              Icons.send,
                              color: Colors.white,
                            ),
                            Text(
                              '1.19K',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Column(
                          children: const [
                            Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                            ),
                            Text(
                              'Play',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}
