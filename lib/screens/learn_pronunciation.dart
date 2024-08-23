import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../constants.dart';

class LearnPronunciationPage extends StatefulWidget {
  const LearnPronunciationPage({super.key});

  @override
  _LearnPronunciationPageState createState() => _LearnPronunciationPageState();
}

class _LearnPronunciationPageState extends State<LearnPronunciationPage> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    const videoUrl = 'https://www.youtube.com/watch?v=dQw4w9WgXcQ';
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(videoUrl)!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
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
            YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: primary,
            ),
            const SizedBox(height: 10),
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
                    TextSpan(text: 'What   is   your  \n'),
                    TextSpan(
                      text: ' name? ',
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
                    TextSpan(text: 'wɒt   ɪz   jɔːr   '),
                    TextSpan(
                      text: ' neɪm?',
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
