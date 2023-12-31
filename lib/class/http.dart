import 'dart:convert';

import 'package:http/http.dart' as http;

import '../class/videocard.dart';

Future<String?> getVideoDescription(String videoId) async {
  const apiKey = 'AIzaSyBG7YBeYmcINh0XGBJ52IFOHHfse9cXFrg';
  final url =
      'https://www.googleapis.com/youtube/v3/videos?part=snippet%2CcontentDetails&id=$videoId&key=$apiKey';

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    final items = data['items'];
    if (items != null && items.isNotEmpty) {
      final description = items[0]['snippet']['description'];
      return description;
    }
  }
  return null;
}

Future<List<YouTubeVideo>> fetchVideosOf() async {
  const String apiUrl = "https://youtubeapi.agricreations.com";
  final response = await http.get(Uri.parse(apiUrl));
  if (response.statusCode == 200) {
    List<YouTubeVideo> videos = [];
    String data = response.body;
    var jsonData = jsonDecode(data);
    for (var videoData in jsonData) {
      if(videoData['snippet']['islive'] == "0"){
        
      }else{
         YouTubeVideo video = YouTubeVideo(
        id: videoData['id']['videoId'],
        title: videoData['snippet']['title'],
        description: videoData['snippet']['description'],
        thumbnailUrl: videoData['snippet']['thumbnails']['high']['url'],
        videoUrl: videoData['id']['videoId'],
        channelLogo: videoData['snippet']['channellogo'],
        videoType: videoData['snippet']['type'],
        category: videoData['snippet']['category'],
        islive: videoData['snippet']['islive'],
        channelname: videoData['snippet']['channelTitle'],
        channelId: videoData['snippet']['channelId'],
      );
      videos.add(video);
      }
    }
    return videos;
  } else {
    return [];
  }
}
