import 'package:agricreations_app/getx_controller/data_controller.dart';
import 'package:agricreations_app/screens/catogries.dart';
import 'package:agricreations_app/widget/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationbar extends StatelessWidget {
  const BottomNavigationbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final DataController dataController = Get.put(DataController());
    List catogries = dataController.listOfCatogries;

    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.short_text),
          label: 'catogries',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: 'Profile',
        ),
      ],
      onTap: (index) {
        switch (index) {
          case 0:
            Get.to(() => const MyHomePage(title: 'Techey guys',));
            break;
          case 1:
            Get.to(() => Catogries(catogriesList: catogries,));
            break;
          case 2:
            Get.to(() => Catogries(catogriesList: catogries,));
            break;
        }
      },
      currentIndex: 2,
      selectedItemColor: Colors.blue,
      selectedLabelStyle: TextStyle(color: Colors.blue),
    );
  }
}
