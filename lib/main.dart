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
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(secondary: const Color.fromARGB(255, 42, 42, 42)),
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
      backgroundColor: Colors.black54,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text("Agricreations"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                'Agri Creations',
                style: TextStyle(color: Colors.white),
              ),
              Text("Cultivating Excellence in Web Development and Video Editing: Agricreations, Where Innovation Grows", style: TextStyle(
                color: Colors.white
              ),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => _launchURL('https://www.facebook.com/moovendhan.agriculture/'),
                    child: FaIcon(FontAwesomeIcons.facebook, color: Colors.white,),
                  ),
                   GestureDetector(
                    onTap: () => _launchURL('https://www.instagram.com/moovendhan_agricreations/'),
                    child: FaIcon(FontAwesomeIcons.instagram, color: Colors.white,),
                  ),
                    GestureDetector(
                    onTap: () => _launchURL('https://api.whatsapp.com/send/?phone=%2B918300470783&text&type=phone_number&app_absent=0'),
                    child: FaIcon(FontAwesomeIcons.whatsapp, color: Colors.white,),
                  ),
                    GestureDetector(
                    onTap: () => _launchURL('https://www.linkedin.com/in/moovendhanv'),
                    child: FaIcon(FontAwesomeIcons.linkedin, color: Colors.white,),
                  ),
                    GestureDetector(
                    onTap: () => _launchURL('https://t.me/Moovendhanagri'),
                    child: FaIcon(FontAwesomeIcons.telegram, color: Colors.white,),
                  ),
                    GestureDetector(
                    onTap: () => _launchURL('https://bestappsintamil.agricreations.com/'),
                    child: FaIcon(FontAwesomeIcons.blogger, color: Colors.white,),
                  ),
                ],
              ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Hkr agri techs'),
              leading: FaIcon(FontAwesomeIcons.youtube, color: Colors.red,),
              onTap: () {
                  _launchURL('https://www.youtube.com/@HkragritechsYt');
              },
            ),
            ListTile(
              title: Text('Best apps in Tamil'),
              leading: FaIcon(FontAwesomeIcons.youtube, color: Colors.red,),
              onTap: () {
                    _launchURL('https://www.youtube.com/@bestappsintamil');
              },
            ),
          ],
        ),
      ),
        body:FutureBuilder<List<YouTubeVideo>>(
          future: fetchVideosFromApi(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator(); 
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              // Data has been successfully fetched
              List<YouTubeVideo> videoUrls = snapshot.data!;
              return ListView.builder(
                itemCount: videoUrls.length,
                itemBuilder: (context, index) {
                return VideoCard(videoUrl: videoUrls[index].id, index: index, title: videoUrls[index].title, thumbnail: videoUrls[index].thumbnailUrl, logo: videoUrls[index].channelLogo,);
                },
              );
            }
          },
        ),
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
  final String thumbnail;
  final String logo;

  const VideoCard({Key? key, 
  required this.videoUrl,
  required this.index,
  required this.title,
  required this.thumbnail,
  required this.logo

   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final videoId = YoutubePlayer.convertUrlToId("https://www.youtube.com/watch?v=$videoUrl");
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
            // YoutubePlayer(
            //   controller: YoutubePlayerController(
            //     initialVideoId: videoId ?? 'uGuJbpWsL6k&t=118s',
            //     flags: YoutubePlayerFlags(
            //       autoPlay: false,
            //       mute: false,
            //       controlsVisibleAtStart: false, 
            //       hideThumbnail: false, 
            //       showLiveFullscreenButton: true,
            //       enableCaption: true,
            //       isLive: false, //
            //     ),
            //   ),
            //   showVideoProgressIndicator: true,
            // ),
            Container(
              width: double.infinity,
             
              child: Image.network(thumbnail,
              fit: BoxFit.cover,),
            ),
            ListTile(
              contentPadding: EdgeInsets.all(10),
              title: Text('$title' ?? "Error", style: TextStyle(
                color: Colors.white
              ),),
              leading:Image.network(logo,
              width: 40,
              height: 40,
              ),
              trailing: GestureDetector(
                onTap: () =>  _launchURL('https://www.youtube.com/watch?v=$videoUrl'),
                child: FaIcon(FontAwesomeIcons.youtube, color: Colors.red,),
              ),
            ),
            Container(
              decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey.withOpacity(0.5), // Border color with reduced opacity
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

