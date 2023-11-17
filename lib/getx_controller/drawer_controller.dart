import 'package:get/get.dart';

class NavbarController extends GetxController {
  var kUrl = 'https://www.facebook.com/moovendhan.agriculture/'.obs;
  var instagramUrl = 'https://www.instagram.com/moovendhan_agricreations/'.obs;
  var whatsappUrl =
      'https://api.whatsapp.com/send/?phone=%2B918300470783&text&type=phone_number&app_absent=0'
          .obs;
  var linkedinUrl = 'https://www.linkedin.com/in/moovendhanv'.obs;
  var telegramUrl = 'https://t.me/Moovendhanagri'.obs;
  var bloggerUrl = 'https://bestappsintamil.agricreations.com/'.obs;

  // You can add more variables for other data if needed

  void launchURL(String url) {}
}
