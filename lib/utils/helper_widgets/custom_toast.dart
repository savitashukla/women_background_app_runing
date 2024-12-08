import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:o_woman/utils/helper_widgets/capitalize_text_extension.dart';
import '../../app/app.dart';

class CustomToast {
  static Widget crossIcon = const Icon(Icons.close);

  static Future<dynamic> showSuccessToast({
    required String? msg,
    bool? isFavorite,
    String? title,
    Duration? duration,
    
  }) async {
    Flushbar? flush = Flushbar(
      title: title,
      message: msg.toString().toCapitalized(),
      backgroundColor: Colors.green,
      duration: duration ??
          const Duration(
            seconds: 1,
          ),
      margin: const EdgeInsets.all(16),
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      icon: CircleAvatar(
        backgroundColor: Colors.green.shade900,
        radius: 16,
        child: isFavorite != null && isFavorite
            ? const Icon(
                Icons.person_add_alt_1,
                color: Colors.white,
                size: 24,
              )
            : const Icon(
                size: 24,
                Icons.check,
                color: Colors.white,
              ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 17.0, vertical: 16.0),
    ); // <bool> is the type of the result passed to dismiss() and collected by show().then((result){})
    return _showToast(flush);
  }

  static Future<void> showWarningToast(
      {@required String? msg, Duration? duration}) async {
    Flushbar? flush = Flushbar(
      message: msg.toString().toCapitalized(),
      backgroundColor: Colors.orange,
      duration: duration ?? const Duration(seconds: 1),
      margin: const EdgeInsets.all(15),
      borderRadius: const BorderRadius.all(Radius.circular(15)),
      icon: const Icon(
        Icons.info_outline_rounded,
        color: Colors.white,
        size: 40,
      ),
      padding: const EdgeInsets.all(15),
    );
    return _showToast(flush);
  }

  static Future<dynamic> showErrorToast({@required String? msg}) {
    Flushbar flush = Flushbar(
      message: msg.toString().toCapitalized(),
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 1),
      margin: const EdgeInsets.all(15),
      borderRadius: const BorderRadius.all(Radius.circular(15)),
      icon: const Icon(
        Icons.cancel_outlined,
        color: Colors.white,
        size: 32,
      ),
      padding: const EdgeInsets.all(10),
    );
    return _showToast(flush);
  }

  static Future<void> showInfoToast(
      {@required String? msg, Duration? duration}) async {
    Flushbar flush = Flushbar(
      message: msg.toString().toCapitalized(),
      messageColor: Colors.black,
      backgroundColor: Colors.white,
      duration: duration ?? const Duration(seconds: 1),
      margin: const EdgeInsets.all(15),
      borderRadius: const BorderRadius.all(Radius.circular(15)),
      padding: const EdgeInsets.all(15),
    );
    return _showToast(flush);
  }

  static Future<void> showDownloadToast({
    required String msg,
    VoidCallback? onTap,
  }) async {
    Flushbar flush = Flushbar(
      message: msg,
      messageColor: Colors.black,
      backgroundColor: Colors.green,
      duration: const Duration(seconds: 2),
      margin: const EdgeInsets.all(15),
      borderRadius: const BorderRadius.all(Radius.circular(15)),
      mainButton: TextButton(
        onPressed: onTap,
        child: const Text(
          "Open",
          style: TextStyle(color: Colors.white),
        ),
      ),
      padding: const EdgeInsets.all(15),
    );
    return await _showToast(flush);
  }

  static dynamic _showToast(Flushbar flush) async {
    return await flush.show(navigatorKey.currentState!.context!);
  }
}
