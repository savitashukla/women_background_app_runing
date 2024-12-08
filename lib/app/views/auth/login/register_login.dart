import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:o_woman/app/routes/routes.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/app_string.dart';

import '../../../../constants/font_size.dart';
import '../../../../utils/helper_widgets/helper_widgets.dart';

class RegisterOrLogin extends StatelessWidget {
  final String text;
  final int value;

  const RegisterOrLogin({super.key, required this.text, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          value == 1 ? AppString.noAccount : AppString.haveAccount,
          style: w400_12Poppins(),
        ),
        GestureDetector(
          onTap: () {
            value == 2
                ? Navigator.pushNamed(
                    context,
                    Routes.login,
                  )
                : Navigator.pushNamed(context, Routes.register);
            // Navigator.pushNamed(context, RoutesManager.signupScreen);
          },
          child: Text(text, style: w700_12Poppins(color: AppColors.mainColor)),
        )
      ],
    );
  }
}

class TermsAndConditionsForAuth extends StatelessWidget {
  const TermsAndConditionsForAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        children: [
          Text(
            '''By continuing, you agree to the''',
            style: w400_12Poppins(),
          ),
          GestureDetector(
            onTap: () {
              // Navigator.pushNamed(context, Routes.termsNConditionsPrivacy);
              HelperWidget().flutterCustomToast("coming soon");
              //  Navigator.pushNamed(context, Routes.termsNConditionsPrivacy);
            },
            child: Text(
              ''' Terms of Service, ''',
              style: w400_12Poppins(color: AppColors.mainColor),
            ),
          ),
          GestureDetector(
            onTap: () {
              HelperWidget().flutterCustomToast("coming soon");
              // Navigator.pushNamed(context, Routes.privacyPolicy);
              // Navigator.pushNamed(context, Routes.privacyPolicy);
            },
            child: Text('''Privacy Policy''',
                style: w400_12Poppins(color: AppColors.mainColor)),
          ),
          Text(''' and ''', style: w400_12Poppins()),
          GestureDetector(
            onTap: () {
              // Navigator.pushNamed(context, Routes.termsNConditionsPrivacy);
              HelperWidget().flutterCustomToast("coming soon");
              //  Navigator.pushNamed(context, Routes.termsNConditionsPrivacy);
            },
            child: Text(
              ''' Refund Policy ''',
              style: w400_12Poppins(color: AppColors.mainColor),
            ),
          ),
        ],
      ),
    );
  }
}
