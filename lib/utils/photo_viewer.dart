import 'dart:io';

import 'package:flutter/material.dart';

// Decodes at screen resolution, not the camera's full sensor resolution -
// one photo at a time here is nothing like decoding 55 thumbnails at once,
// but there's still no reason to decode more pixels than the screen can show
void showFullScreenPhoto(BuildContext context, File file) {
  Navigator.of(context).push(PageRouteBuilder(
    opaque: false,
    barrierColor: Colors.black,
    pageBuilder: (context, _, _) {
      final dpr = MediaQuery.of(context).devicePixelRatio;
      final screenWidth = (MediaQuery.of(context).size.width * dpr).round();

      return GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            children: [
              Center(
                child: InteractiveViewer(
                  minScale: 1,
                  maxScale: 4,
                  child: Image.file(file, cacheWidth: screenWidth),
                ),
              ),
              SafeArea(
                child: IconButton(
                  icon: const Icon(Icons.close, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ],
          ),
        ),
      );
    },
  ));
}
