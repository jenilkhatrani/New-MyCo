// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// class PermissionsHelper {
//   /// Check and request camera permission
//   static Future<bool> checkCameraPermission(BuildContext context) async {
//     final status = await Permission.camera.status;
//     if (status.isGranted) return true;
//
//     final result = await Permission.camera.request();
//     return _handlePermissionResult(context, result);
//   }
//
//   /// Check and request photo + video access
//   static Future<bool> checkGalleryPermission(BuildContext context) async {
//     if (Platform.isAndroid) {
//       final photos = await Permission.photos.status;
//       final videos = await Permission.videos.status;
//
//       if (photos.isGranted && videos.isGranted) return true;
//
//       final photosResult = await Permission.photos.request();
//       final videosResult = await Permission.videos.request();
//
//       return _handlePermissionResult(context, photosResult) &&
//           _handlePermissionResult(context, videosResult);
//     } else {
//       final status = await Permission.photos.status;
//       if (status.isGranted) return true;
//
//       final result = await Permission.photos.request();
//       return _handlePermissionResult(context, result);
//     }
//   }
//
//   /// Check and request document/storage permission
//   static Future<bool> checkStoragePermission(BuildContext context) async {
//     if (Platform.isAndroid) {
//       final result = await Permission.manageExternalStorage.request();
//       return _handlePermissionResult(context, result);
//     } else {
//       final result = await Permission.photos.request();
//       return _handlePermissionResult(context, result);
//     }
//   }
//
//   static bool _handlePermissionResult(
//     BuildContext context,
//     PermissionStatus status,
//   ) {
//     if (status.isGranted) {
//       return true;
//     } else if (status.isPermanentlyDenied) {
//       _showPermanentDeniedDialog(context);
//     } else {
//       _showPermissionDeniedSnackBar(context);
//     }
//     return false;
//   }
//
//   static void _showPermissionDeniedSnackBar(BuildContext context) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: const Text("Permission denied. Please enable it in settings."),
//         action: SnackBarAction(
//           label: "Go to Settings",
//           onPressed: () => openAppSettings(),
//         ),
//       ),
//     );
//   }
//
//   static void _showPermanentDeniedDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (_) => AlertDialog(
//         title: const Text("Permission Permanently Denied"),
//         content: const Text(
//           "You've permanently denied this permission. Please go to settings to enable it.",
//         // ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.of(context).pop(),
//             child: const Text("Cancel"),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               openAppSettings();
//               Navigator.of(context).pop();
//             },
//             child: const Text("Open Settings"),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:device_info_plus/device_info_plus.dart';

class PermissionsHelper {
  /// Check and request camera permission
  static Future<bool> checkCameraPermission(BuildContext context) async {
    final status = await Permission.camera.status;
    if (status.isGranted) return true;

    final result = await Permission.camera.request();
    return _handleStatus(context, result);
  }

  /// Check and request gallery (photos + videos) access
  static Future<bool> checkGalleryPermission(BuildContext context) async {
    if (Platform.isAndroid) {
      final sdkInt = (await _getSdkInt());
      if (sdkInt >= 33) {
        final photoStatus = await Permission.photos.status;
        final videoStatus = await Permission.videos.status;

        if (photoStatus.isGranted && videoStatus.isGranted) return true;

        final photoResult = await Permission.photos.request();
        final videoResult = await Permission.videos.request();

        return _handleStatus(context, photoResult) &&
            _handleStatus(context, videoResult);
      } else {
        final result = await Permission.storage.request();
        return _handleStatus(context, result);
      }
    } else {
      final result = await Permission.photos.request();
      return _handleStatus(context, result);
    }
  }

  /// Check and request file/document storage permission
  static Future<bool> checkStoragePermission(BuildContext context) async {
    if (Platform.isAndroid) {
      final sdkInt = await _getSdkInt();
      if (sdkInt >= 30) {
        final manageResult = await Permission.manageExternalStorage.request();
        return _handleStatus(context, manageResult);
      } else {
        final result = await Permission.storage.request();
        return _handleStatus(context, result);
      }
    } else {
      final result = await Permission.photos.request();
      return _handleStatus(context, result);
    }
  }

  /// Handles the result and opens settings if denied permanently
  static bool _handleStatus(BuildContext context, PermissionStatus status) {
    if (status.isGranted) return true;

    if (status.isPermanentlyDenied) {
      _showPermanentDialog(context);
    } else {
      _showDeniedSnackbar(context);
    }
    return false;
  }

  static void _showDeniedSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text(
          'Permission denied. Please allow it from settings.',
        ),
        action: SnackBarAction(
          label: 'Go to Settings',
          onPressed: () => openAppSettings(),
        ),
      ),
    );
  }

  static void _showPermanentDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Permission Denied'),
        content: const Text(
          'You have permanently denied this permission. Please enable it in app settings.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              openAppSettings();
              Navigator.of(context).pop();
            },
            child: const Text('Open Settings'),
          ),
        ],
      ),
    );
  }

  /// Utility to get Android SDK version
  static Future<int> _getSdkInt() async {
    try {
      final info = await DeviceInfoPlugin().androidInfo;
      return info.version.sdkInt;
    } catch (_) {
      return 33; // fallback to highest for safety
    }
  }
}
