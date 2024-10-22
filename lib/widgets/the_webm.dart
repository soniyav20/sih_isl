import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class WebmVideoContainer extends StatefulWidget {
  const WebmVideoContainer({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WebmVideoContainerState createState() => _WebmVideoContainerState();
}

class _WebmVideoContainerState extends State<WebmVideoContainer> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/avatar.webm')
      ..initialize().then((_) {
        setState(() {
          _controller.setLooping(true);
          _controller.play();
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Center(
        child: _controller.value.isInitialized
            ? Container(
          width: 150,  // Adjust the width as needed
          height: 180, // Adjust the height as needed
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: const [

            ],
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                ),
              ),
            ],
          ),
        )
            : const CircularProgressIndicator());
  }
}
