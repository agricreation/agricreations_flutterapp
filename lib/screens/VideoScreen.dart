import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';

class VideoScreen extends StatelessWidget {
  final String videoUrl;
  final String logo;
  final String text;
  final String channelname;
  final String channelId;
  var shouldHideAppBar = true;

  VideoScreen({required this.videoUrl, required this.logo, required this.text, required this.channelname, required this.channelId});

  @override
  Widget build(BuildContext context) {
     Future<void> _launchURL(String url) async {
        if (await canLaunchUrl(Uri.parse(url))) {
          await launchUrl(Uri.parse(url));
        } else {
          throw 'Could not launch $url';
        }
      }
    final videoId = YoutubePlayer.convertUrlToId("https://www.youtube.com/watch?v=$videoUrl");
    return Scaffold(
     appBar: shouldHideAppBar ? null : AppBar(
        title: Text("Video Screen"),
      ),
      body: SafeArea(
        child: Column(
          children: [
          YoutubePlayer(
            controller: YoutubePlayerController(
              initialVideoId: videoId ?? 'uGuJbpWsL6k&t=118s',
              flags: YoutubePlayerFlags(
                autoPlay: false,
                mute: false,
                controlsVisibleAtStart: false,
                hideThumbnail: false,
                showLiveFullscreenButton: true,
                enableCaption: true,
                isLive: false,
              ),
            ),
            showVideoProgressIndicator: true,
          ),
         ListTile(
          contentPadding: EdgeInsets.all(10),
          title: Text(text),
         ),
         Container(
           decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey.withOpacity(0.5), 
                  width: 1.0, 
                ),
                top: BorderSide(
                  color: Colors.grey.withOpacity(0.5), 
                  width: 1.0,
                 ),
              ),
            ),
           child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
            leading: Image.network(logo,
            width: 50,
            height: 50,
            ),
            title: Text(channelname.toUpperCase() ?? "Agricreations", style: 
            TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
            ),
            trailing:ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: <Color>[
                              Colors.transparent,
                              Colors.transparent,
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.red,
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                        textStyle: const TextStyle(fontSize: 15),
                      ),
                      onPressed: () {
                      _launchURL('https://www.youtube.com/channel/$channelId?sub_confirmation=1');
                      },
                      child: const Text('Subscribe'),
                    ),
                  ],
                ),
              ),
           ),
         ),
         Container(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
           child: Align(
            alignment: Alignment.topLeft,
             child: Text("Videos That you like", style: TextStyle(
              fontSize: 20,
              color: Colors.black87,
             ),),
           ),
         ),
         Container(
            
         ),
        ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        Get.back();
        },
        child: const Icon(Icons.arrow_back),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
