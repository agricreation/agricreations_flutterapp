
import 'package:agricreations_app/widget/expansion_pannel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:agricreations_app/const/config.dart';

class AppDrawerList extends StatelessWidget {
  const AppDrawerList({
    super.key,
  });

     Future<void> launchURL(String url) async {
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      } else {
        throw 'Could not launch $url';
      }
    }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //  Container(
        //   color: ksubColor,
        //    child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceAround,
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       GestureDetector(
        //         onTap: () => launchURL(
        //             'https://www.facebook.com/moovendhan.agriculture/'),
        //         child: const FaIcon(
        //           FontAwesomeIcons.facebook,
        //           color: kmainColor,
        //         ),
        //       ),
        //       GestureDetector(
        //         onTap: () => launchURL(
        //             'https://www.instagram.com/moovendhan_agricreations/'),
        //         child: const FaIcon(
        //           FontAwesomeIcons.instagram,
        //           color: kmainColor,
        //         ),
        //       ),
        //       GestureDetector(
        //         onTap: () => launchURL(
        //             'https://api.whatsapp.com/send/?phone=%2B918300470783&text&type=phone_number&app_absent=0'),
        //         child: const FaIcon(
        //           FontAwesomeIcons.whatsapp,
        //           color: kmainColor,
        //         ),
        //       ),
        //       GestureDetector(
        //         onTap: () => launchURL(
        //             'https://www.linkedin.com/in/moovendhanv'),
        //         child: const FaIcon(
        //           FontAwesomeIcons.linkedin,
        //           color: kmainColor,
        //         ),
        //       ),
        //       GestureDetector(
        //         onTap: () => launchURL('https://t.me/Moovendhanagri'),
        //         child: const FaIcon(
        //           FontAwesomeIcons.telegram,
        //           color: kmainColor,
        //         ),
        //       ),
        //       GestureDetector(
        //         onTap: () => launchURL(
        //             'https://bestappsintamil.agricreations.com/'),
        //         child: const FaIcon(
        //           FontAwesomeIcons.blogger,
        //           color: kmainColor,
        //         ),
        //       ),
        //     ],
        //          ),
        //  ),
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
    MyExpansionPanelList(),
    
      ],
    );
  }
}
