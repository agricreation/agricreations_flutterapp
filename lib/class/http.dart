import 'package:http/http.dart' as http;
import 'dart:convert';
import '../class/videocard.dart';

Future<List<YouTubeVideo>> fetchVideosOf() async {
  const String apiUrl = "https://apis.agricreations.com";
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
          channelLogo: videoData['snippet']['channellogo'],
          videoType: videoData['snippet']['type'],
          category: videoData['snippet']['category'],
          islive: videoData['snippet']['islive'],
          channelname: videoData['snippet']['channelTitle'],
          channelId: videoData['snippet']['channelId'],
        );
        videos.add(video);
      }
    return videos;
  } else {
    return []; 
  }
}
