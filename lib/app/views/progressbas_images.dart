import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:o_woman/constants/images_url.dart';

class ProgressBarWithImages extends StatefulWidget {

  late ui.Image? startImage;
  late ui.Image? endImage;
  ProgressBarWithImages({super.key,
    this.startImage,
    this.endImage
});

  @override
  _ProgressBarWithImagesState createState() => _ProgressBarWithImagesState();
}

class _ProgressBarWithImagesState extends State<ProgressBarWithImages> {
/*  late ui.Image startImage;
  late ui.Image endImage;*/

  @override
  void initState() {
    super.initState();
  }

/*  Future<void> loadImages() async {
    ByteData startImageData = await rootBundle.load(ImagesUrl.sleepIcon);
    Uint8List startImageList = startImageData.buffer.asUint8List();
    startImage = await decodeImageFromList(startImageList);

    ByteData endImageData = await rootBundle.load(ImagesUrl.sleepIcon);
    Uint8List endImageList = endImageData.buffer.asUint8List();
    endImage = await decodeImageFromList(endImageList);

    setState(() {}); // Refresh the UI after loading images
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Progress Bar with Images')),
      body: Center(
        child: CustomPaint(
          size: Size(300, 150),
          painter: ProgressBarPainter(widget.startImage!, widget.endImage!),
        ),
      ),
    );
  }
}

class ProgressBarPainter extends CustomPainter {
  final ui.Image startImage;
  final ui.Image endImage;

  ProgressBarPainter(this.startImage, this.endImage);

  @override
  void paint(Canvas canvas, Size size) {
    // Draw the progress bar background
    Paint backgroundPaint = Paint()..color = Colors.grey;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), backgroundPaint);

    // Draw the start image
    if (startImage != null) {
      double startImageWidth = startImage.width.toDouble();
      double startImageHeight = startImage.height.toDouble();
      canvas.drawImage(startImage, Offset(0, 0), Paint());
    }

    // Draw the end image
    if (endImage != null) {
      double endImageWidth = endImage.width.toDouble();
      double endImageHeight = endImage.height.toDouble();
      canvas.drawImage(endImage, Offset(size.width - endImageWidth, 0), Paint());
    }

    // Draw the progress bar
    Paint progressBarPaint = Paint()..color = Colors.blue;
    double progressWidth = size.width * 0.7; // Example progress width
    canvas.drawRect(Rect.fromLTWH(0, 0, progressWidth, size.height), progressBarPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}


