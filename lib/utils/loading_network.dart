import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:o_woman/utils/logger_utils.dart';

import '../app/app.dart';

class LoadingNetwork {
  showProgress() async {
     showGeneralDialog(
      context: navigatorKey.currentState!.context,
      barrierLabel: "Barrier",
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.5),
      // transitionDuration: Duration(milliseconds: 200),
      pageBuilder: (_, __, ___) {
        return Center(
          child: Container(
              height: 40.h,
              width: 40.w,
              decoration: const BoxDecoration(

                  color: Colors.transparent,
                  shape: BoxShape.circle),

              child: const CircularProgressIndicator()),
        );
      },
    );
  }


  hideProgressContext(BuildContext context)  {
    Future.delayed(const Duration(milliseconds: 10),
            () {
              Navigator.pop(context);
          //   Navigator.pushNamed(context, Routes.calenderMain);
        });

  }
  hideProgress()  {
    Future.delayed(const Duration(milliseconds: 300),
            () {
              Navigator.pop(navigatorKey.currentState!.context);
          //   Navigator.pushNamed(context, Routes.calenderMain);
        });

  }
}
