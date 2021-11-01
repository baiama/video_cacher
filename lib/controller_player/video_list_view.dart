import 'package:flutter/material.dart';
import 'package:video_cacher/models/test_videos.dart';
import 'package:video_player/video_player.dart';

class VideoListView extends StatefulWidget {
  const VideoListView({Key? key}) : super(key: key);

  @override
  State<VideoListView> createState() => _VideoListViewState();
}

class _VideoListViewState extends State<VideoListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: TestVideoUrls.videos.length,
        itemBuilder: (context, index) {
          return VideoPLayerItem(url: TestVideoUrls.videos[index].videUrl);
        },
      ),
    );
  }
}

class VideoPLayerItem extends StatefulWidget {
  final VideoPlayerController? controller;
  final String url;
  const VideoPLayerItem({
    Key? key,
    this.controller,
    required this.url,
  }) : super(key: key);

  @override
  State<VideoPLayerItem> createState() => _VideoPLayerItemState();
}

class _VideoPLayerItemState extends State<VideoPLayerItem> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    if (widget.controller != null) {
      _controller = widget.controller!;
    } else {
      _controller = VideoPlayerController.network(widget.url)
        ..initialize().then((_) {
          setState(() {});
        });
    }
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
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : Container(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
