import 'package:agricreations_app/getx_controller/data_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CatogriesVideoListing extends StatelessWidget {
  const CatogriesVideoListing({super.key});

  @override
  Widget build(BuildContext context) {
    final DataController listOfCatogries = Get.find();
    List text = listOfCatogries.listOfCatogries;

    return SizedBox(
      width: double.infinity, // Set a fixed width or adjust as needed
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: <Widget>[
            // catogriesListOnTop(text[0]),
            for (int i = 0; i < text.length; i++) catogriesListOnTop(text[i]),
            // Add more widgets as needed
          ],
        ),
      ),
    );
  }
}

Widget catogriesListOnTop(String text) {
  return Container(
    margin: const EdgeInsets.only(right: 10), // Adjust as needed
    child: IntrinsicWidth(
      child: SizedBox(
        height: 30,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(color: Colors.white),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                text,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
