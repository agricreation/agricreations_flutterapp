import 'package:http/http.dart' as http;
import 'dart:convert';
import '../class/videocard.dart';

Future<void> fetchHkrAgriTechData() async {
  final String apiUrl = 'https://www.googleapis.com/youtube/v3/search'
      '?part=snippet'
      // '&q=agriculture' 
      '&channelId=UCSjSmjY9cEI_ib-NrBElVXw'
      '&maxResults=10' 
      '&key=AIzaSyDbEgadnqHQCSVitn2tsnQsY1HXsfsS0dM';
  final response = await http.get(Uri.parse(apiUrl));
  if (response.statusCode == 200) {
    String data = response.body;
    var jsonData = jsonDecode(data);

    // YouTubeVideo video = YouTubeVideo.fromJson(apiResponse);
    // video.videoUrl = jsonData['items'][0];

    print("data ${jsonData['items'][0]}");
    // var categories = jsonData['categories']; 
    // result = categories;
  } else {
    print('Failed to load data: ${response.statusCode}');
  }
}

Future<List<YouTubeVideo>> fetchVideosOf() async {
  final String apiUrl = "https://apis.agricreations.com";
  final response = await http.get(Uri.parse(apiUrl));
  if (response.statusCode == 200) {
    List<YouTubeVideo> videos = [];
    String data = response.body;
    var jsonData = jsonDecode(data);
     for (var videoData in jsonData) {
        YouTubeVideo video = YouTubeVideo(
          id:videoData['id']['videoId'],
          title:videoData['snippet']['title'],
          thumbnailUrl: videoData['snippet']['thumbnails']['high']['url'],
          videoUrl:videoData['id']['videoId'],
          channelLogo: videoData['snippet']['channellogo']
        );
        videos.add(video);
      }
    return videos;
  } else {
    print('Failed to load data: ${response.statusCode}');
    return []; 
  }
}
