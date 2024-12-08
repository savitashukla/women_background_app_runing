import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:o_woman/app/views/auth/common_auth_widgets/common_appbar.dart';
import 'package:o_woman/app/views/auth/login/register_login.dart';
import 'package:o_woman/app/views/home/circle_paint/const/size_const.dart';
import 'package:o_woman/constants/images_url.dart';
import 'package:o_woman/utils/helper_widgets/custom_toast.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_string.dart';
import '../../../../constants/font_size.dart';
import '../../../../utils/helper_widgets/custome_button.dart';
import '../../../../utils/screen_config.dart';
import '../../../viewmodels/login/forget_password_with_otp_controller.dart';

class ForgetPasswordOtpScreen extends StatefulWidget {
  const ForgetPasswordOtpScreen({Key? key, required this.email})
      : super(key: key);
  final String email;

  @override
  State<ForgetPasswordOtpScreen> createState() =>
      _ForgetPasswordOtpScreenState();
}

class _ForgetPasswordOtpScreenState extends State<ForgetPasswordOtpScreen>
    with RouteAware {
  final _formKey = GlobalKey<FormState>();
  String? otp;

  // LoginController controllerLogin = Get.put(LoginController());
  ForgetPasswordWithOtpController controllerForgetPassword = Get.find();

  var controllerOtpPin = TextEditingController();

  TextEditingController? controller;

  @override
  void initState() {
    controllerForgetPassword.resendIconVisibleTime.value = 180;
    controller = TextEditingController(text: widget.email);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textColor,
      body: SizedBox(
        height: SizeConfig.screenHeight,
        child: Stack(
          children: [
            CommonAppbar(
                title: "Verification code",
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
                        child: SafeArea(
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.82,
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                // mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  height15,
                                  SvgPicture.asset(ImagesUrl.appLogo),
                                  height70,
                                  height10,
                                  height5,
                                  Text('We have sent a code on',
                                      textAlign: TextAlign.center,
                                      style: w400_12Poppins()),
                                  Text(widget.email, style: w700_14Poppins()),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'To change mail, ',
                                          style: w400_12Poppins(
                                              color: AppColors.textColorQus),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            "Click here",
                                            style: w500_14Poppins(
                                                color: AppColors.mainColor),
                                          ),
                                        )
                                      ]),
                                  height20,
                                  _otpPinWIdget(context),
                                  height20,
                                  _otpExpiresAndResendWidget(context),
                                  height20,
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10.w, vertical: 5.h),
                                    child: _verifyOtpButton(context),
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 8.h),
                                    child: const TermsAndConditionsForAuth(),
                                  ),
                                  height10,
                                ],
                              ),
                            ),
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

  Widget _otpExpiresAndResendWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            Obx(
              () => controllerForgetPassword.resendIconVisibleTime.value == 0
                  ? const Text('OTP Expired ', style: TextStyle())
                  : const Text('OTP Expires in ', style: TextStyle()),
            ),
            Obx(
              () => controllerForgetPassword.resendIconVisibleTime.value > 0
                  ? TweenAnimationBuilder(
                      tween: Tween<double>(
                          begin: controllerForgetPassword
                              .resendIconVisibleTimeD.value,
                          end: 0),
                      duration: Duration(
                          seconds: controllerForgetPassword
                              .resendIconVisibleTime.value),
                      builder: (context, value, child) {
                        // double val = value;
                        int test = value.toInt();
                        /* controllerLogin.resendIconVisibleTime.value =
                                            value.toInt();*/
                        return Text(test == 0 ? '' : " $test",
                            style: w600_14Poppins());
                      },
                      onEnd: () {
                        controllerForgetPassword.resendIconVisibleTime.value =
                            0;
                      },
                    )
                  : const SizedBox(
                      height: 0,
                    ),
            ),
          ],
        ),
      ]),
    );
  }

  CustomButton _verifyOtpButton(BuildContext context) {
    return CustomButton(
      buttonText: "Verify OTP",
      buttonColor: AppColors.mainColor,
      onTap: () {
        if (controllerOtpPin.text.isEmpty) {
          CustomToast.showWarningToast(msg: "Please enter OTP");
        } else if (controllerOtpPin.text.isNotEmpty &&
            controllerOtpPin.text.length < 6) {
          CustomToast.showWarningToast(
              msg: "OTP length should be 6 characters");
        } else {
          controllerForgetPassword.forgotPasswordOtpVerify(
              controller!.text, otp!);
        }
      },
      width: MediaQuery.of(context).size.width,
    );
  }

  Widget _otpPinWIdget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Enter 6 digit code below",
                style: w400_12Poppins(),
              ),
              Obx(() => InkWell(
                    onTap: () {
                      if (controllerForgetPassword
                              .resendIconVisibleTime.value ==
                          0) {
                        controllerForgetPassword.resendIconVisibleTime.value =
                            180;
                        controllerForgetPassword.resendOtpApi(
                          controllerForgetPassword.emailController.text,
                        );
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Resend OTP",
                          style: w700_12Poppins(
                              color: controllerForgetPassword
                                          .resendIconVisibleTime.value ==
                                      0
                                  ? AppColors.mainColor
                                  : AppColors.colorGray),
                        ),
                        // SvgPicture.asset(ImagesUrl.resendIcon)
                      ],
                    ),
                  )),
            ],
          ),
        ),
        SizedBox(
          height: 4.h,
        ),
        PinCodeTextField(
          showCursor: true,
          autoFocus: false,
          length: 6,
          cursorColor: AppColors.blackColor,
          controller: controllerOtpPin,
          obscureText: false,
          enableActiveFill: true,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          mainAxisAlignment: MainAxisAlignment.center,
          textStyle: const TextStyle(
              fontSize: 16,
              fontFamily: "Poppins",
              fontWeight: FontWeight.bold,
              color: AppColors.blackColor),
          keyboardType: TextInputType.number,
          pinTheme: PinTheme(
            borderWidth: 1,
            fieldOuterPadding: EdgeInsets.only(right: 12.w),
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(10.r),
            activeColor: AppColors.colorPrimaryLight.withOpacity(0.7),
            inactiveColor: Colors.transparent,
            selectedColor: AppColors.colorPrimaryLight.withOpacity(0.7),
            activeFillColor: Colors.transparent,
            inactiveFillColor: AppColors.colorGray.withOpacity(0.18),
            selectedFillColor: Colors.transparent,
            fieldHeight: 40.h,
            fieldWidth: 40.w,
          ),
          animationType: AnimationType.fade,
          animationDuration: const Duration(milliseconds: 300),
          enablePinAutofill: true,
          onChanged: (code) {
            if (code.length == 6) {
              otp = code;

              // controller.Otp.value = code;
            }
          },
          onCompleted: (code) {
            if (code.length == 6) {
              otp = code;
            }
          },
          appContext: context,
        ),
      ],
    );
  }
}
