import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'class/videocard.dart';
import 'class/http.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(secondary: Colors.white),
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

    // final List<String> videoUrls = [
    //   'https://youtu.be/qKYzsAVqaOc?si=IcDmB1kkm__5WmC0',
    //   'https://youtu.be/auRbPM9IndM?si=Z50AlE5RNxFVAJWn',
    //   'https://youtu.be/e5PLy52bUWw?si=6NCzJ1IWbO4IOuhV',
    //   'https://youtu.be/O2K9rBAgE0k?si=RP8bLDdxdv3SUrTd',
    //   'https://youtu.be/oXxQmeurDUM?si=TvicyMbf6xPSOd8T',
    // ];

        Future<List<YouTubeVideo>> fetchVideosFromApi() async {
          final List<YouTubeVideo> videoUrls = await fetchVideosOf();
          return videoUrls;
        }

    Future<void> _launchURL(String url) async {
        if (await canLaunchUrl(Uri.parse(url))) {
          await launchUrl(Uri.parse(url));
        } else {
          throw 'Could not launch $url';
        }
      }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text("Agricreations"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Agri Creations',
                style: TextStyle(color: Colors.white),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Hkr agri techs'),
              onTap: () {
                // Define actions for the first menu item
              },
            ),
            ListTile(
              title: Text('Best apps in Tamil'),
              onTap: () {
                // Define actions for the second menu item
              },
            ),
          ],
        ),
      ),
        body:FutureBuilder<List<YouTubeVideo>>(
          future: fetchVideosFromApi(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator(); // Display a loading indicator while data is being fetched
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              // Data has been successfully fetched
              List<YouTubeVideo> videoUrls = snapshot.data!;
              return ListView.builder(
                itemCount: videoUrls.length,
                itemBuilder: (context, index) {
                return VideoCard(videoUrl: videoUrls[index].id, index: index, title: videoUrls[index].title);
                },
              );
            }
          },
        ),
      // body: ListView.builder(
      //   itemCount: videoUrls.length,
      //   itemBuilder: (context, index) {
      //     return VideoCard(videoUrl: videoUrls[index], index: index);
      //   },
      // ),
     floatingActionButton: FloatingActionButton(
        onPressed: () {
          _launchURL('https://www.agricreations.com/'); // Replace with your desired URL
        },
        child: const Icon(Icons.email),
        backgroundColor: Colors.blue,
      ),
    );
  }
}

class VideoCard extends StatelessWidget {
  final String videoUrl;
  final int index;
  final String title;
  // final String description;


  const VideoCard({Key? key, 
  required this.videoUrl,
  required this.index,
  required this.title,
  // required this.description

   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final videoId = YoutubePlayer.convertUrlToId("https://www.youtube.com/watch?v=$videoUrl");
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
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
                  isLive: false, //
                ),
              ),
              showVideoProgressIndicator: true,
            ),
            ListTile(
              title: Text('$title' ?? "Error"),
              leading:Image.network("https://www.agricreations.com/assets/img/logo.png",
              width: 40,
              height: 40,
              ),
              trailing: FaIcon(FontAwesomeIcons.youtube),
            ),
          ],
        ),
      ),
    );
  }
}

