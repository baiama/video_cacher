import 'package:flutter/material.dart';
import 'package:video_cacher/models/test_videos.dart';
import 'package:video_player/video_player.dart';

class VideoListView extends StatelessWidget {
  final VideoPlayerController controller;
  const VideoListView({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: TestVideoUrls.videos.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            return VideoPLayerItem(
              url: TestVideoUrls.videos[index].videUrl,
              controller: controller,
            );
          }
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
      _controller.play();
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
    if (widget.controller != null) {
      widget.controller!.dispose();
    }
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
