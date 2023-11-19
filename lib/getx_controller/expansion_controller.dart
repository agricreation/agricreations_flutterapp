import 'package:agricreations_app/widget/expansion_pannel.dart';
import 'package:get/get.dart';

class MyController extends GetxController {
  final RxList<Item> items = generateItems(1).obs;

  void togglePanel(int index) {
    items[index].isExpanded = !items[index].isExpanded;
    items.refresh(); // Use refresh to notify GetX about the change
  }
}
