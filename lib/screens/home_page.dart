import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'content_screen.dart';

class HomePage extends StatelessWidget {
  final List<String> videos = [
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4',
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4',
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4',
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 30,right: 30),
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return ContentScreen(
              src: videos[index],
            );
          },
          itemCount: videos.length,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
