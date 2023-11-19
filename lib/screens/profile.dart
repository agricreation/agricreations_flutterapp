import 'package:agricreations_app/const/config.dart';
import 'package:agricreations_app/widget/bottom_nav_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  String texts = "";
  
   ProfilePage({super.key, 
    required texts,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(secondary: const Color.fromARGB(255, 42, 42, 42)),
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Profile')),
        bottomNavigationBar: const BottomNavigationbar(),
        body: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.white,
            child: Column(
              children: [
                Container(
                      decoration: BoxDecoration(
                        // color: kmainColor,
                        borderRadius: BorderRadius.circular(100), 
                      ),
                      child: CachedNetworkImage(
                        width: 100,
                        height: 100,
                        imageUrl: kmainLogo,
                        fit: BoxFit.cover, 
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                      ),
                    ),
                const Text("Techey Guys", style: TextStyle(
                  fontSize: 18,
                ),)
              ],
            ),
          ),
        ],
      )
      )
    );
}
}