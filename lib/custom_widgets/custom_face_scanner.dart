// import 'dart:async';
// import 'package:camera/camera.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
// import 'package:intl/intl.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// import '../themes_colors/colors.dart';
//
// class FaceScannerScreen extends StatefulWidget {
//   final String jobTitle;
//   final Color headerColor;
//   final Duration autoCloseDuration;
//   final void Function(XFile image)? onFaceCaptured;
//
//   const FaceScannerScreen({
//     super.key,
//     required this.jobTitle,
//     required this.headerColor,
//     this.autoCloseDuration = const Duration(minutes: 2),
//     this.onFaceCaptured,
//   });
//
//   @override
//   State<FaceScannerScreen> createState() => _FaceScannerScreenState();
// }
//
// class _FaceScannerScreenState extends State<FaceScannerScreen> {
//   CameraController? _cameraController;
//   late FaceDetector _faceDetector;
//   bool _isDetecting = false;
//   bool _hasCaptured = false;
//   late Timer _timer;
//   late int _remainingSeconds;
//
//   @override
//   void initState() {
//     super.initState();
//     _remainingSeconds = widget.autoCloseDuration.inSeconds;
//     _startTimer();
//     _initializeCamera();
//     _faceDetector = FaceDetector(
//       options: FaceDetectorOptions(performanceMode: FaceDetectorMode.accurate),
//     );
//   }
//
//   void _startTimer() {
//     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       if (_remainingSeconds == 0) {
//         _timer.cancel();
//         if (mounted) Navigator.pop(context); // auto-close
//       } else {
//         setState(() => _remainingSeconds--);
//       }
//     });
//   }
//
//   Future<void> _initializeCamera() async {
//     if (await Permission.camera.request().isGranted) {
//       final cameras = await availableCameras();
//       final frontCamera = cameras.firstWhere(
//         (camera) => camera.lensDirection == CameraLensDirection.front,
//       );
//
//       _cameraController = CameraController(
//         frontCamera,
//         ResolutionPreset.medium,
//         enableAudio: false,
//       );
//
//       await _cameraController!.initialize();
//       await _cameraController!.startImageStream(_processCameraImage);
//       setState(() {});
//     }
//   }
//
//   Future<void> _processCameraImage(CameraImage image) async {
//     if (_isDetecting || _hasCaptured) return;
//     _isDetecting = true;
//
//     try {
//       final WriteBuffer allBytes = WriteBuffer();
//       for (Plane plane in image.planes) {
//         allBytes.putUint8List(plane.bytes);
//       }
//
//       final inputImage = InputImage.fromBytes(
//         bytes: allBytes.done().buffer.asUint8List(),
//         metadata: InputImageMetadata(
//           size: Size(image.width.toDouble(), image.height.toDouble()),
//           rotation: InputImageRotation.rotation270deg,
//           format:
//               InputImageFormatValue.fromRawValue(image.format.raw) ??
//               InputImageFormat.nv21,
//           bytesPerRow: image.planes.first.bytesPerRow,
//         ),
//       );
//
//       final faces = await _faceDetector.processImage(inputImage);
//       if (faces.isNotEmpty) {
//         final face = faces.first;
//         final centerY = face.boundingBox.center.dy;
//         final frameHeight = image.height.toDouble();
//
//         final top = frameHeight * 0.25;
//         final bottom = frameHeight * 0.75;
//
//         if (centerY > top && centerY < bottom) {
//           _hasCaptured = true;
//           await _cameraController!.stopImageStream();
//           final photo = await _cameraController!.takePicture();
//           widget.onFaceCaptured?.call(photo);
//           if (mounted) Navigator.pop(context);
//         }
//       }
//     } catch (_) {}
//
//     _isDetecting = false;
//   }
//
//   @override
//   void dispose() {
//     _timer.cancel();
//     _cameraController?.dispose();
//     _faceDetector.close();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final now = DateFormat('dd-MM-yyyy hh:mm:ss a').format(DateTime.now());
//
//     return Scaffold(
//       backgroundColor: Colors.grey.shade100,
//       body: SafeArea(
//         child: Column(
//           children: [
//             Container(
//               color: AppColors.primary,
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       const SizedBox(width: 8),
//                       Text(now, style: const TextStyle(color: Colors.white)),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 12),
//             Container(
//               margin: const EdgeInsets.symmetric(horizontal: 20),
//               padding: const EdgeInsets.all(6),
//               decoration: BoxDecoration(
//                 color: AppColors.primary,
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               height: 260, // fixed height
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(16),
//                 child: Stack(
//                   fit: StackFit.expand,
//                   children: [
//                     _cameraController?.value.isInitialized ?? false
//                         ? FittedBox(
//                             fit: BoxFit.cover,
//                             clipBehavior: Clip.hardEdge,
//                             child: SizedBox(
//                               width:
//                                   _cameraController!.value.previewSize!.height,
//                               height:
//                                   _cameraController!.value.previewSize!.width,
//                               child: CameraPreview(_cameraController!),
//                             ),
//                           )
//                         : const Center(child: CircularProgressIndicator()),
//                     const _ScannerOverlay(),
//                   ],
//                 ),
//               ),
//             ),
//
//             const SizedBox(height: 6),
//             const Text(
//               "Face Scan",
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 8),
//             const Text("Align your face within the frame."),
//             const SizedBox(height: 16),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: LinearProgressIndicator(
//                 value: _remainingSeconds / widget.autoCloseDuration.inSeconds,
//                 backgroundColor: Colors.grey.shade300,
//                 color: Colors.blue,
//               ),
//             ),
//             const SizedBox(height: 4),
//             Text(
//               "Auto Close In ${Duration(seconds: _remainingSeconds).toString().substring(2, 7)}",
//             ),
//             const SizedBox(height: 20),
//             Container(
//               margin: const EdgeInsets.symmetric(horizontal: 20),
//               padding: const EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 border: Border.all(color: Colors.grey.shade300),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: const Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       Icon(Icons.warning_amber_rounded, color: Colors.orange),
//                       SizedBox(width: 6),
//                       Text(
//                         "Remove before scanning",
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 6),
//                   Text("\u2022 Sunglasses\n\u2022 Masks\n\u2022 Cap/Hat"),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class _ScannerOverlay extends StatelessWidget {
//   const _ScannerOverlay();
//
//   @override
//   Widget build(BuildContext context) {
//     return IgnorePointer(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: const [
//           SizedBox(height: 40), // top padding
//           Divider(color: Colors.blue, thickness: 2, indent: 60, endIndent: 60),
//           SizedBox(height: 120), // top padding
//
//           Divider(color: Colors.blue, thickness: 2, indent: 60, endIndent: 60),
//           SizedBox(height: 40), // bottom padding
//         ],
//       ),
//     );
//   }
// }

import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:image/image.dart' as img;
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

class FaceScannerScreen extends StatefulWidget {
  final String jobTitle;
  final Color headerColor;
  final Duration autoCloseDuration;
  final void Function(XFile image)? onFaceCaptured;

  const FaceScannerScreen({
    super.key,
    required this.jobTitle,
    required this.headerColor,
    this.autoCloseDuration = const Duration(minutes: 2),
    this.onFaceCaptured,
  });

  @override
  State<FaceScannerScreen> createState() => _FaceScannerScreenState();
}

class _FaceScannerScreenState extends State<FaceScannerScreen> {
  CameraController? _cameraController;
  late FaceDetector _faceDetector;
  bool _isDetecting = false;
  bool _hasCaptured = false;
  late Timer _timer;
  late int _remainingSeconds;
  DateTime _lastProcessed = DateTime.now();
  Uint8List? _referenceFaceBytes;

  @override
  void initState() {
    super.initState();
    _remainingSeconds = widget.autoCloseDuration.inSeconds;
    _startTimer();
    _loadReferenceFace();
    _initializeCamera();
    _faceDetector = FaceDetector(
      options: FaceDetectorOptions(performanceMode: FaceDetectorMode.fast),
    );
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds == 0) {
        _timer.cancel();
        if (mounted) Navigator.pop(context);
      } else {
        setState(() => _remainingSeconds--);
      }
    });
  }

  Future<void> _loadReferenceFace() async {
    final bytes = await rootBundle.load('assets/face_reference.jpg');
    _referenceFaceBytes = bytes.buffer.asUint8List();
  }

  Future<void> _initializeCamera() async {
    if (await Permission.camera.request().isGranted) {
      final cameras = await availableCameras();
      final frontCamera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front,
      );

      _cameraController = CameraController(
        frontCamera,
        ResolutionPreset.medium,
        enableAudio: false,
      );

      await _cameraController!.initialize();
      await _cameraController!.startImageStream(_processCameraImage);
      setState(() {});
    }
  }

  Future<void> _processCameraImage(CameraImage image) async {
    if (_isDetecting || _hasCaptured || _referenceFaceBytes == null) return;

    final now = DateTime.now();
    if (now.difference(_lastProcessed).inMilliseconds < 700) return;
    _lastProcessed = now;
    _isDetecting = true;

    try {
      final WriteBuffer allBytes = WriteBuffer();
      for (Plane plane in image.planes) {
        allBytes.putUint8List(plane.bytes);
      }

      final bytes = allBytes.done().buffer.asUint8List();
      final inputImage = InputImage.fromBytes(
        bytes: bytes,
        metadata: InputImageMetadata(
          size: Size(image.width.toDouble(), image.height.toDouble()),
          rotation: _getInputImageRotation(),
          format:
              InputImageFormatValue.fromRawValue(image.format.raw) ??
              InputImageFormat.nv21,
          bytesPerRow: image.planes.first.bytesPerRow,
        ),
      );

      final faces = await _faceDetector.processImage(inputImage);

      if (faces.isNotEmpty && !_hasCaptured) {
        final face = faces.first;
        final centerY = face.boundingBox.center.dy;
        final frameHeight = image.height.toDouble();
        final top = frameHeight * 0.20;
        final bottom = frameHeight * 0.80;

        if (centerY > top && centerY < bottom) {
          final liveFaceBytes = _convertYUV420ToJpg(image);
          final isMatched = await _compareFaces(
            _referenceFaceBytes!,
            liveFaceBytes,
          );

          if (isMatched) {
            _hasCaptured = true;
            await _cameraController!.stopImageStream();
            final photo = await _cameraController!.takePicture();
            widget.onFaceCaptured?.call(photo);
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("✅ Face matched. Attendance recorded."),
                ),
              );
              Navigator.pop(context);
            }
          } else {
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("❌ Face doesn't match.")),
              );
            }
          }
        }
      }
    } catch (_) {}
    _isDetecting = false;
  }

  Uint8List _convertYUV420ToJpg(CameraImage image) {
    final int width = image.width;
    final int height = image.height;
    final Uint8List yPlane = image.planes[0].bytes;

    final img.Image grayscale = img.Image(width: width, height: height);
    for (int i = 0; i < yPlane.length; i++) {
      final pixelVal = yPlane[i];
      grayscale[i] = img.ColorRgb8(pixelVal, pixelVal, pixelVal);
    }

    return Uint8List.fromList(img.encodeJpg(grayscale));
  }

  Future<bool> _compareFaces(Uint8List refBytes, Uint8List liveBytes) async {
    final img.Image? refImage = img.decodeImage(refBytes);
    final img.Image? liveImage = img.decodeImage(liveBytes);

    if (refImage == null || liveImage == null) return false;

    double refAvg = _averageBrightness(refImage);
    double liveAvg = _averageBrightness(liveImage);

    return (refAvg - liveAvg).abs() < 15;
  }

  double _averageBrightness(img.Image imgData) {
    double total = 0;
    for (int y = 0; y < imgData.height; y++) {
      for (int x = 0; x < imgData.width; x++) {
        final pixel = imgData.getPixel(x, y);
        total += img.getLuminance(pixel);
      }
    }
    return total / (imgData.width * imgData.height);
  }

  InputImageRotation _getInputImageRotation() {
    final rotation = _cameraController?.description.sensorOrientation ?? 0;
    return InputImageRotationValue.fromRawValue(rotation) ??
        InputImageRotation.rotation0deg;
  }

  @override
  void dispose() {
    _timer.cancel();
    _cameraController?.dispose();
    _faceDetector.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final now = DateFormat('dd-MM-yyyy hh:mm:ss a').format(DateTime.now());

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: widget.headerColor,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.jobTitle,
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(now, style: const TextStyle(color: Colors.white)),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              height: 260,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.black12,
              ),
              child: _cameraController?.value.isInitialized ?? false
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: CameraPreview(_cameraController!),
                    )
                  : const Center(child: CircularProgressIndicator()),
            ),
            const SizedBox(height: 10),
            const Text(
              "Align your face within the frame",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            LinearProgressIndicator(
              value: _remainingSeconds / widget.autoCloseDuration.inSeconds,
              backgroundColor: Colors.grey.shade300,
              color: Colors.blue,
            ),
            const SizedBox(height: 6),
            Text(
              "Auto close in ${Duration(seconds: _remainingSeconds).toString().substring(2, 7)}",
            ),
          ],
        ),
      ),
    );
  }
}

extension on img.Image {
  void operator []=(int index, img.ColorRgb8 newValue) {}
}

// class _ScannerOverlay extends StatelessWidget {
//   const _ScannerOverlay();
//
//   @override
//   Widget build(BuildContext context) {
//     return IgnorePointer(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: const [
//           SizedBox(height: 40),
//           Divider(color: Colors.blue, thickness: 2, indent: 60, endIndent: 60),
//           SizedBox(height: 120),
//           Divider(color: Colors.blue, thickness: 2, indent: 60, endIndent: 60),
//           SizedBox(height: 40),
//         ],
//       ),
//     );
//   }
// }
