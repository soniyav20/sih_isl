import 'package:flutter/material.dart';
import 'dart:async';

import '../constants.dart';

class VideoCallAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String personName;

  const VideoCallAppBar({super.key, required this.personName});

  @override
  // ignore: library_private_types_in_public_api
  _VideoCallAppBarState createState() => _VideoCallAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _VideoCallAppBarState extends State<VideoCallAppBar> {
  late Timer _timer;
  int _elapsedSeconds = 0;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _elapsedSeconds += 1;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String _formatDuration(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor:  primary,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.personName,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
          const SizedBox(height: 4),
        ],
      ),
      actions: [
        Center(
          child: Text(
            _formatDuration(_elapsedSeconds),
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}
