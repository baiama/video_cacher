import 'package:flutter/material.dart';
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
    _controller = VideoPlayerController.network(
        'https://www.dropbox.com/s/oc03mz30413sfel/clouds.mp4')
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
            ? ElevatedButton(onPressed: () {}, child: const Text('play video'))
            : Container(),
      ),
    );
  }
}
