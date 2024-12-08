import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SearchPageController extends GetxController {
  late stt.SpeechToText speech;
  RxBool isListening = false.obs;
  TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    speech = stt.SpeechToText();
  }

  void listen() async {
    if (!isListening.value) {
      bool available = await speech.initialize(
        onStatus: (status) {
          print('status: $status');
        },
        onError: (errorNotification) {
          print('error: $errorNotification');
        },
      );
      if (available) {
        isListening.value = true;
        searchController.text = 'Listening...';

        speech.listen(
          onResult: (result) {
            searchController.text = result.recognizedWords;
          },
        );
      } else {
        Fluttertoast.showToast(
          msg: "Speech recognition not available",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
      }
    } else {
      isListening.value = false;
      speech.stop();
    }
    update(); // Notify listeners of the changes
  }

  void onChanged(String v) {
    if (v.isEmpty) {
      isListening.value = false;
      update();
    }
  }
}
