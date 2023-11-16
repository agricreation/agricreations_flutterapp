import 'package:agricreations_app/widget/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';

class Catogries extends StatelessWidget {

  final List catogriesList;
  final bool shouldHideAppBar = false;

  const Catogries({
    Key? key,
    required this.catogriesList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      
    List imagesToadd = [
    'https://cdn.pixabay.com/photo/2018/05/14/16/54/cyber-3400789_640.jpg',
    'https://cdn.pixabay.com/photo/2018/05/08/08/44/artificial-intelligence-3382507_640.jpg',
    'https://cdn.pixabay.com/photo/2015/05/26/23/52/technology-785742_640.jpg',
    'https://cdn.pixabay.com/photo/2020/04/08/16/32/keyboard-5017973_640.jpg',
  ];
  int getRandomIndex() {
  Random random = Random();
  return random.nextInt(imagesToadd.length);
}

    return Scaffold(
      appBar: shouldHideAppBar
          ? null
          : AppBar(
              title: const Text("Catogries"),
            ),
      bottomNavigationBar: const BottomNavigationbar(),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: catogriesList.length,
                     shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    itemBuilder: (context, index) {
                      return Container(
                        height: 100,
                        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        width: double.infinity,
                        // color: Colors.blue,
                       decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(imagesToadd[getRandomIndex()]),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                            Colors.blue.withOpacity(0.5), 
                            BlendMode.srcOver,
                          ),
                        ),
                      ),
                        child: Center(
                          child: Text(
                            catogriesList[index],
                            style: const TextStyle(color: Colors.white,
                            fontSize: 25),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
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
