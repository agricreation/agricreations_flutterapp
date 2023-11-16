import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';
import './getx_controller/data_controller.dart';
import './getx_controller/drawer_controller.dart';
import './screens/VideoScreen.dart';

void main() {
  runApp(const GetMaterialApp(
    // home: VideoScreen(videoUrl: "uGuJbpWsL6k&t=118s"),
    home: MyApp(),
    // runApp(const MyApp());
  ));
}

// runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(secondary: const Color.fromARGB(255, 42, 42, 42)),
      ),
      home: const MyHomePage(title: 'Agri Creations'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {

    Future<void> _launchURL(String url) async {
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      } else {
        throw 'Could not launch $url';
      }
    }

    final DataController dataController = Get.put(DataController());
    dataController.fetchDataFromApi();

    final NavbarController drawerController = Get.put(NavbarController());
    drawerController.facebookUrl;
    return Scaffold(
      backgroundColor: Colors.black26,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.short_text),
            label: 'shorts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'First Tab',
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text("Agricreations"),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Agri Creations',
                    style: TextStyle(color: Colors.white),
                  ),
                  const Text(
                    "Cultivating Excellence in Web Development and Video Editing: Agricreations, Where Innovation Grows",
                    style: TextStyle(color: Colors.white),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () => _launchURL(
                            'https://www.facebook.com/moovendhan.agriculture/'),
                        child: const FaIcon(
                          FontAwesomeIcons.facebook,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _launchURL(
                            'https://www.instagram.com/moovendhan_agricreations/'),
                        child: const FaIcon(
                          FontAwesomeIcons.instagram,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _launchURL(
                            'https://api.whatsapp.com/send/?phone=%2B918300470783&text&type=phone_number&app_absent=0'),
                        child: const FaIcon(
                          FontAwesomeIcons.whatsapp,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _launchURL(
                            'https://www.linkedin.com/in/moovendhanv'),
                        child: const FaIcon(
                          FontAwesomeIcons.linkedin,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _launchURL('https://t.me/Moovendhanagri'),
                        child: const FaIcon(
                          FontAwesomeIcons.telegram,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _launchURL(
                            'https://bestappsintamil.agricreations.com/'),
                        child: const FaIcon(
                          FontAwesomeIcons.blogger,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text('Hkr agri techs'),
              leading: const FaIcon(
                FontAwesomeIcons.youtube,
                color: Colors.red,
              ),
              onTap: () {
                // _launchURL('https://www.youtube.com/@HkragritechsYt');
              },
            ),
            ListTile(
              title: const Text('Best apps in Tamil'),
              leading: const FaIcon(
                FontAwesomeIcons.youtube,
                color: Colors.red,
              ),
              onTap: () {
                // _launchURL('https://www.youtube.com/@bestappsintamil');
              },
            ),
          ],
        ),
      ),
      body: Obx(() {
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
                      'Your Title Here',
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
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Get.to(() => VideoScreen(videoUrl: "uGuJbpWsL6k&t=118s"));
          // _launchURL('https://www.agricreations.com/'); // Replace with your desired URL
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.web_stories_outlined),
      ),
    );
  }
}

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
    final videoId = YoutubePlayer.convertUrlToId(
        "https://www.youtube.com/watch?v=$videoUrl");
    Future<void> _launchURL(String url) async {
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
                          videoUrl: videoUrl,
                          logo: logo,
                          text: title,
                          channelname: channelTitle,
                          channelId: channelId,
                        ),
                    transition: Transition.downToUp,
                    duration: const Duration(milliseconds: 500));
              },
              child: SizedBox(
                width: double.infinity,
                child: Image.network(
                  thumbnail,
                  fit: BoxFit.cover,
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
                    _launchURL('https://www.youtube.com/watch?v=$videoUrl'),
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
