import 'package:agricreations_app/const/config.dart';
import 'package:agricreations_app/getx_controller/data_controller.dart';
import 'package:agricreations_app/getx_controller/drawer_controller.dart';
import 'package:agricreations_app/widget/app_drawer.dart';
import 'package:agricreations_app/widget/app_drawer_list.dart';
import 'package:agricreations_app/widget/bottom_nav_bar.dart';
import 'package:agricreations_app/widget/video_card.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

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
    dataController.fetchDataFromApi();

    List catogries = dataController.listOfCatogries;

    final NavbarController drawerController = Get.put(NavbarController());

    drawerController.kUrl;
    return Scaffold(
      backgroundColor: Colors.black26,
      bottomNavigationBar: const BottomNavigationbar(),
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: kgradientColors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: CachedNetworkImage(
          imageUrl: ksubLogo,
          fit: BoxFit.cover, // Adjust BoxFit as needed
          // placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: kgradientColors,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: AppDrawer(),
            ),
            AppDrawerList()
          ],
        ),
      ),
      body: Obx(
        () {
          return dataController.dataList.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Updates From agricreations',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: dataController.dataList.length,
                        itemBuilder: (context, index) {
                          return VideoCard(
                            videoUrl: dataController.dataList[index].id,
                            index: index,
                            title: dataController.dataList[index].title,
                            thumbnail:
                                dataController.dataList[index].thumbnailUrl,
                            logo: dataController.dataList[index].channelLogo,
                            videoType: dataController.dataList[index].videoType,
                            categories: dataController.dataList[index].category,
                            islive: dataController.dataList[index].islive,
                            channelTitle:
                                dataController.dataList[index].channelname,
                            channelId: dataController.dataList[index].channelId,
                          );
                        },
                      ),
                    ),
                  ],
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Get.to(() => VideoScreen(videoUrl: "uGuJbpWsL6k&t=118s"));
          launchURL(
              'https://www.agricreations.com/'); // Replace with your desired URL
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.web_stories_outlined),
      ),
    );
  }
}
