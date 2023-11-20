import 'package:agricreations_app/getx_controller/data_controller.dart';
import 'package:agricreations_app/getx_controller/videoplaying_screen_controller.dart';
import 'package:agricreations_app/widget/bottom_nav_bar.dart';
// import 'package:agricreations_app/widget/video_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoScreen extends StatelessWidget {
  final shouldHideAppBar = true;
  final int index;

  const VideoScreen({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> launchURL(String url) async {
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      } else {
        throw 'Could not launch $url';
      }
    }

    final DataController dataController = Get.put(DataController());
    // dataController.fetchDataFromApi();
    final VideoPlaying videoPlayingController = Get.put(VideoPlaying());

    videoPlayingController.vidoePlayingIndex = index;

    return Scaffold(
      bottomNavigationBar: const BottomNavigationbar(),
      appBar: shouldHideAppBar
          ? null
          : AppBar(
              title: const Text("Video Screen"),
            ),
      body: SafeArea(
        child: Obx(
          () {
            final indexForVideo = videoPlayingController.vidoePlayingIndex;
            final videoIds = YoutubePlayer.convertUrlToId(
                "https://www.youtube.com/watch?v=${dataController.dataList[indexForVideo].id}");
            return Column(
              children: [
                YoutubePlayer(
                  controller: YoutubePlayerController(
                    initialVideoId: videoIds ?? "",
                    flags: const YoutubePlayerFlags(
                      autoPlay: true,
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
                  contentPadding: const EdgeInsets.all(10),
                  title: Text(dataController.dataList[indexForVideo].title),
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
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                    leading: Image.network(
                      dataController.dataList[indexForVideo].channelLogo,
                      width: 50,
                      height: 50,
                    ),
                    title: Text(
                      dataController.dataList[indexForVideo].channelname
                          .toUpperCase(),
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: ClipRRect(
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 0),
                              textStyle: const TextStyle(fontSize: 15),
                            ),
                            onPressed: () {
                              videoPlayingController.vidoePlayingIndex = 3;
                              // launchURL(
                              //     'https://www.youtube.com/channel/${dataController.dataList[indexForVideo].channelId}?sub_confirmation=1');
                            },
                            child: const Text('Subscribe'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Container(
                //   padding:
                //       const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                //   child: const Align(
                //     alignment: Alignment.topLeft,
                //     child: Text(
                //       "Videos That you like",
                //       style: TextStyle(
                //         fontSize: 20,
                //         color: Colors.black87,
                //       ),
                //     ),
                //   ),
                // ),
                // Expanded(
                //   child: ListView.builder(
                //     itemCount: dataController.dataList.length,
                //     itemBuilder: (context, index) {
                //       return VideoCard(
                //         videoUrl: dataController.dataList[index].id,
                //         index: index,
                //         title: dataController.dataList[index].title,
                //         thumbnail: dataController.dataList[index].thumbnailUrl,
                //         logo: dataController.dataList[index].channelLogo,
                //         videoType: dataController.dataList[index].videoType,
                //         categories: dataController.dataList[index].category,
                //         islive: dataController.dataList[index].islive,
                //         channelTitle:
                //             dataController.dataList[index].channelname,
                //         channelId: dataController.dataList[index].channelId,
                //       );
                //     },
                //   ),
                // ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.back();
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
