import 'dart:typed_data';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class Qrcode extends StatelessWidget {
  Qrcode({super.key, required this.data});

  final String data;
  var result;

  final ScreenshotController screenshotController = ScreenshotController();

  // Future<void> caputreAndSaveImage() async {
  //   final Uint8List? uint8list = await screenshotController.capture();
  //   if (uint8list != null) {
  //     final PermissionStatus status = await Permission.storage.request();
  //     if (status.isGranted) {
  //       final result = await ImageGallerySaver.saveImage(uint8list);
  //       if (result['isSuccess']) {
  //         print("Image Save");
  //       } else {
  //         print("Failed To Save");
  //       }
  //     } else {
  //       print("Permission access denied");
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Qr Code Generate"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Screenshot(
              controller: screenshotController,
              child: QrImageView(
                data: data,
                version: QrVersions.auto,
                gapless: false,
                size: 320,
              ),
            ),
            const SizedBox(height: 20),
            const Text("Scan QrCode"),
            // ElevatedButton(
            //     onPressed: () async {
            //       await caputreAndSaveImage();
            //     },
            //     child: Text("Save Qrcode"))
          ],
        ),
      ),
    );
  }
}
