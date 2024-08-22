// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_gifimage/flutter_gifimage.dart';
//
// class VideoCallPage extends StatefulWidget {
//   @override
//   _VideoCallPageState createState() => _VideoCallPageState();
// }
//
// class _VideoCallPageState extends State<VideoCallPage> {
//   CameraController? _controller;
//   Future<void>? _initializeControllerFuture;
//   GifController? _gifController;
//
//   @override
//   void initState() {
//     super.initState();
//     _initializeCamera();
//     _initializeGif();
//   }
//
//   Future<void> _initializeCamera() async {
//     final cameras = await availableCameras();
//     final frontCamera = cameras.firstWhere((camera) =>
//     camera.lensDirection == CameraLensDirection.front);
//
//     _controller = CameraController(
//       frontCamera,
//       ResolutionPreset.high,
//       enableAudio: true,
//     );
//
//     _initializeControllerFuture = _controller!.initialize().then((_) {
//       if (!mounted) return;
//       setState(() {});
//     });
//   }
//
//   void _initializeGif() {
//     _gifController = GifController(vsync: this);
//     _gifController?.repeat(min: 0, max: 30, period: Duration(seconds: 3));
//   }
//
//   @override
//   void dispose() {
//     _controller?.dispose();
//     _gifController?.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Background GIF
//           Positioned.fill(
//             child: GifImage(
//               controller: _gifController!,
//               image: AssetImage('assets/other_person.gif'), // Replace with your GIF path
//               fit: BoxFit.cover,
//             ),
//           ),
//           // Semi-transparent overlay
//           Positioned(
//             bottom: 0,
//             left: 0,
//             right: 0,
//             height: MediaQuery.of(context).size.height / 2,
//             child: Container(
//               color: Color(0xFFA28F2D).withOpacity(0.3),
//               child: Center(
//                 child: FutureBuilder<void>(
//                   future: _initializeControllerFuture,
//                   builder: (context, snapshot) {
//                     if (snapshot.connectionState == ConnectionState.done) {
//                       return Container(
//                         width: 150,
//                         height: 200,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(15.0),
//                           border: Border.all(color: Colors.white, width: 2),
//                         ),
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(15.0),
//                           child: CameraPreview(_controller!),
//                         ),
//                       );
//                     } else {
//                       return Center(child: CircularProgressIndicator());
//                     }
//                   },
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
