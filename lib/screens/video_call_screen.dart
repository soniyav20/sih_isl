
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:sih/widgets/app_bar.dart';
import 'package:sih/widgets/the_webm.dart';
import 'package:video_player/video_player.dart';
import '../constants.dart';

class VideoCallPage extends StatefulWidget {
  final String name;

   const VideoCallPage({super.key, required this.name});
  @override
  // ignore: library_private_types_in_public_api
  _VideoCallPageState createState() => _VideoCallPageState();
}

class _VideoCallPageState extends State<VideoCallPage> {
  CameraController? _controller;
  Future<void>? _initializeControllerFuture;
  late VideoPlayerController _vcontroller;
  late Future<void> _initializeVideoPlayerFuture;
bool isavatar= false;
  bool isMuted = false;
  bool isCameraOn = true;
  bool isFrontCamera = true;
  bool isSpeakerOn = true;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
    _vcontroller = VideoPlayerController.asset('assets/rendered_video.mp4');
    _initializeVideoPlayerFuture = _vcontroller.initialize();
    _vcontroller.play();
    _vcontroller.setLooping(true);
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

    });
  }

  void _endCall() {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _controller?.dispose();
    _vcontroller.dispose();
    super.dispose();
  }
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: VideoCallAppBar(personName: widget.name),
      body: Stack(
        children: [
            Positioned.fill(
            child: FutureBuilder(
    future: _initializeVideoPlayerFuture,
    builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.done) {
    return FittedBox(
    fit: BoxFit.fitHeight,
    child: SizedBox(
    width: _vcontroller.value.size.width,
    height: _vcontroller.value.size.height,
    child: VideoPlayer(_vcontroller),
    ),
    );
    } else {
    return const Center(
    child: CircularProgressIndicator(),
    );}})),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height / 2.5,
            child: Container(
              color:  const Color(0x00fff7cf).withOpacity(0.9),
              child: Padding(
                padding:  const EdgeInsets.only(bottom: 50),
                child: Row(
                  children: [
                    Padding(
                      padding:  const EdgeInsets.fromLTRB(16, 16, 16, 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
    IconButton(
    icon: Icon(
    _isExpanded ? Icons.expand_less : Icons.expand_more,
    color:  primary,
    ),
    onPressed: () {
    setState(() {
    _isExpanded = !_isExpanded; // Toggle expansion state
    });
    },
    ),
                    isavatar? const WebmVideoContainer():       Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [Opacity(
                            opacity: 0.5, // Less opacity for the first line
                            child: Text(
                              'Good Morning',
                              style: TextStyle(
                                color: primary,
                                fontSize: 22.0,
                              ),
                            ),
                          ),
                            Text(
                              'How was your day?',
                              style: TextStyle(
                                color: primary,
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Opacity(
                              opacity: 0.5, // Less opacity for the third line
                              child: Text(
                                'Did you go to wo....',
                                style: TextStyle(
                                  color:primary,
                                  fontSize: 22.0,
                                ),
                              ),
                            ),
                            const SizedBox(height: 30,)],)
                        ],
                      ),
                    ),
                     const Spacer(),
                    // Camera Preview on the right
                    FutureBuilder<void>(
                      future: _initializeControllerFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return Container(
                            width: 130,
                            height: 180,
                            margin:  const EdgeInsets.only(right: 16.0), // Adjust margin if needed
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(17.0),
                              border: Border.all(color:  primary, width: 2),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: CameraPreview(_controller!),
                            ),
                          );
                        } else {
                          return  const Center(child: CircularProgressIndicator());
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
    padding:  const EdgeInsets.all(16.0),
    decoration: BoxDecoration(
    color: Colors.grey[200],
    borderRadius: BorderRadius.circular(8.0),
    boxShadow:  const [
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
      backgroundColor:  primary,
      child: IconButton(
        icon:  const Icon(
          Icons.headphones,
          color: Colors.white,
        ),
        onPressed: () {
        },
      ),
    ),
    CircleAvatar(
      radius: 30,
      backgroundColor:  primary,
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
       const SizedBox(height: 20,),
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
                    color:  primary,
                  ),
                  onPressed: _toggleMute,
                ),
                IconButton(
                  icon: Icon(
                    isCameraOn ? Icons.videocam : Icons.videocam_off,
                    color:  primary,
                  ),
                  onPressed: _toggleCamera,
                ),
                FloatingActionButton(
                  backgroundColor: Colors.red,
                  onPressed: _endCall,
                  child:  const Icon(Icons.call_end, color: Colors.white),
                ),
                IconButton(
                  icon:  Icon(Icons.switch_camera, color: primary),
                  onPressed: _switchCamera,
                ),
                IconButton(
                  icon: Icon(
                    isSpeakerOn ? Icons.volume_up : Icons.volume_off,
                    color:  primary,
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
      color: selected?  secondary:Colors.transparent,
borderRadius:  const BorderRadius.all(Radius.circular(20))
    ),
    child: Padding(
    padding:  const EdgeInsets.all(8.0),
    child: Text(title,style:  TextStyle(color:primary ),),
  ),
  );
}


