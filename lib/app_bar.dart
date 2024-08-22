import 'package:flutter/material.dart';
import 'dart:async';

class VideoCallAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String personName;

  VideoCallAppBar({required this.personName});

  @override
  _VideoCallAppBarState createState() => _VideoCallAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
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
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
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
      backgroundColor: Color(0xFFA28F2D),
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.personName,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          SizedBox(height: 4),
        ],
      ),
      actions: [
        Center(
          child: Text(
            _formatDuration(_elapsedSeconds),
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        SizedBox(width: 16),
      ],
    );
  }
}
