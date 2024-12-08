import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:o_woman/app/views/auth/common_auth_widgets/common_appbar.dart';
import 'package:o_woman/app/views/auth/login/register_login.dart';
import 'package:o_woman/app/views/home/circle_paint/const/size_const.dart';
import 'package:o_woman/constants/images_url.dart';
import 'package:o_woman/utils/helper_widgets/custom_toast.dart';
import 'package:o_woman/utils/helper_widgets/custome_button.dart';
import 'package:o_woman/utils/helper_widgets/helper_widgets.dart';
import 'package:o_woman/utils/screen_config.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/font_size.dart';
import '../../../../utils/helper_widgets/commonTextField.dart';
import '../../../viewmodels/login/login_controller.dart';

class OTPScreenView extends StatefulWidget {
  final String email;

  const OTPScreenView({super.key, required this.email});

  @override
  State<OTPScreenView> createState() => _OTPScreenViewState();
}

class _OTPScreenViewState extends State<OTPScreenView> {
  LoginController controllerLogin = Get.find();

  TextEditingController? _emailController;

  TextEditingController controllerOtpPin = TextEditingController();

  String? enterOtp;

  @override
  void initState() {
    controllerLogin.controllerForgetPassword.value = 180;
    _emailController = TextEditingController(text: widget.email);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controllerOtpPin.dispose();
    //  controllerLogin.emailControllerOTP.dispose();
    // controllerLogin.passwordController.dispose();
    // controllerLogin.usernameController.dispose();
  }

  Duration duration = const Duration(seconds: 5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
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
                                height:
                                    MediaQuery.of(context).size.height * 0.82,
                                child: SizedBox(
                                  height: MediaQuery.of(context).size.height,
                                  child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      // mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        height15,
                                        SvgPicture.asset(ImagesUrl.appLogo),
                                        height70,
                                        height10,
                                        height5,
                                        Text('We have sent a code on',
                                            style: w400_16Poppins()),
                                        Text(widget.email,
                                            style: w700_14Poppins()),
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'To change mail, ',
                                                style: w400_12Poppins(
                                                    color:
                                                        AppColors.textColorQus),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text(
                                                  "Click here",
                                                  style: w500_14Poppins(
                                                      color:
                                                          AppColors.mainColor),
                                                ),
                                              )
                                            ]),
                                        height20,
                                        _otpPinWIdget(context),
                                        _otpExpiresAndResendWidget(context),
                                        height20,
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.w, vertical: 5.h),
                                          child: _verifyOtpButton(context),
                                        ),
                                        height40,
                                        const Spacer(),
                                        const TermsAndConditionsForAuth(),
                                        height10,
                                      ]),
                                ),
                              ),
                            ))),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Widget _otpExpiresAndResendWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            Obx(
              () => controllerLogin.controllerForgetPassword.value == 0
                  ? const Text('OTP Expired ', style: TextStyle())
                  : const Text('OTP Expires in ', style: TextStyle()),
            ),
            Obx(
              () => controllerLogin.controllerForgetPassword.value > 0
                  ? TweenAnimationBuilder(
                      tween: Tween<double>(
                          begin:
                              controllerLogin.controllerForgetPasswordD.value,
                          end: 0),
                      duration: Duration(
                          seconds:
                              controllerLogin.controllerForgetPassword.value),
                      builder: (context, value, child) {
                        // double val = value;
                        int test = value.toInt();
                        /* controllerLogin.resendIconVisibleTime.value =
                                            value.toInt();*/
                        return Text(test == 0 ? '' : " $test",
                            style: w600_14Poppins());
                      },
                      onEnd: () {
                        controllerLogin.controllerForgetPassword.value = 0;
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
      buttonText: 'Confirm OTP',
      width: MediaQuery.of(context).size.width,
      buttonColor:
          // controllerOtpPin.text.isEmpty
          //     ? AppColors.disableColor:
          AppColors.mainColor,
      onTap: () {
        if (controllerOtpPin.text.isEmpty) {
          CustomToast.showWarningToast(msg: "Please enter OTP");
        } else if (controllerOtpPin.text.isNotEmpty &&
            controllerOtpPin.text.length < 6) {
          CustomToast.showWarningToast(
              msg: "OTP length should be 6 characters");
        } else {
          controllerLogin.verifyOtpLogin(
              context, _emailController!.text, enterOtp!);
        }
      },
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
                      if (controllerLogin.controllerForgetPassword.value == 0) {
                        controllerLogin.controllerForgetPassword.value = 180;
                        controllerLogin.reSendOtpApi(
                          widget.email,
                        );
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Resend OTP",
                          style: w700_12Poppins(
                              color: controllerLogin
                                          .controllerForgetPassword.value ==
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
              enterOtp = code;

              // controller.Otp.value = code;
            }
          },
          onCompleted: (code) {
            if (code.length == 6) {
              enterOtp = code;
            }
          },
          appContext: context,
        ),
      ],
    );
  }
}
