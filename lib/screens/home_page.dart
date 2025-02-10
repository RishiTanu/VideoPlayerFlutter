import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'content_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> videos = [
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4',
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4',
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4',
  ];

  final SwiperController _swiperController = SwiperController();

  void _nextVideo() {
    _swiperController.next();
  }

  void _previousVideo() {
    _swiperController.previous();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Swiper for video content
            Swiper(
              controller: _swiperController,
              itemBuilder: (BuildContext context, int index) {
                return ContentScreen(
                  src: videos[index],
                );
              },
              itemCount: videos.length,
              scrollDirection: Axis.horizontal,
            ),

            // Previous Button
            Positioned(
              left: 20,
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios, size: 40, color: Colors.white),
                onPressed: _previousVideo,
              ),
            ),

            // Next Button
            Positioned(
              right: 20,
              child: IconButton(
                icon: Icon(Icons.arrow_forward_ios, size: 40, color: Colors.white),
                onPressed: _nextVideo,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
