// import 'package:flutter/material.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// import 'package:oes/utils/Google_translator/google_translator.dart';
// import 'package:oes/utils/extensions/sizedbox_extension.dart';

// import '../../../utils/back_button.dart';
// import '../../../utils/size_config.dart';

// class PrivacyPolicy extends StatefulWidget {
//   const PrivacyPolicy({Key? key}) : super(key: key);

//   @override
//   State<PrivacyPolicy> createState() => _PrivacyPolicyState();
// }

// class _PrivacyPolicyState extends State<PrivacyPolicy> {
//   late InAppWebViewController inAppController;
//   int progressIndicator = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 10, left: 25),
//               child: Row(
//                 children: [
//                   const BackButtonWidget(),
//                   SizedBox(
//                     width: getProportionateScreenWidth(20),
//                   ),
//                   Text(
//                     "Privacy Policy",
//                     style: TextStyle(
//                         fontSize: getFontSize(18),
//                         color: Theme.of(context).hintColor,
//                         fontFamily: "Poppins",
//                         fontWeight: FontWeight.w500),
//                   ).translate()
//                 ],
//               ),
//             ),
//             getProportionateScreenHeight(15).height,
//             Expanded(
//               child: Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   InAppWebView(
//                     initialUrlRequest: URLRequest(
//                         url: Uri.parse(
//                             "https://obs-dev.onpassive.com/auth/privacypolicy")),
//                     onProgressChanged:
//                         (InAppWebViewController controller, int progress) {
//                       inAppController = controller;
//                       progressIndicator = progress;
//                       if (progress == 100) {
//                         setState(() {});
//                       }
//                     },
//                   ),
//                   progressIndicator < 100
//                       ? const CircularProgressIndicator()
//                       : const SizedBox()
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/images_url.dart';
import '../../../../constants/font_size.dart';


class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  late InAppWebViewController inAppController;
  int progressIndicator = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBar(
            backgroundColor:AppColors.colorPrimary,
            title: Text(
              "Privacy Policy",
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
                          "https://obs-dev.onpassive.com/auth/privacypolicy")),
                  onProgressChanged:
                      (InAppWebViewController controller, int progress) {
                    inAppController = controller;
                    progressIndicator = progress;
                    if (progress == 100) {
                      setState(() {});
                    }
                  },
                ),
                progressIndicator < 100
                    ? Lottie.asset(ImagesUrl.loadingJson, height: 40.w, width: 40.w)
                    : const SizedBox()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
