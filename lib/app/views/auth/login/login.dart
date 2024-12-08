import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:o_woman/app/viewmodels/login/login_controller.dart';
import 'package:o_woman/app/views/auth/common_auth_widgets/common_appbar.dart';
import 'package:o_woman/app/views/auth/login/register_login.dart';
import 'package:o_woman/app/views/auth/otp/widgets/otp_password_tab.dart';
import 'package:o_woman/app/views/auth/otp/widgets/otp_password_tab.dart';
import 'package:o_woman/app/views/home/circle_paint/const/size_const.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/app_string.dart';
import 'package:o_woman/constants/images_url.dart';
import 'package:o_woman/utils/helper_widgets/custom_toast.dart';
import 'package:o_woman/utils/screen_config.dart';

import '../../../../constants/font_size.dart';
import '../../../../utils/helper_widgets/commonTextField.dart';
import '../../../../utils/helper_widgets/custome_button.dart';
import '../../../routes/routes.dart';
import '../otp/widgets/otp_password_tab.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreen1State();
}

class _LoginScreen1State extends State<LoginScreen> with RouteAware {
  final _formKey = GlobalKey<FormState>();

  final _formKeyForOTP = GlobalKey<FormState>();
  final formKeyText = GlobalKey<FormState>();
  final otpFormKeyText = GlobalKey<FormState>();

  LoginController controllerLogin = Get.put(LoginController());
  String? otp;

  DateTime? currentBackPressTime;

  @override
  void initState() {
    controllerLogin.emailControllerOTP = TextEditingController();
    controllerLogin.emailController = TextEditingController();
    controllerLogin.passwordController = TextEditingController();
    controllerLogin.usernameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    // controllerLogin.emailController.dispose();
    //  controllerLogin.emailControllerOTP.dispose();
    // controllerLogin.passwordController.dispose();
    // controllerLogin.usernameController.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  Future<bool> onWillPop() {
    // DateTime now = DateTime.now();
    // if (currentBackPressTime == null ||
    //     now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
    //   currentBackPressTime = now;
    //   HelperWidget().flutterCustomToast("back again to exit");
    //   return Future.value(false);
    // }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: onWillPop,
        child: Scaffold(
          backgroundColor: AppColors.scaffoldBackgroundColor,
          resizeToAvoidBottomInset: true,
          body: SizedBox(
            height: SizeConfig.screenHeight,
            child: Stack(
              children: [
                CommonAppbar(
                    title: "Sign in",
                    center: true,
                    onTap: () {
                      controllerLogin.isOtpPasswordStatus.value = false;

                      if (Navigator.of(context).canPop()) {
                        Navigator.of(context).pop();
                      } else {
                        Navigator.pushNamed(context, Routes.welcomePage);
                      }
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
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 12.w),
                                child: _buildWidget(),
                              ))),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget _buildWidget() {
    return SingleChildScrollView(
      child: Obx(
        () => Form(
          key: controllerLogin.isOtpPasswordStatus.value
              ? _formKeyForOTP
              : _formKey,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.82,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                height20,
                SvgPicture.asset(ImagesUrl.appLogo),
                height20,
                OtpAndPasswordTab(
                  onTap: () {
                    clearTextFields();
                  },
                ),
                Obx(() => (!controllerLogin.isOtpPasswordStatus.value)
                    ? _passwordColumnWidget(context)
                    : _otpColumnWidget(context)),
                const Spacer(),
                const TermsAndConditionsForAuth(),
                height10,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _passwordColumnWidget(BuildContext context) {
    return Column(
      children: [
        Form(
            key: formKeyText,
            child: Column(
              children: [
                height10,
                _userNameWidget(context),
                height15,
                _passwordWidget(context),
              ],
            )),
        Padding(
          padding: EdgeInsets.only(
            left: 15.0.w,
            right: 15.w,
          ),
          child: GestureDetector(
            onTap: () {
              _formKey.currentState!.reset();
              Navigator.pushNamed(context, Routes.forgotPasswordScreen);
            },
            child: Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(right: 15.w, top: 10.h),
                  child: Text("Forgot Password?",
                      style: w600_14Poppins(color: AppColors.mainColor)),
                )),
          ),
        ),
        height10,
        Obx(() => _loginButton(context)),

        // _orWidget(context),
        const RegisterOrLogin(
          text: "Register Now",
          value: 1,
        ),
      ],
    );
  }

  // Widget _orWidget(BuildContext context) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
  //     child: Row(children: <Widget>[
  //       Expanded(
  //           child: Divider(
  //         color: AppColors.blackColor.withOpacity(0.1),
  //       )),
  //       width5,
  //       Text(
  //         "Or",
  //         style: TextStyle(color: AppColors.blackColor.withOpacity(0.1)),
  //       ),
  //       width5,
  //       Expanded(child: Divider(color: AppColors.blackColor.withOpacity(0.1))),
  //     ]),
  //   );
  // }

  Widget _otpColumnWidget(BuildContext context) {
    return Column(
      children: [
        height15,
        Form(
          key: otpFormKeyText,
          child: _alternateEmailForOTPWidget(context),
        ),
        Obx(() => _loginButton(context)),
        // height20,
        // _orWidget(context),
        const RegisterOrLogin(
          text: "Register Now",
          value: 1,
        ),
      ],
    );
  }

  Widget _userNameWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 15.0.w,
        right: 15.w,
      ),
      child: CommonTextFormField(
        label: "User Name",
        image: SvgPicture.asset(ImagesUrl.emailIconAuth),
        border: 8.r,
        borderColor: Colors.transparent,
        starIcon: "*",
        addStar: true,
        fillColor: AppColors.colorGray.withOpacity(0.15),
        hintText: AppString.enterUsername,
        // validator: (value) {
        //   if (value == null || value.isEmpty) {
        //     return 'User name is required';
        //   }
        //   return null;
        // },
        style: w500_14Poppins(color: AppColors.blackColor),
        labelStyle: w500_14Poppins(color: AppColors.blackColor),
        suffixIcon: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 10.h),
              child: Text(
                "@omail.ai",
                style:
                    w400_14Poppins(color: AppColors.colorPrimaryTestDarkMore),
              ),
            ),
          ],
        ),
        controller: controllerLogin.usernameController,
        keyboardType: TextInputType.emailAddress,
        inputAction: TextInputAction.next,
        textInputFormatter: [
          FilteringTextInputFormatter.deny(RegExp(r'\s')),
          FilteringTextInputFormatter.deny(
              RegExp(controllerLogin.regexToRemoveEmoji)),
          LengthLimitingTextInputFormatter(50)
        ],
      ),
    );
  }

  Widget _alternateEmailForOTPWidget(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 15.0.w, right: 15.w, bottom: 15.h),
        child: CommonTextFormField(
            autoValid: true,
            label: "Alternate Email",
            image: SvgPicture.asset(ImagesUrl.emailIconAuth),
            border: 8.r,
            borderColor: Colors.transparent,
            starIcon: "*",
            addStar: true,
            style: w500_14Poppins(color: AppColors.blackColor),
            fillColor: AppColors.colorGray.withOpacity(0.15),
            controller: controllerLogin.emailControllerOTP,
            hintText: 'Enter Alternate Email ID',
            keyboardType: TextInputType.emailAddress,
            inputAction: TextInputAction.done,
            labelStyle: w500_14Poppins(),
            validator: (value) {
              if (value!.isNotEmpty &&
                  !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value)) {
                return "Email is invalid";
              }
              return null;
            }));
  }

  Widget _passwordWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.w, right: 15.w),
      child: CommonTextFormField(
        label: "Password",
        image: SvgPicture.asset(ImagesUrl.passwordLock),
        border: 8.r,
        borderColor: Colors.transparent,
        starIcon: "*",
        addStar: true,
        fillColor: AppColors.colorGray.withOpacity(0.15),
        maxLength: 16,
        labelStyle: w500_14Poppins(color: AppColors.blackColor),
        hintText: "Password",
        hintStyle: w400_12Poppins(color: AppColors.blackColor.withOpacity(0.5))
          ..merge(w400_12Poppins(color: AppColors.mainColor)),
        onChanged: (changed) {},
        style: w500_14Poppins(color: AppColors.blackColor),
        obscureText: !controllerLogin.passObsureSignIn.value,
        inputAction: TextInputAction.done,
        // validator: (value) {
        //   if (value == null || value.isEmpty) {
        //     return 'Password is required';
        //   }
        //   if (value.length > 16) {
        //     return "Maximum 16 characters";
        //   }
        //   return null;
        // },
        suffixIcon: Padding(
          padding: EdgeInsets.all(14.sp),
          child: GestureDetector(
              onTap: () {
                if (controllerLogin.passObsureSignIn.value) {
                  controllerLogin.passObsureSignIn.value = false;
                } else {
                  controllerLogin.passObsureSignIn.value = true;
                }
                //   authProvider.updatePasswordSignIn();
              },
              child: Obx(
                () => SvgPicture.asset(
                  controllerLogin.passObsureSignIn.value
                      ? ImagesUrl.show
                      : ImagesUrl.hide,
                  height: 12.h,
                  width: 12.w,
                  fit: BoxFit.contain,
                ),
              )),
        ),
        controller: controllerLogin.passwordController,
        keyboardType: TextInputType.visiblePassword,
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.0.w, right: 15.w, bottom: 10.h),
      child: CustomButton(
          width: MediaQuery.of(context).size.width,
          buttonText: controllerLogin.isOtpPasswordStatus.value
              ? AppString.requestTOTP
              : AppString.logIn,
          buttonColor: AppColors.mainColor,
          onTap: () {
            if (controllerLogin.isOtpPasswordStatus.value) {
              if (controllerLogin.emailControllerOTP.text.isEmpty) {
                CustomToast.showErrorToast(msg: "Alternate email is required");
              } else {
                if (otpFormKeyText.currentState!.validate()) {
                  FocusScope.of(context).unfocus();
                  controllerLogin.sendOtpApi(context,
                    controllerLogin.emailControllerOTP.text,
                  );
                }
              }
            } else {
              if (controllerLogin.usernameController.text.isEmpty) {
                CustomToast.showErrorToast(msg: "Username is required");
              } else if (controllerLogin.passwordController.text.isEmpty) {
                CustomToast.showErrorToast(msg: "Password is required");
              } else {
                if (formKeyText.currentState!.validate()) {
                  FocusScope.of(context).unfocus();
                  controllerLogin.loginApi(
                      context,
                      controllerLogin.usernameController.text,
                      controllerLogin.passwordController.text);
                }
              }
            }
          }),
    );
  }

  void clearTextFields() {
    controllerLogin.emailController.clear();
    controllerLogin.usernameController.clear();
    controllerLogin.emailControllerOTP.clear();
    controllerLogin.usernameController.clear();
    controllerLogin.passwordController.clear();
  }
}
