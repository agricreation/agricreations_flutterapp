import 'package:flutter/material.dart' show AppBar, BoxDecoration, BuildContext, Center, Color, ColorScheme, Colors, Column, Drawer, DrawerHeader, EdgeInsets, FloatingActionButton, Icon, Icons, ListTile, ListView, MainAxisAlignment, MaterialApp, Padding, Scaffold, State, StatefulWidget, StatelessWidget, Text, TextStyle, Theme, ThemeData, Widget, runApp;
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 0, 140, 255)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Agri creations'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    
     final List<String> videoUrls = [
    'https://www.youtube.com/watch?v=MRvty0llojA',
    'https://www.youtube.com/watch?v=yJg-Y5byMMw',
  ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Agri Creations', style: TextStyle(
                color: Colors.white
              ),),
            ),
            ListTile(
              title: const Text('Hkr agri techs'),
              onTap: () {
               
              },
            ),
            ListTile(
              title: const Text('Best apps in tamil'),
              onTap: () {
               
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ListView.builder(
              itemCount: videoUrls.length,
              itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: YoutubePlayer(
              controller: YoutubePlayerController(
                 initialVideoId: YoutubePlayer.convertUrlToId(videoUrls[index]) ?? '',
                  flags: const YoutubePlayerFlags(
                autoPlay: false,
                  mute: false,
                ),
              ),
              showVideoProgressIndicator: true,
            ),
          );
        },
        ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:(){
          
        },
        child: const Icon(Icons.email),
      ),
    );
  }
}
