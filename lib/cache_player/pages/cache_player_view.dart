import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:video_cacher/cache_player/logic/cache_service.dart';
import 'package:video_cacher/cache_player/pages/cache_list_player.dart';
import 'package:video_cacher/models/test_videos.dart';

class CachePlayerView extends StatefulWidget {
  const CachePlayerView({Key? key}) : super(key: key);

  @override
  State<CachePlayerView> createState() => _CachePlayerViewState();
}

class _CachePlayerViewState extends State<CachePlayerView> {
  bool loading = false;
  late File file;
  @override
  void initState() {
    loading = true;
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      loadVideo();
    });
  }

  void loadVideo() async {
    String url = TestVideoUrls.getRandomVideo();
    FileInfo info = await CacheService.instance.downloadFile(url);
    print(info.originalUrl);
    print(info.file.path);
    file = info.file;
    loading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!loading)
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CacheListPlayer(file: file),
                    ),
                  );
                },
                child: const Text('video'),
              ),
          ],
        ),
      ),
    );
  }
}
