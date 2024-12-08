// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:o_woman/utils/helper_widgets/custom_toast.dart';

import '../../../utils/helper_method.dart';
import '../../../utils/logger_utils.dart';
import '../../app.dart';
import '../../routes/routes.dart';
import '../../services/web_services_helper.dart';

class ForgetPasswordWithOtpController extends GetxController {
  late TextEditingController emailController;
  var resendIconVisibleTime = 180.obs;
  var resendIconVisibleTimeD = 180.0.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void forgotPassword(String email) async {
    Map<String, dynamic>? response =
        await WebServicesAuthHelper().forgotPassword(email);
    HelperMethod().customPrint("check data ${response.toString()}");
    if (response != null) {
      CustomToast.showSuccessToast(msg: "Forgot Password Success");

      Navigator.pushNamed(
        navigatorKey.currentState!.context,
        Routes.forgetPasswordOtpScreen,
        arguments: email,
      );
    } else {
    //  Fluttertoast.showToast(msg: "SomeThing Went Wrong");
    }
  }

  void resendOtpApi(String email) async {
    Map<String, dynamic>? response =
        await WebServicesAuthHelper().forgotPassword(email);
    HelperMethod().customPrint("check data ${response.toString()}");
    if (response != null) {
       CustomToast.showSuccessToast(msg: "Resend Otp Successfully");
    } else {
      CustomToast.showErrorToast(msg: "Something Went Wrong");
    }
  }

  void forgotPasswordOtpVerify(String email, String otp) async {
    Map<String, dynamic>? response =
        await WebServicesAuthHelper().forgotPasswordOtpVerify(email, otp);
    HelperMethod().customPrint("check data ${response.toString()}");
    if (response != null) {
      CustomToast.showSuccessToast(msg: "Sent Otp Successfully");

      Navigator.pushNamed(
          navigatorKey.currentState!.context, Routes.changePasswordPage,
          arguments: email);
    }
  }
}
