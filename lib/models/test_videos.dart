import 'dart:math';

class TestVideoUrls {
  final String videUrl;

  TestVideoUrls(this.videUrl);

  static List<TestVideoUrls> videos = [
    TestVideoUrls(
        "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"),
    TestVideoUrls(
        "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4"),
    TestVideoUrls(
        "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4"),
    TestVideoUrls(
        "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4"),
    TestVideoUrls(
        "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4"),
    TestVideoUrls(
        "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4"),
    TestVideoUrls(
        'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4'),
    TestVideoUrls(
        'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4'),
    TestVideoUrls(
        'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/SubaruOutbackOnStreetAndDirt.mp4'),
    TestVideoUrls(
        'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4'),
  ];

  static String getRandomVideo() {
    final rng = Random();
    return videos[rng.nextInt(videos.length)].videUrl;
  }
}
