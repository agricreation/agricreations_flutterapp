import 'package:get/get.dart';
import '../class/http.dart';
import '../class/videocard.dart';

class DataController extends GetxController {
  RxList<YouTubeVideo> dataList = <YouTubeVideo>[].obs;
  List listOfCatogries = [];
  // Function to fetch data from the API
  Future<void> fetchDataFromApi() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      List<YouTubeVideo> videos = await fetchVideosOf();
      dataList.value = videos; // Directly assign the new list
      for (var video in videos) {
        var category = video.category;
        if (!listOfCatogries.contains(category)) {
          listOfCatogries.add(category);
        } else {}
      }
    } catch (error) {
      rethrow;
    }
  }
}
