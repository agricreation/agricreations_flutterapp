import 'package:agricreations_app/class/http.dart';
import 'package:agricreations_app/getx_controller/data_controller.dart';
import 'package:agricreations_app/getx_controller/videoplaying_screen_controller.dart';
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

    bool isDescriptionFetched = false;

    return Scaffold(
      // bottomNavigationBar: const BottomNavigationbar(),
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
            return SingleChildScrollView(
              child: Column(
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
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 0),
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
                                launchURL(
                                    'https://www.youtube.com/channel/${dataController.dataList[indexForVideo].channelId}?sub_confirmation=1');
                              },
                              child: const Text('Subscribe'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 22),
                          child: Text(
                            "Description",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 400,
                        width: double.infinity,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () async {
                                // avoid to send api multiple times
                                if (!isDescriptionFetched) {
                                  dataController
                                          .dataList[indexForVideo].description =
                                      await getVideoDescription(dataController
                                              .dataList[indexForVideo].id) ??
                                          "Fetching description failed";
                                  isDescriptionFetched = true;
                                  //manually refreshing
                                  dataController.dataList.refresh();
                                }
                              },
                              child: Container(
                                color: Colors.grey.shade100,
                                child: ListView(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        dataController.dataList[indexForVideo]
                                            .description,
                                      ),
                                    ),
                                    const Align(
                                      alignment: Alignment.topRight,
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text("load More"),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
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
