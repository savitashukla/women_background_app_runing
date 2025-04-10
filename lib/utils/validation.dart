import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:o_woman/app/viewmodels/login/login_controller.dart';
import 'package:o_woman/constants/images_url.dart';
import 'package:o_woman/utils/password_validator_state.dart';

class Validation {
  static bool isValidString(String data) {
    return data.trim().isNotEmpty;
  }

  static omailValidationCharecters(String? value, String fieldName) {
    // Define a regular expression to check if the last character is a special character
    RegExp specialCharacterRegex = RegExp(r'[!@#\$%^&*(),.?":{}|<>]');
    if (value != null) {
      if (value.isNotEmpty) {
        // Check if the last character matches the regular expression
        if (specialCharacterRegex.hasMatch(value.substring(value.length - 1))) {
          return "Last character of the username should be only letters (a-z) or numbers (0-9)";
        }
      }
    }

    if (RegExp(r'[^a-zA-Z0-9\.]').hasMatch(value ?? '')) {
      return "Special characters not allowed,Only full stop(.) allowed";
    }
    if (value == null || value.trim() == '') {
      return '$fieldName is required';
    }
    return null;
  }

  static createAccountConfirmPasswordValidation(
      String password, String? fieldName, String cpass) {
    String? passCheck = CreateAccountpasswordValidation(password, fieldName);
    /*  if (passCheck != null) {
      // return CreateAccountpasswordValidation(password, fieldName);
    } else*/
    if (password != cpass) {
      return "Password & Confirm password should be same";
    }
    return null;
  }

  static CreateAccountpasswordValidation(String password, String? fieldName) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (password.isEmpty) {
      return requiredFieldValidation(password, fieldName!);
    } else if (!regex.hasMatch(password)) {
      return "Password should contain at least one Capital Letter, Small Letters, Numbers & a special character";
    } else if (password.length > 3) {
      return null;
    }
    return 'Please enter valid password';
  }

  static alternateEmailValidation(String email, String? fieldName) {
    if (email.isEmpty) {
      return requiredFieldValidation(email, fieldName!);
    } else if (RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      return null;
    }
    return 'Alternate email id is required';
  }

  static bool validMobileNumber(String mobileNumber) {
    if (isValidString(mobileNumber)) {
      return false;
    }
    return true;
  }

  static bool validMobileNumberLength(String mobileNumber) {
    if (mobileNumber.length < 7 || mobileNumber.length > 15) {
      return false;
    }
    return true;
  }

  static requiredFieldValidation(String? value, String fieldName) {
    if (value == null || value.trim() == '') {
      return '$fieldName is required';
    }
    return null;
  }

  static GetBuilder passwordInfoWidget(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) {
        ValidatePassWord? passwordState = controller.validatePassWord;
        if (passwordState != null && !passwordState.isButtonEnabled) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              color: Theme.of(context).dialogBackgroundColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "To make your password stronger",
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Center(
                        child: Column(
                      children: [
                        _buildChip(
                          context,
                          "At least 1 Uppercase and Lowercase letters (A-Z, a-z) ",
                          isCorrect: passwordState.isUpperCaseExists &&
                              passwordState.isLowerCaseExists,
                        ),
                        // _buildChip(
                        //   context,
                        //   "1 lower case letter",
                        //   isCorrect: passwordState.isLowerCaseExists,
                        // ),
                        _buildChip(context, "At least 1 number (0-9)",
                            isCorrect: passwordState.isNumberExists),
                        _buildChip(
                          context,
                          "At least 1 special character allowed (!#@\$%&*_-^)",
                          isCorrect: passwordState.isSpecialCharacterExists,
                        ),
                        _buildChip(
                          context,
                          "Minimum character length should be 8",
                          isCorrect: passwordState.is8Characters,
                        ),
                      ],
                    )),
                  ],
                ),
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }

  static Widget _buildChip(BuildContext context, String label,
      {bool isCorrect = false}) {
    return SizedBox(
      // width: ScreenConfig.width,
      child: Padding(
        padding: EdgeInsets.all(5.0.sp),
        child: Row(
          children: [
            SvgPicture.asset(
              ImagesUrl.correctOrWrong,
              color: isCorrect ? Colors.green : Colors.red,
            ),
            SizedBox(
              width: 8.w,
            ),
            Text(
              label,
            ),
          ],
        ),
      ),
    );
  }
}
