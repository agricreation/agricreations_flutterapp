import 'package:flutter/material.dart';

class YouTubeVideo {
  final String id; // Video ID
  final String title; // Video title
  final String thumbnailUrl; // Video thumbnail URL
  final String videoUrl; // Video URL

  YouTubeVideo({
    required this.id,
    required this.title,
    required this.thumbnailUrl,
    required this.videoUrl,
  });
}

//   factory YouTubeVideo.fromJson(Map<String, dynamic> json) {
//     // Extract relevant data from the API response and create a YouTubeVideo object
//     return YouTubeVideo(
//       id: json['id']['videoId'],
//       title: json['snippet']['title'],
//       thumbnailUrl: json['thumbnails']['high']['url'],
//       videoUrl: json['id']['videoId'],
//     );
//   }
// }
// // Example API response for demonstration purposes
// final Map<String, dynamic> apiResponse = {
//   'id': 'videoID123',
//   'title': 'Video Title',
//   'thumbnailUrl': 'https://www.agricreations.com/assets/img/logo.png',
//   'videoUrl': 'https://www.youtube.com/watch?v=MRvty0llojA',
// };

// Creating a YouTubeVideo object from the API response
// final YouTubeVideo video = YouTubeVideo.fromJson(apiResponse);



