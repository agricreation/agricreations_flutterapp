import 'package:get/get.dart';
import '../class/http.dart';
import '../class/videocard.dart';

class VideoPlaying extends GetxController {
  RxList<YouTubeVideo> videoPlaying = <YouTubeVideo>[].obs;

  void createAndSetVideo() {
    // Create a new instance of YouTubeVideo
    // YouTubeVideo newVideo = YouTubeVideo();

    // Clear existing items and add the new video
    videoPlaying.clear();
    // videoPlaying.add(newVideo);
  }
}
