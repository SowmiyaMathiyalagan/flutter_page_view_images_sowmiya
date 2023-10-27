import 'package:flutter/material.dart';
import 'package:flutter_page_view_images_sowmiya/appdata_image.dart';
import 'package:flutter_page_view_images_sowmiya/display_image.dart';

class PageViewImage extends StatefulWidget {
  const PageViewImage({Key? key}) : super(key: key);

  @override
  State<PageViewImage> createState() => _PageViewImageState();
}

class _PageViewImageState extends State<PageViewImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          'William Shakespeare',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              child: PageView.builder(
                  itemCount: appDataImage.length,
                  itemBuilder: (context, index) {
                    return DisplayImage(appData: appDataImage[index]);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
