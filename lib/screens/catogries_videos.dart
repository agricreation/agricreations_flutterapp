import 'package:agricreations_app/getx_controller/data_controller.dart';
import 'package:agricreations_app/widget/video_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CatogriesVideo extends StatelessWidget {
  const CatogriesVideo({super.key});

  @override
  Widget build(BuildContext context) {
    return const CatogriesPage();
  }
}

class CatogriesPage extends StatelessWidget {
  const CatogriesPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // DataController dataController = Get.find<DataController>();
    final DataController dataController = Get.put(DataController());
    dataController.fetchDataFromApi();
    int index = 3;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Catogries list"),
        ),
        body: Column(
          children: [
            if (dataController.dataList.isEmpty)
              const Center(
                child: CircularProgressIndicator(),
              )
            else if (dataController.dataList[index].category == "best apps")
              VideoCard(
                videoUrl: dataController.dataList[index].id,
                index: index,
                title: dataController.dataList[index].title,
                thumbnail: dataController.dataList[index].thumbnailUrl,
                logo: dataController.dataList[index].channelLogo,
                videoType: dataController.dataList[index].videoType,
                categories: dataController.dataList[index].category,
                islive: dataController.dataList[index].islive,
                channelTitle: dataController.dataList[index].channelname,
                channelId: dataController.dataList[index].channelId,
              ),
          ],
        ),
      ),
    );
  }
}
