import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../constants.dart';

class LearnPronunciationPage extends StatefulWidget {
  const LearnPronunciationPage({super.key});

  @override
  _LearnPronunciationPageState createState() => _LearnPronunciationPageState();
}
class _LearnPronunciationPageState extends State<LearnPronunciationPage> {
  late VideoPlayerController _vcontroller;
  late Future<void> _initializeVideoPlayerFuture;
  @override
  void initState() {
    super.initState();
    _vcontroller = VideoPlayerController.asset('assets/videoplayback.mp4');
    _initializeVideoPlayerFuture = _vcontroller.initialize();
    _vcontroller.play();
    _vcontroller.setLooping(true);
  }

  @override
  void dispose() {
    _vcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondary,
      appBar: AppBar(
        title: const Text(
          'Lip Reading',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: primary,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder(
                future: _initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return FittedBox(
                      fit: BoxFit.fitWidth,
                      child: SizedBox(
                        width: _vcontroller.value.size.width,
                        height: _vcontroller.value.size.height,
                        child: VideoPlayer(_vcontroller),
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );}}),
            SizedBox(height: 10),
            const SizedBox(height: 30),
            Center(
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: primary,
                  ),
                  children: const [
                    TextSpan(text: 'Don\'t freeze the cheese \n'),
                    TextSpan(
                      text: ' please ',
                      style: TextStyle(
                        color: Colors.white,
                        backgroundColor: Color(0xffEAD87C),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 24),
              // child: Divider(color: primary),
            ),
            const SizedBox(height: 30),
            Center(
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: primary,
                  ),
                  children: const [
                    TextSpan(text: "doʊnt friːz ðə tʃiːz  "
                    ),
                    TextSpan(
                      text: ' pliːz',
                      style: TextStyle(
                        color: Colors.white,
                        backgroundColor: Color(0xffEAD87C),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
