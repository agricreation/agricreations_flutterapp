import 'package:agricreations_app/const/config.dart';
import 'package:agricreations_app/getx_controller/data_controller.dart';
import 'package:agricreations_app/getx_controller/drawer_controller.dart';
import 'package:agricreations_app/screens/catogries.dart';
import 'package:agricreations_app/widget/bottom_nav_bar.dart';
import 'package:agricreations_app/widget/video_card.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

    drawerController.facebookUrl;
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
                  imageUrl:
                      'https://blogger.googleusercontent.com/img/a/AVvXsEiUcu2nKBfztsSdoCS9uod4cV9ObHs2twKm_eaOTWfZwwwBw3qLFr29_RQ6PHChEyfU7X-Wkd1qjNDeOdvfudyDuG72S0hBNkJQWVyn_JQB6tCryhs9sLRV0oodcml-Wm1Hq7suw9Qf9mKlD7Ew7XNp-jIjfjCOJYnwTESqbKGZWMzyotGW9eBXhH7Faw=s150',
                  width: 50.0, // Adjust width as needed
                  height: 50.0, // Adjust height as needed
                  fit: BoxFit.cover, // Adjust BoxFit as needed
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
               decoration: const BoxDecoration(
                gradient: LinearGradient(
                colors: kgradientColors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Image(image: NetworkImage('https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjFz1aoq0RnlkDHO6OqApeAWXICc9xFcyqUZndGSfTyzPPDPksfhsYK7s4vEoYZ_Xc2Imeh9yEXbg09WAwEpH41KXANe8wbLqaQFyhMqkVH9_KDvhZ-VkUxzB5ppvwyOh_vEUDkLbPBwrYOgyMC7x9-aN5kF-Q1HB3cOugW5PBtrjXfHQIN15w5cz09LPt6/s16000/T-G%20logos%20only.png',
                  ),
                  width: 50,
                  height: 50,),
                  const Text(
                    "Cultivating Excellence in Web Development and Video Editing: Agricreations, Where Innovation Grows",
                    style: TextStyle(color: Colors.white),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () => launchURL(
                            'https://www.facebook.com/moovendhan.agriculture/'),
                        child: const FaIcon(
                          FontAwesomeIcons.facebook,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => launchURL(
                            'https://www.instagram.com/moovendhan_agricreations/'),
                        child: const FaIcon(
                          FontAwesomeIcons.instagram,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => launchURL(
                            'https://api.whatsapp.com/send/?phone=%2B918300470783&text&type=phone_number&app_absent=0'),
                        child: const FaIcon(
                          FontAwesomeIcons.whatsapp,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => launchURL(
                            'https://www.linkedin.com/in/moovendhanv'),
                        child: const FaIcon(
                          FontAwesomeIcons.linkedin,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => launchURL('https://t.me/Moovendhanagri'),
                        child: const FaIcon(
                          FontAwesomeIcons.telegram,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => launchURL(
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
                launchURL('https://www.youtube.com/@HkragritechsYt');
              },
            ),
            ListTile(
              title: const Text('Best apps in Tamil'),
              leading: const FaIcon(
                FontAwesomeIcons.youtube,
                color: Colors.red,
              ),
              onTap: () {
                launchURL('https://www.youtube.com/@bestappsintamil');
              },
            ),
             Container(
              color: const Color.fromARGB(255, 152, 209, 255),
               child: ListTile(
                textColor: Colors.white,
                title: const Text('Catogries'),
                leading: const FaIcon(
                  FontAwesomeIcons.list,
                  color: Color.fromARGB(255, 252, 253, 255),
                ),
                onTap: () {
                      Get.to(() => Catogries(
                        catogriesList: catogries,
                      ));
                },
                         ),
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
      },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Get.to(() => VideoScreen(videoUrl: "uGuJbpWsL6k&t=118s"));
          launchURL('https://www.agricreations.com/'); // Replace with your desired URL
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.web_stories_outlined),
      ),
    );
  }
}
