import 'package:flutter/material.dart';
import 'cache_player/pages/cache_player_view.dart';
import 'controller_player/video_controller_view.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const VideoLoaderView()));
              },
              child: const Text('Play via controller'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CachePlayerView()));
              },
              child: const Text('Cache manager'),
            )
          ],
        ),
      ),
    );
  }
}
