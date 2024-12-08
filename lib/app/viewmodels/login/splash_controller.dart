import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:o_woman/utils/helper_widgets/custom_toast.dart';
import 'package:o_woman/utils/hive_helper.dart';

import '../../routes/routes.dart';
import '../hum_profile/app_lock_typescreen_controller.dart';

class SplashController extends GetxController {
  var splashDelay = 6.obs;

  navigationPage(BuildContext context) async {
    if (HiveHelper.getData("today_date") == null) {
      Navigator.pushNamed(context, Routes.welcomePage);
    } else {
      if (DateTime.parse(HiveHelper.getData("today_date")!)
              .compareTo(DateTime.now().subtract(const Duration(days: 30))) >
          0) {
        if (HiveHelper.getData("token") == null) {
          Navigator.pushNamed(context, Routes.welcomePage);
        } else {
          print(
              "JwtDecoder.isExpired(HiveHelper. ${JwtDecoder.isExpired(HiveHelper.getData("token"))}");

          if (JwtDecoder.isExpired(HiveHelper.getData("token"))) {
            CustomToast.showErrorToast(msg: "Session Expired");
            Navigator.pushNamed(context, Routes.welcomePage);
          } else {
            AppLockTypeScreenController controller =
                await Get.put(AppLockTypeScreenController());
            controller.getStoreData();
          }
        }
      } else {
        Navigator.pushNamed(context, Routes.welcomePage);
      }
    }
  }

/*   if (HiveHelper.getData("today_date") == null) {
      Navigator.pushNamed(context, Routes.welcomePage);
    } else {
      if (DateTime.parse(HiveHelper.getData("today_date")!)
              .compareTo(DateTime.now().subtract(const Duration(days: 30))) >
          0) {
        if (HiveHelper.getData("token") == null) {
          Navigator.pushNamed(context, Routes.welcomePage);
        } else {
          AppLockTypeScreenController controller =
              await Get.put(AppLockTypeScreenController());

          controller.getStoreData();
        }
      } else {
        Navigator.pushNamed(context, Routes.welcomePage);
      }
       }
  }*/
}
