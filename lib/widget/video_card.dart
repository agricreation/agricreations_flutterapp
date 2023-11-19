import 'package:agricreations_app/getx_controller/data_controller.dart';
import 'package:agricreations_app/screens/VideoScreen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class VideoCard extends StatelessWidget {
  final String videoUrl;
  final int index;
  final String title;
  final String thumbnail;
  final String logo;
  final String videoType;
  final String categories;
  final String islive;
  final String channelTitle;
  final String channelId;

  const VideoCard({
    Key? key,
    required this.videoUrl,
    required this.index,
    required this.title,
    required this.thumbnail,
    required this.logo,
    required this.videoType,
    required this.categories,
    required this.islive,
    required this.channelTitle,
    required this.channelId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

     DataController dataController = Get.find<DataController>();

    Future<void> launchURL(String url) async {
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      } else {
        throw 'Could not launch $url';
      }
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.black,
        elevation: 4,
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Get.to(
                    () => VideoScreen(
                          index : index,
                        ),
                    transition: Transition.downToUp,
                    duration: const Duration(milliseconds: 500));
              },
              child: SizedBox(
                width: double.infinity,
                child: CachedNetworkImage(
                  imageUrl: thumbnail,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Center(
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: CircularProgressIndicator()),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(10),
              title: Text(
                title,
                style: const TextStyle(color: Colors.white),
              ),
              leading: Image.network(
                logo,
                width: 40,
                height: 40,
              ),
              trailing: GestureDetector(
                onTap: () =>
                    launchURL('https://www.youtube.com/watch?v=$videoUrl'),
                child: videoType == 'normal'
                    ? const FaIcon(
                        FontAwesomeIcons.youtube,
                        color: Colors.red,
                      )
                    : const FaIcon(
                        FontAwesomeIcons.heartCircleCheck,
                        color: Colors.red,
                      ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey
                        .withOpacity(0.5), // Border color with reduced opacity
                    width: 2.0, // Border width
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
