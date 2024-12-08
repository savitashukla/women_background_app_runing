import 'dart:convert';

import 'package:flutter/foundation.dart';

class HelperMethod
{
  customPrint(var data) async {
    try {
      if (kDebugMode) {
        print("$data");
      } else if (kReleaseMode) {
        // this is release mode
      }
    } catch (e) {
      debugPrint("$e");
    }
  }



}
Uint8List convertBase64Image(String? base64String) {
  return const Base64Decoder().convert(base64String!.split(',').last);
}
