import 'package:flutter/material.dart';
import 'package:video_cacher/controller_player/video_list_view.dart';
import 'package:video_cacher/models/test_videos.dart';
import 'package:video_player/video_player.dart';

class VideoLoaderView extends StatefulWidget {
  const VideoLoaderView({Key? key}) : super(key: key);

  @override
  State<VideoLoaderView> createState() => _VideoLoaderViewState();
}

class _VideoLoaderViewState extends State<VideoLoaderView> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    initController();
  }

  void initController() {
    _controller = VideoPlayerController.network(TestVideoUrls.getRandomVideo())
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: _controller.value.isInitialized
            ? ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VideoListView(
                        controller: _controller,
                      ),
                    ),
                  ).then((value) {
                    initController();
                  });
                },
                child: const Text('play video'))
            : Container(),
      ),
    );
  }
}
