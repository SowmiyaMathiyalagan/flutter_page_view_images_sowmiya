
import 'package:flutter/material.dart';
import 'package:flutter_page_view_images_sowmiya/appdata_image.dart';

class DisplayImage extends StatelessWidget {
  final AppDataImage appData;

  const DisplayImage({super.key, required this.appData});


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
            image: AssetImage(appData.image)),
      ),
    );
  }
}
