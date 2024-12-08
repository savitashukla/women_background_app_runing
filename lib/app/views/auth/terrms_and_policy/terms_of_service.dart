import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:o_woman/constants/images_url.dart';

import '../../../../constants/font_size.dart';


class TermsOfService extends StatefulWidget {
  const TermsOfService({Key? key}) : super(key: key);

  @override
  State<TermsOfService> createState() => _TermsOfServiceState();
}

class _TermsOfServiceState extends State<TermsOfService> {
  late InAppWebViewController inAppWebViewController;

  late InAppWebViewController inAppController;
  int progressIndicator = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBar(
            backgroundColor: Theme.of(context).cardColor,
            title: Text(
              "Terms & Conditions",
              style: w500_16Poppins(color: Colors.white),
            ),
            centerTitle: true,
          ),
          height15,
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                InAppWebView(
                  initialUrlRequest: URLRequest(
                    url: Uri.parse(
                        "https://obs-dev.onpassive.com/auth/termofuse"),
                  ),
                  onProgressChanged:
                      (InAppWebViewController controller, int progress) {
                    inAppController = controller;
                    progressIndicator = progress;
                    if (progress == 100) {
                      setState(() {});
                    }
                  },
                ),
                if (progressIndicator < 100)
                  Lottie.asset(ImagesUrl.loadingJson, height: 40.w, width: 40.w),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
