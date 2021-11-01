import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_cacher/models/test_videos.dart';
import 'package:video_player/video_player.dart';

class CacheListPlayer extends StatelessWidget {
  final File file;
  const CacheListPlayer({
    Key? key,
    required this.file,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          itemCount: TestVideoUrls.videos.length,
          itemBuilder: (context, index) {
            if (index == 0) {
              return CacheListPlayerItem(
                url: '',
                file: file,
              );
            }
            return CacheListPlayerItem(
                url: TestVideoUrls.videos[index].videUrl, file: null);
          }),
    );
  }
}

class CacheListPlayerItem extends StatefulWidget {
  final String url;
  final File? file;
  const CacheListPlayerItem({Key? key, required this.url, this.file})
      : super(key: key);

  @override
  State<CacheListPlayerItem> createState() => _CacheListPlayerItemState();
}

class _CacheListPlayerItemState extends State<CacheListPlayerItem> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    if (widget.file != null) {
      _controller = VideoPlayerController.file(widget.file!)
        ..initialize().then((_) {
          setState(() {});
        });
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
