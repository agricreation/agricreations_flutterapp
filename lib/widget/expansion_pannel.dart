
import 'package:agricreations_app/getx_controller/data_controller.dart';
import 'package:agricreations_app/getx_controller/expansion_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//Expansion pannel for a catogries

class MyExpansionPanelList extends StatelessWidget {
  final MyController _controller = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(0),
        child: Obx(
          () => ExpansionPanelList(
            key: UniqueKey(),
            expandedHeaderPadding: const EdgeInsets.all(0),
            expansionCallback: (int index, bool isExpanded) {
              _controller.togglePanel(index);
            },
            children: _controller.items.map<ExpansionPanel>((Item item) {
              return ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    title: Text(item.headerValue),
                  );
                },
                body: Column(
                  children: [
                    for(int i = 0; i<item.expandedValue.length; i++)
                     Container(
                      color: i % 2 == 0 ?Colors.grey.shade200 : Colors.white,
                       child: ListTile(
                                         title: Text(item.expandedValue[i]),
                                       ),
                     ),
                  ],
                ),
                isExpanded: item.isExpanded,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
class Item {
  final DataController listOfCatogries = Get.find();
  late List<dynamic> expandedValue; // Declare the variable, but don't initialize it here
  String headerValue;
  bool isExpanded;

  Item({
    required this.headerValue,
    this.isExpanded = true,
  }) {
    expandedValue = listOfCatogries.listOfCatogries; 
  }
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Catorgries',
    );
  });
}