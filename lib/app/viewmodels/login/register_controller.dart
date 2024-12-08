// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:o_woman/app/models/CaptchaModel.dart';

import '../../../utils/helper_method.dart';
import '../../../utils/helper_widgets/custom_toast.dart';
import '../../../utils/logger_utils.dart';
import '../../../utils/password_validator_state.dart';
import '../../app.dart';
import '../../routes/routes.dart';
import '../../services/web_services_helper.dart';

class RegisterController extends GetxController {
  late TextEditingController passwordController;
  var enableConfirmPasswordFeild = false.obs;
  var registerIsVisible = false.obs;
  var registerIsVisibleCon = false.obs;
  var termsCheckbox = false.obs;
  var passObsureChangePwd = false.obs;
  var captchaModel = CaptchaModel().obs;

  void apiGetCaptcha() async {
    Map<String, dynamic>? response = await WebServicesAuthHelper().apiGetCaptchaN();
    HelperMethod().customPrint("check data ${response.toString()}");
    if (response != null) {
      captchaModel.value = CaptchaModel.fromJson(response);
      CustomToast.showSuccessToast(msg: "Login Suc...........");
    }
  }

  Future<void> getRegisterApi(mapData) async {
    Map<String, dynamic>? response =
        await WebServicesAuthHelper().apiRegister(mapData);
    HelperMethod().customPrint("check data ${response.toString()}");
    if (response != null) {
      CustomToast.showSuccessToast(msg: "Register successfully ");
      Navigator.pushNamed(
        navigatorKey.currentState!.context,
        Routes.login,
      );
      // Navigator.pushNamed(navigatorKey.currentState!.context, Routes.otpScreen,  arguments: email,);
    } else
      {
      }
  }

  ValidatePassWord? validatePassWord;

  passwordValidatorState(
    String password,
  ) {
    bool atLeastOneUpperCase = RegExp(r'''([A-Z])''').hasMatch(
      password.trim(),
    );
    bool atLeastOneLowerCase = RegExp(r'''([a-z])''').hasMatch(
      password.trim(),
    );
    bool atLeastOneDigit = RegExp(r"([0-9])").hasMatch(
      password.trim(),
    );
    bool atLeastOneSpecialCharecter = RegExp(r'''[*!@#\$&*_~]''').hasMatch(
      password.trim(),
    );
    bool atLeast8Charecters = RegExp('''(.{8,})''').hasMatch(
      password.trim(),
    );

    debugPrint('atLeast8Charecters: $atLeast8Charecters');
    bool isValidPassWord = atLeastOneLowerCase &&
        atLeastOneDigit &&
        atLeastOneSpecialCharecter &&
        atLeastOneUpperCase &&
        atLeast8Charecters;
    validatePassWord = ValidatePassWord(
      is8Characters: atLeast8Charecters,
      isLowerCaseExists: atLeastOneLowerCase,
      isNumberExists: atLeastOneDigit,
      isValidPassWord: isValidPassWord,
      isSpecialCharacterExists: atLeastOneSpecialCharecter,
      isUpperCaseExists: atLeastOneUpperCase,
      password: password,
    );
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    passwordController = TextEditingController();

  }
}
