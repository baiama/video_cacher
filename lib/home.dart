import 'package:flutter/material.dart';
import 'package:video_cacher/player.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (contex) => VideoListView()));
          },
          child: Text('Play view'),
        ),
      ),
    );
  }
}
