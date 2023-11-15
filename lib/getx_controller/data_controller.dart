import 'package:get/get.dart';
import '../class/http.dart';
import '../class/videocard.dart';

class DataController extends GetxController {
  RxList<YouTubeVideo> dataList = <YouTubeVideo>[].obs; // Change the type here

  // Function to fetch data from the API
  Future<void> fetchDataFromApi() async {
    try {
      await Future.delayed(Duration(seconds: 1));
      List<YouTubeVideo> videos = await fetchVideosOf();
      dataList.value = videos; // Directly assign the new list
      print('Data fetched successfully: $videos');
      print("datalist $dataList");
    } catch (error) {
      print('Error fetching data: $error');
    }
  }
}
