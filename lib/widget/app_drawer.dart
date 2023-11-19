import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    
    return const Column(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
     
        Text("Techey Guys", style: TextStyle(color: Colors.white, fontFamily: 'poppins', fontSize: 20),),
        SizedBox(
          height: 10,
        ),
        Text(
          "TecheyGuys: Bridging the Gap Between Tech and Your Everyday Needs",
          style: TextStyle(color: Colors.white),
        ),
        //   CachedNetworkImage(
        //   imageUrl: kmainLogo,
        //   placeholder: (context, url) => const CircularProgressIndicator(
        //     valueColor: AlwaysStoppedAnimation<Color>(kmainColor),
        //   ),
        //   width: 50,
        //   height: 50,
        // ),
      ],
    );
  }
}
