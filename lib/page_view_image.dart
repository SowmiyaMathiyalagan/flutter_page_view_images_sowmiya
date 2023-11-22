


import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';


import 'appdata_image.dart';
import 'display_image.dart';

import 'indicator.dart';


class PageViewImageScreen extends StatefulWidget {
  const PageViewImageScreen({Key? key}) : super(key: key);

  @override
  State<PageViewImageScreen> createState() => _PageViewImageScreenState();
}

class _PageViewImageScreenState extends State<PageViewImageScreen> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('William Shakespeare Quotes',
        style: TextStyle(
          color: Colors.white
        ),
        ),
        backgroundColor: Colors.blueGrey,
        actions: [
          PopupMenuButton<int>(
            itemBuilder:(context) => [
              PopupMenuItem(value:1, child: Text('Share'))
            ],
            onSelected: (value){
              if(value == 1){
                shareInfo();
              }
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 200,
            width: 400,
            child:PageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                itemCount:appDataImage.length,
                itemBuilder:(context, Index){
                  return DisplayImage(
                    appData: appDataImage[Index],
                  );
                }
            ) ,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    appDataImage.length,
                        (index) => Indicator(isActive: selectedIndex == index ? true : false)),
              ],
            ),
          ),
        ],
      ),

    );
  }
  shareInfo()async{
    ByteData imagebyte = await rootBundle.load(appDataImage[selectedIndex].image);
    final temp = await getTemporaryDirectory();
    final path = '${temp.path}/download.jpg';
    File(path).writeAsBytesSync(imagebyte.buffer.asUint8List());
    await Share.shareFiles([path], text: 'Image Shared');
  }
}
