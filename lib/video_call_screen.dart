
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sih/app_bar.dart';
import 'package:sih/the_webm.dart';

class VideoCallPage extends StatefulWidget {
  final String name;

  const VideoCallPage({super.key, required this.name});
  @override
  _VideoCallPageState createState() => _VideoCallPageState();
}

class _VideoCallPageState extends State<VideoCallPage> {
  CameraController? _controller;
  Future<void>? _initializeControllerFuture;
bool isavatar= false;
  bool isMuted = false;
  bool isCameraOn = true;
  bool isFrontCamera = true;
  bool isSpeakerOn = true;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final frontCamera = cameras.firstWhere(
            (camera) => camera.lensDirection == CameraLensDirection.front);

    _controller = CameraController(
      frontCamera,
      ResolutionPreset.high,
      enableAudio: true,
    );

    _initializeControllerFuture = _controller!.initialize().then((_) {
      if (!mounted) return;
      setState(() {});
    });
  }

  Future<void> _switchCamera() async {
    if (_controller == null) return;
    final cameras = await availableCameras();
    CameraDescription newCamera;

    if (isFrontCamera) {
      newCamera = cameras.firstWhere(
              (camera) => camera.lensDirection == CameraLensDirection.back);
    } else {
      newCamera = cameras.firstWhere(
              (camera) => camera.lensDirection == CameraLensDirection.front);
    }

    _controller = CameraController(
      newCamera,
      ResolutionPreset.high,
      enableAudio: true,
    );

    _initializeControllerFuture = _controller!.initialize().then((_) {
      if (!mounted) return;
      setState(() {
        isFrontCamera = !isFrontCamera;
      });
    });
  }

  void _toggleMute() {
    setState(() {
      isMuted = !isMuted;
      // Implement actual mute functionality if using a real calling API
    });
  }

  void _toggleCamera() {
    setState(() {
      isCameraOn = !isCameraOn;
      if (isCameraOn) {
        _controller?.resumePreview();
      } else {
        _controller?.pausePreview();
      }
    });
  }

  void _toggleSpeaker() {
    setState(() {
      isSpeakerOn = !isSpeakerOn;
      // Implement actual speaker toggle functionality if using a real calling API
      // You may use flutter's audio library to actually change the audio output mode
    });
  }

  void _endCall() {
    // End the call and go back to the previous screen
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
  bool _isExpanded = false; // Track the state of the container

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: VideoCallAppBar(personName: widget.name),
      body: Stack(
        children: [
          // Background GIF
          Positioned.fill(
            child: Image(
              image: AssetImage('assets/hwr.gif'), // Replace with your GIF path
              fit: BoxFit.fitHeight,
            ),
          ),
          // Semi-transparent overlay
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height / 2.5,
            child: Container(
              color: Color(0xFFF7CF).withOpacity(0.9),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
    IconButton(
    icon: Icon(
    _isExpanded ? Icons.expand_less : Icons.expand_more,
    color: Color(0xFFA28F2D),
    ),
    onPressed: () {
    setState(() {
    _isExpanded = !_isExpanded; // Toggle expansion state
    });
    },
    ),
                    isavatar?Container(
child: WebmVideoContainer(),
                    ):      Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [Opacity(
                            opacity: 0.5, // Less opacity for the first line
                            child: Text(
                              'Hi',
                              style: TextStyle(
                                color: Color(0xFFA28F2D),
                                fontSize: 30.0,
                              ),
                            ),
                          ),
                            Text(
                              'How are you?',
                              style: TextStyle(
                                color: Color(0xFFA28F2D),
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Opacity(
                              opacity: 0.5, // Less opacity for the third line
                              child: Text(
                                'Where ....',
                                style: TextStyle(
                                  color:Color(0xFFA28F2D),
                                  fontSize: 30.0,
                                ),
                              ),
                            ),
                            SizedBox(height: 30,)],)
                        ],
                      ),
                    ),
                    Spacer(),
                    // Camera Preview on the right
                    FutureBuilder<void>(
                      future: _initializeControllerFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return Container(
                            width: 130,
                            height: 180,
                            margin: EdgeInsets.only(right: 16.0), // Adjust margin if needed
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(17.0),
                              border: Border.all(color: Color(0xFFA28F2D), width: 2),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: CameraPreview(_controller!),
                            ),
                          );
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            left: 60,
            right: 140,
            child: Visibility(
    visible: _isExpanded,
    child: Container(
    padding: EdgeInsets.all(16.0),
    decoration: BoxDecoration(
    color: Colors.grey[200],
    borderRadius: BorderRadius.circular(8.0),
    boxShadow: [
    BoxShadow(
    color: Colors.black12,
    blurRadius: 4.0,
    offset: Offset(0, 2),
    ),
    ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
    children: [
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    CircleAvatar(
      radius: 30,
      backgroundColor: Color(0xFFA28F2D),
      child: IconButton(
        icon: Icon(
          Icons.headphones,
          color: Colors.white,
        ),
        onPressed: () {
        },
      ),
    ),
    CircleAvatar(
      radius: 30,
      backgroundColor: Color(0xFFA28F2D),
      child: IconButton(
        icon: Icon(
          isavatar? Icons.chat_rounded:Icons.emoji_emotions,
          color: Colors.white,
        ),
        onPressed: () {
          setState(() {
            isavatar=!isavatar;
_isExpanded=false;
          });
        },
      ),
    ),
  ],
),
      SizedBox(height: 20,),
      _buildOption('English', true),
    _buildOption('Tamil', false),
    ],
    ),
    ),
            )),
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(
                    isMuted ? Icons.mic_off : Icons.mic,
                    color: Color(0xFFA28F2D),
                  ),
                  onPressed: _toggleMute,
                ),
                IconButton(
                  icon: Icon(
                    isCameraOn ? Icons.videocam : Icons.videocam_off,
                    color: Color(0xFFA28F2D),
                  ),
                  onPressed: _toggleCamera,
                ),
                FloatingActionButton(
                  backgroundColor: Colors.red,
                  child: Icon(Icons.call_end, color: Colors.white),
                  onPressed: _endCall,
                ),
                IconButton(
                  icon: Icon(Icons.switch_camera, color: Color(0xFFA28F2D)),
                  onPressed: _switchCamera,
                ),
                IconButton(
                  icon: Icon(
                    isSpeakerOn ? Icons.volume_up : Icons.volume_off,
                    color: Color(0xFFA28F2D),
                  ),
                  onPressed: _toggleSpeaker,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildOption(String title, bool selected) {
  return Container(
    decoration: BoxDecoration(
      color: selected? Color(0xFFFFF7CF):Colors.transparent,
borderRadius: BorderRadius.all(Radius.circular(20))
    ),
    child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(title,style: TextStyle(color:Color(0xFFA28F2D) ),),
  ),
  );
}


