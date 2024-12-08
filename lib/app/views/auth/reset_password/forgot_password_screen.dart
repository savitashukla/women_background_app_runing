import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:o_woman/app/routes/routes.dart';
import 'package:o_woman/app/viewmodels/login/forget_password_with_otp_controller.dart';
import 'package:o_woman/app/views/auth/common_auth_widgets/common_appbar.dart';
import 'package:o_woman/app/views/auth/login/login.dart';
import 'package:o_woman/app/views/auth/login/register_login.dart';
import 'package:o_woman/app/views/home/circle_paint/const/size_const.dart';
import 'package:o_woman/constants/app_string.dart';
import 'package:o_woman/constants/images_url.dart';
import 'package:o_woman/utils/helper_widgets/custom_toast.dart';
import 'package:o_woman/utils/screen_config.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/font_size.dart';
import '../../../../utils/helper_widgets/commonTextField.dart';
import '../../../../utils/helper_widgets/custome_button.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  ForgetPasswordWithOtpController controllerLogin =
      Get.put(ForgetPasswordWithOtpController());

  @override
  void dispose() {
    controllerLogin.emailController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    controllerLogin.emailController = TextEditingController();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textColor,
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: SizeConfig.screenHeight,
        child: Stack(
          children: [
            CommonAppbar(
                title: "Reset your password",
                center: true,
                onTap: () {
                  Navigator.pop(context);
                }),
            Positioned(
              top: 65.h,
              // bottom: 5,
              left: 0,
              right: 0,
              child: Wrap(
                children: [
                  SizedBox(
                    height: ScreenConfig.height < 700
                        ? ScreenConfig.height * 0.12
                        : ScreenConfig.height * 0.13,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height - 100,
                      child: Card(
                    color: AppColors.whiteColor,
                    margin: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(16.w),
                        vertical: getProportionateScreenHeight(10.h)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.87,
                      child: Column(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 16, right: 16, bottom: 100.h),
                              child: Form(
                                  key: _formKey,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        height15,
                                        SvgPicture.asset(ImagesUrl.appLogo),
                                        height70,
                                        height10,
                                        const Center(
                                          child: Text(
                                            'Its Okay! Reset password ',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: AppColors
                                                    .colorPrimaryTestDarkMore,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                        height15,
                                        _emailWidget(context),
                                        _submitButton(context),
                                        height10,
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            "Back To Login",
                                            style: w400_14Poppins(
                                                color: AppColors.mainColor),
                                          ),
                                        ),
                                      ]))),
                          const Spacer(),
                          const TermsAndConditionsForAuth(),
                          height10,
                        ],
                      ),
                    ),
                  )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _submitButton(BuildContext context) {
    return CustomButton(
      width: MediaQuery.of(context).size.width,
      buttonText: "Send",
      buttonColor: AppColors.mainColor,
      onTap: () {
        if (controllerLogin.emailController.text.isEmpty) {
          CustomToast.showErrorToast(
              msg: "Please enter alternate email address");
        } else if (_formKey.currentState!.validate()) {
          FocusScope.of(context).unfocus();
          controllerLogin.forgotPassword(controllerLogin.emailController.text);
        }
      },
    );
  }

  Widget _emailWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.h),
      child: CommonTextFormField(
          label: "Alternate Email",
          autoValid: true,
          image: SvgPicture.asset(ImagesUrl.emailIconAuth),
          border: 8.r,
          borderColor: Colors.transparent,
          starIcon: "*",
          addStar: true,
          fillColor: AppColors.colorGray.withOpacity(0.15),
          controller: controllerLogin.emailController,
          hintText: 'Enter Alternate Email ID',
          keyboardType: TextInputType.emailAddress,
          style: w500_14Poppins(),
          validator: (value) {
            if (value!.isNotEmpty &&
                !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(value)) {
              return "Invalid alternate emial address";
            }
            return null;
          }),
    );
  }
}
