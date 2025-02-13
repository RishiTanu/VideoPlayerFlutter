import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ContentScreen extends StatefulWidget {
  final String? src;

  const ContentScreen({Key? key, this.src}) : super(key: key);

  @override
  _ContentScreenState createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  Future initializePlayer() async {
    _videoPlayerController = VideoPlayerController.network(widget.src!);

    await _videoPlayerController.initialize().then((_) {
      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        autoPlay: false,
        showControls: true,
        looping: true,
      );
      setState(() {}); // Ensure UI updates after initialization
    }).catchError((error) {
      print("Error initializing video: $error");
    });
  }

  @override
  void dispose() {
    _videoPlayerController.pause(); // Stop playback before disposing
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity, // Ensures full size of Swiper item
      color: Colors.black, // Background color for loading state
      child: Stack(
        children: [
          // Display video player if initialized
          _chewieController != null &&
              _chewieController!.videoPlayerController.value.isInitialized
              ? Chewie(
                controller: _chewieController!,
              )
              : Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 10),
                Text('Loading...', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
