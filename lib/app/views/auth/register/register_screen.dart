import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:o_woman/app/views/auth/common_auth_widgets/common_appbar.dart';
import 'package:o_woman/app/views/home/circle_paint/const/size_const.dart';
import 'package:o_woman/constants/app_string.dart';
import 'package:o_woman/constants/images_url.dart';
import 'package:o_woman/utils/helper_widgets/custom_toast.dart';
import 'package:o_woman/utils/screen_config.dart';
import 'package:o_woman/utils/validation.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/font_size.dart';
import '../../../../utils/helper_method.dart';
import '../../../../utils/helper_widgets/commonTextField.dart';
import '../../../../utils/helper_widgets/custome_button.dart';
import '../../../viewmodels/login/login_controller.dart';
import '../login/register_login.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _firstNameController =
      TextEditingController(text: '');
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _alternateEmailController =
      TextEditingController();
  final TextEditingController passwordControllerRegi = TextEditingController();
  final TextEditingController _referalCodeController = TextEditingController();
  LoginController controllerLogin = Get.put(LoginController());

  bool userEmailAlternated = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _firstNameController.dispose();
    passwordControllerRegi.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _confirmPasswordController.dispose();
    _alternateEmailController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    controllerLogin.captchaController = TextEditingController();
    controllerLogin.apiGetCaptcha();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        // authApiProvider.resetSignUpValidations();
        passwordControllerRegi.clear();
        FocusScope.of(context).unfocus();
        return true;
      },
      child: Obx(
        () => ModalProgressHUD(
          inAsyncCall: controllerLogin.registerProgressIsVisible.value,
          // demo of some additional parameters
          opacity: 0.5,

          progressIndicator: const CircularProgressIndicator(),
          child: Scaffold(
              backgroundColor: Colors.white,
              resizeToAvoidBottomInset: false,
              body: SizedBox(
                height: SizeConfig.screenHeight,
                child: Stack(
                  children: [
                    CommonAppbar(
                        title: "Register",
                        center: true,
                        onTap: () {
                          passwordControllerRegi.clear();
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
                                    horizontal:
                                        getProportionateScreenWidth(10.w),
                                    vertical:
                                        getProportionateScreenHeight(10.h)),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 12.w),
                                  child: _buildWidget(size, context),
                                ),
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }

  Widget _buildWidget(size, context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.85,
      child: Form(
        key: _formKey,
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 10.h),
              child: Column(
                children: [
                  height15,
                  SvgPicture.asset(ImagesUrl.appLogo),
                  height5,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.44,
                          child: _firstNameWidget(context)),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.44,
                          child: _lastNameWidget(context)),
                    ],
                  ),
                  height10,
                  _omailWidget(context),
                  height10,
                  _createPwdWidget(context),
                  height10,
                  GetBuilder<LoginController>(builder: (con) {
                    if (passwordControllerRegi.value.text.isNotEmpty) {
                      return Validation.passwordInfoWidget(
                          // ref
                          //         .watch(registerStateNotifierProvider)
                          //         .validatePassWord ??
                          context);
                    }
                    return const SizedBox();
                  }),
                  _confirmPwdWidget(context),
                  height10,
                  _alternateEmailWidget(context),
                  height10,
                  referralCodeWidget(context),
                  height5,
                  _captchaWidget(context),
                  height5,
                  // Obx(
                  //   () => Row(
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       GestureDetector(
                  //         onTap: () {
                  //           controllerLogin.termsCheckbox.value =
                  //               !controllerLogin.termsCheckbox.value;
                  //         },
                  //         child: controllerLogin.termsCheckbox.value
                  //             ? const Icon(
                  //                 Icons.check_box,
                  //                 color: AppColors.mainColor,
                  //               )
                  //             : const Icon(
                  //                 Icons.check_box_outline_blank,
                  //                 color: AppColors.colorGray,
                  //               ),
                  //       ),
                  //       SizedBox(
                  //           width: MediaQuery.of(context).size.width * 0.8,
                  //           child: const TermsAndConditionsForAuth()),
                  //     ],
                  //   ),
                  // ),
                  _registerButton(context),
                  height5,
                  const RegisterOrLogin(
                    text: "Login Now",
                    value: 2,
                  ),
                  height15,
                  const TermsAndConditionsForAuth(),
                  height10,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget suggestionWidget() {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
              4,
              (index) => GestureDetector(
                    onTap: () {
                      _emailController.text = "";
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.w),
                      decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.white)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 1.h),
                        child: Text(
                          "check",
                          style: w400_14Poppins(
                              color: Theme.of(context).primaryColorLight),
                        ),
                      ),
                    ),
                  )),
        ));
  }

  Widget _registerButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8.w, right: 8.w, bottom: 4.h),
      child: CustomButton(
          buttonText: AppString.register,
          buttonColor: AppColors.mainColor,
          onTap: () {
            if (_firstNameController.text.isEmpty &&
                _lastNameController.text.isEmpty &&
                _emailController.text.isEmpty &&
                passwordControllerRegi.text.isEmpty &&
                _confirmPasswordController.text.isEmpty &&
                _alternateEmailController.text.isEmpty) {
              CustomToast.showErrorToast(
                msg: 'Please fill all the mandatory fields',
              );
            } else if (_firstNameController.text.trim().isEmpty) {
              CustomToast.showErrorToast(msg: 'First Name is required');
            } else if (_lastNameController.text.trim().isEmpty) {
              CustomToast.showErrorToast(msg: 'Last Name is required');
            } else if (_emailController.text.isEmpty) {
              CustomToast.showErrorToast(msg: 'O-Mail ID is required');
            } else if (passwordControllerRegi.text.isEmpty) {
              CustomToast.showErrorToast(msg: 'Password is required');
            }
            // else if (!context
            //     .read<PasswordValidatorBloc>()
            //     .passwordValidState
            //     .isValidPassWord) {
            //   CustomToast.showErrorToast(msg: 'Please enter valid password');
            // }
            else if (_confirmPasswordController.text.isEmpty) {
              CustomToast.showErrorToast(msg: 'Confirm password is required');
            } else if (_alternateEmailController.text.isEmpty) {
              CustomToast.showErrorToast(msg: 'Alternate email id is required');
            }
            else if (controllerLogin.captchaController.text.isEmpty) {
              CustomToast.showErrorToast(msg: "Captch is required");
            }

            // else if(input.contains(RegExp(r"\s{2,}"))

            else if (RegExp(r"\s{2,}").hasMatch(_firstNameController.text)) {
              CustomToast.showErrorToast(
                  msg: "First name should not have consecutive spaces");
            } else if (_firstNameController.text.startsWith(RegExp(r"[._-]"))) {
              CustomToast.showErrorToast(
                  msg: "Cannot contain special character before name");
            } else if (_firstNameController.text.endsWith(".") ||
                _firstNameController.text.endsWith("-") ||
                _firstNameController.text.endsWith("_")) {
              CustomToast.showErrorToast(
                  msg: "Cannot contain special character after name");
            } else if (RegExp(r'(\.{2,}|_{2,}|-{2,})')
                .hasMatch(_firstNameController.text)) {
              CustomToast.showErrorToast(
                  msg:
                      "First name should not have consecutive special characters (..) or (--) or (__)");
            } else if (RegExp(r"\s{2,}").hasMatch(_lastNameController.text)) {
              CustomToast.showErrorToast(
                  msg: "Last name should not have consecutive spaces");
            } else if (_lastNameController.text.startsWith(RegExp(r"[._-]"))) {
              CustomToast.showErrorToast(
                  msg: "Cannot contain special character before name");
            } else if (_lastNameController.text.endsWith(".") ||
                _lastNameController.text.endsWith("-") ||
                _lastNameController.text.endsWith("_")) {
              CustomToast.showErrorToast(
                  msg: "Cannot contain special character after name");
            } else if (RegExp(r'(\.{2,}|_{2,}|-{2,})')
                .hasMatch(_lastNameController.text)) {
              CustomToast.showErrorToast(
                  msg:
                      "Last name should not have consecutive special characters (..) or (--) or (__)");
            } else if (RegExp(r'(\.{2,}|_{2,}|-{2,})')
                .hasMatch(_emailController.text)) {
              CustomToast.showErrorToast(
                  msg:
                      "Omail ID should not have consecutive special characters (..) or (--) or (__)");
            } else if (RegExp(r'[!@#\$%^&*(),?":{}|<>._-]')
                .hasMatch(_emailController.text[0])) {
              CustomToast.showErrorToast(
                  msg: "Omail ID should start with letters or numbers only");
            } else if (RegExp(r'[!@#\$%^&*(),?":{}|<>]')
                .hasMatch(_emailController.text)) {
              CustomToast.showErrorToast(
                  msg:
                      "Accepts letters, numbers with special characters '.', '-', '_'");
            } else if (passwordControllerRegi.text.isNotEmpty &&
                (_confirmPasswordController.text !=
                    _confirmPasswordController.text)) {
              CustomToast.showErrorToast(
                  msg: "New Password & Confirm password should be same.");
            } else if (_emailController.text.length < 4 ||
                _emailController.text.length > 50) {
              CustomToast.showErrorToast(
                  msg:
                      'Omail field require Min character : 4, Max characters : 50');
            } else if (_emailController
                        .text[_emailController.text.length - 1] ==
                    '.' ||
                _emailController.text[_emailController.text.length - 1] ==
                    '-' ||
                _emailController.text[_emailController.text.length - 1] ==
                    '_') {
              CustomToast.showErrorToast(
                  msg:
                      "Last character of the Omail ID should only be letters (a-z) or numbers (0-9)");
              return;
            } else if (_formKey.currentState!.validate()) {
              controllerLogin.getRegisterApi(context, {
                "emailId": _emailController.text.trim() + AppString.oMailEndTag,
                "alternateEmail": _alternateEmailController.text.trim(),
                "firstName": _firstNameController.text.trim(),
                "lastName": _lastNameController.text.trim(),
                "password": passwordControllerRegi.text.trim(),
                "confirmPassword": _confirmPasswordController.text.trim(),
                "referredBy": 0,
                "referralCode": _referalCodeController.text.isEmpty
                    ? null
                    : _referalCodeController.text.trim(),
                "source": "OES",
                "isOFounder": false,
                "registrationUUID":
                    controllerLogin.captchaModel.value.data!.uuid,
                "base64CaptchaImage":
                    controllerLogin.captchaController.text.trim(),
              });
              FocusScope.of(context).unfocus();
            } else {
              print("Unable to register");
            }
          }),
    );
  }

  Widget _alternateEmailWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 8.w,
        right: 8.w,
      ),
      child: CommonTextFormField(
        autoValid: true,
        label: "Alternate Email",
        image: SvgPicture.asset(ImagesUrl.emailIconAuth),
        border: 8.r,
        borderColor: Colors.transparent,
        starIcon: "*",
        addStar: true,
        fillColor: AppColors.colorGray.withOpacity(0.15),
        controller: _alternateEmailController,
        hintText: 'Alternate Email',
        keyboardType: TextInputType.emailAddress,
        style: w400_14Poppins(color: AppColors.blackColor),
        validator: (value) {
          if (value!.isNotEmpty &&
              !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(value)) {
            return "Invalid email address.";
          }
          return null;
        },
        textInputFormatter: [
          FilteringTextInputFormatter.deny(RegExp(r'\s')),
          LengthLimitingTextInputFormatter(100)
        ],
      ),
    );
  }

  Widget referralCodeWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8.w, right: 8.w, bottom: 4.h),
      child: CommonTextFormField(
        label: "Referral Code",
        image: SvgPicture.asset(ImagesUrl.refLinkIcon),
        border: 8.r,
        borderColor: Colors.transparent,
        // starIcon: "*",
        addStar: true,
        fillColor: AppColors.colorGray.withOpacity(0.15),
        controller: _referalCodeController,
        hintText: 'Referral Code(Optional)',
        // label: "Referral Code",
        keyboardType: TextInputType.emailAddress,
        inputAction: TextInputAction.done,
        textInputFormatter: [
          FilteringTextInputFormatter.deny(RegExp(r'\s')),
        ],
        style: w500_14Poppins(
            color: AppColors
                .blackColor /*themeProvider.isLightTheme
                ? AppColors.lightBlackColor
                : AppColors.darkWhiteColor*/
            ),
      ),
    );
  }

  Widget _createPwdWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 8.w,
        right: 8.w,
      ),
      child: Column(
        children: [
          Obx(
            () => CommonTextFormField(
              label: "Password",
              image: SvgPicture.asset(ImagesUrl.passwordLock),
              border: 8.r,
              borderColor: Colors.transparent,
              starIcon: "*",
              addStar: true,
              style: w400_14Poppins(color: AppColors.blackColor),
              fillColor: AppColors.colorGray.withOpacity(0.15),
              hintText: AppString.createPassword,
              onChanged: (value) {
                value.length != 16
                    ? controllerLogin.passwordValidatorState(value)
                    : CustomToast.showWarningToast(
                        msg: "The max limit of characters is 16");
              },
              obscureText: !controllerLogin.registerIsVisible.value,
              controller: passwordControllerRegi,
              textInputFormatter: [
                FilteringTextInputFormatter.deny(RegExp(r'\s')),
                LengthLimitingTextInputFormatter(16)
              ],
              // validator: (value) {
              //   if (value == null || value.isEmpty) {
              //     return "Password is required";
              //   }
              //   if (value.length > 15) {
              //     return "Your password can't be longer than 16 characters";
              //   }
              //   return null;
              // },
              suffixIcon: Padding(
                padding: EdgeInsets.all(14.0.sp),
                child: GestureDetector(
                    onTap: () {
                      if (controllerLogin.registerIsVisible.value) {
                        controllerLogin.registerIsVisible.value = false;
                      } else {
                        controllerLogin.registerIsVisible.value = true;
                      }
                    },
                    child: Obx(
                      () => SvgPicture.asset(
                        controllerLogin.registerIsVisible.value
                            ? ImagesUrl.show
                            : ImagesUrl.hide,
                        height: 12.h,
                        width: 12.w,
                        fit: BoxFit.contain,
                      ),
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _confirmPwdWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 8.w,
        right: 8.w,
      ),
      child: Obx(
        () => CommonTextFormField(
          label: "Confirm Password",
          image: SvgPicture.asset(ImagesUrl.passwordLock),
          border: 8.r,
          borderColor: Colors.transparent,
          starIcon: "*",
          addStar: true,
          autoValid: true,
          readOnly: controllerLogin.enableConfirmPasswordFeild.value,
          onTap: () {},
          style: w400_14Poppins(color: AppColors.blackColor /*textThemeColor*/),
          fillColor: AppColors.colorGray.withOpacity(0.15),
          hintText: AppString.confirmPassword,
          obscureText: !controllerLogin.registerIsVisibleCon.value,
          validator: (value) {
            // if (value.isEmpty) {
            //   return 'Confirm password is required';
            // }
            if (value!.isNotEmpty && value != passwordControllerRegi.text) {
              return "Password and Confirm Password should be same";
            }
            return null;
          },
          suffixIcon: Padding(
            padding: EdgeInsets.all(14.0.sp),
            child: GestureDetector(
              onTap: () {
                if (controllerLogin.registerIsVisibleCon.value) {
                  controllerLogin.registerIsVisibleCon.value = false;
                } else {
                  controllerLogin.registerIsVisibleCon.value = true;
                }
              },
              child: SvgPicture.asset(
                controllerLogin.registerIsVisibleCon.value
                    ? ImagesUrl.show
                    : ImagesUrl.hide,
                height: 12.h,
                width: 12.w,
                fit: BoxFit.contain,
              ),
            ),
          ),
          textInputFormatter: [
            FilteringTextInputFormatter.deny(RegExp(r'\s')),
            LengthLimitingTextInputFormatter(16)
          ],
          controller: _confirmPasswordController,
          keyboardType: TextInputType.visiblePassword,
        ),
      ),
    );
  }

  Widget _firstNameWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 8.w,
        right: 8.w,
      ),
      child: CommonTextFormField(
        label: "First Name",
        image: SvgPicture.asset(ImagesUrl.userIcon),
        border: 8.r,
        borderColor: Colors.transparent,
        starIcon: "*",
        addStar: true,
        fillColor: AppColors.colorGray.withOpacity(0.15),
        hintText: AppString.firstName,
        style: w400_14Poppins(color: AppColors.blackColor),
        controller: _firstNameController,
        // validator: (value) {
        //   if (value == null || value.isEmpty) {
        //     return "First name is required";
        //   }
        //   if (value.length > 25 || value.isEmpty) {
        //     return "Min 1 & max 26";
        //   }
        //   return null;
        // },
        textInputFormatter: [
          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9._-\s]')),
          // LengthLimitingTextInputFormatter(26),
        ],
        keyboardType: TextInputType.name,
      ),
    );
  }

  Widget _lastNameWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 8.w,
        right: 8.w,
      ),
      child: CommonTextFormField(
        label: "Last Name",
        image: SvgPicture.asset(ImagesUrl.userIcon),
        border: 8.r,
        borderColor: Colors.transparent,
        starIcon: "*",
        addStar: true,
        fillColor: AppColors.colorGray.withOpacity(0.15),
        hintText: AppString.lastName,
        style: w400_14Poppins(color: AppColors.blackColor /*textThemeColor*/),
        controller: _lastNameController,
        // validator: (value) {
        //   if (value == null || value.isEmpty) {
        //     return "Last name is required";
        //   }
        //   if (value.length > 25 || value.isEmpty) {
        //     return "Min 1 & max 26";
        //   }
        //   return null;
        // },
        textInputFormatter: [
          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9._-\s]')),
          // LengthLimitingTextInputFormatter(26),
        ],
        keyboardType: TextInputType.name,
      ),
    );
  }

  Widget _omailWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 8.w,
        right: 8.w,
      ),
      child: CommonTextFormField(
        label: "Create O-MAIL ID",
        image: SvgPicture.asset(ImagesUrl.emailIconAuth),
        border: 8.r,
        borderColor: Colors.transparent,
        starIcon: "*",
        addStar: true,
        fillColor: AppColors.colorGray.withOpacity(0.15),
        hintText: AppString.omailID,
        // validator: (value) {
        //   if (value == null || value.isEmpty) {
        //     return "Username is required";
        //   }
        //   if (RegExp(r"(?! )\s+|[-_.]{2,}").hasMatch(value)) {
        //     return 'No consecutive special characters(__) or (--) or (..)';
        //   }
        //   if (value.length > 31 || value.length < 3) {
        //     return "Min 3 & max 32";
        //   }
        //   return null;
        // },
        style: w400_14Poppins(color: AppColors.blackColor /*textThemeColor*/),
        suffixIcon: Padding(
            padding: EdgeInsets.only(right: 10.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "@omail.ai",
                  style: w400_14Poppins(),
                ),
              ],
            )),
        controller: _emailController,
        textInputFormatter: [
          FilteringTextInputFormatter.deny(RegExp(r'\s')),
          LengthLimitingTextInputFormatter(32),
          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9._-]')),
        ],
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }

  Widget _captchaWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8.w, right: 8.w, bottom: 4.h),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: AppColors.colorGray.withOpacity(0.15)),
        child: Padding(
          padding: EdgeInsets.all(10.r),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.colorGray.withOpacity(0.8),
                ),
                borderRadius: BorderRadius.circular(10.r),
                color: AppColors.colorGray.withOpacity(0.01)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const Text("Captcha "),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Obx(
                          () => controllerLogin.captchaModel.value.data !=
                                      null &&
                                  controllerLogin
                                          .captchaModel.value.data!.captcha !=
                                      null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  // Adjust the radius as needed

                                  child: Image.memory(
                                    convertBase64Image(controllerLogin
                                        .captchaModel.value.data!.captcha),
                                    height: 40.h,
                                    fit: BoxFit.fill,
                                  ),
                                )
                              : Shimmer.fromColors(
                                  baseColor: Colors.grey.withOpacity(0.2),
                                  highlightColor: Colors.grey.withOpacity(0.4),
                                  enabled: true,
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.04,
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: AppColors.mainColor
                                            .withOpacity(0.4)),
                                  ),
                                ),
                        ),
                      ),
                      //  width30,
                      Padding(
                        padding: EdgeInsets.only(left: 30.r),
                        child: Container(
                          height: 38.h,
                          width: 53.w,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.colorGray.withOpacity(0.6),
                            ),
                            borderRadius: BorderRadius.circular(5.r),
                            color: AppColors.colorGray.withOpacity(0.1),
                          ),
                          child: GestureDetector(
                              onTap: () {
                                controllerLogin.apiGetCaptcha();
                              },
                              child: Padding(
                                padding: EdgeInsets.all(9.r),
                                child: SvgPicture.asset(
                                  ImagesUrl.resendIcon,
                                  height: 18.h,
                                ),
                              )),
                        ),
                      ),
                      // width30,
                      //   SvgPicture.asset(ImagesUrl.textToSpeech)
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 4.h),
                    child: CommonTextFormField(
                      // label: "Captcha",
                      // image: SvgPicture.asset(ImagesUrl.userIcon),
                      border: 8.r,

                      borderColor: AppColors.colorGray.withOpacity(0.6),
                      // starIcon: "*",
                      addStar: true,
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return "Captcha is required";
                      //   }
                      //   return null;
                      // },
                      // hintStyle: w400_14Poppins(color: AppColors.whiteColor),
                      fillColor: AppColors.colorGray.withOpacity(0.1),
                      hintText: "Write text from image",
                      style: w400_14Poppins(
                          color: AppColors.blackColor /*textThemeColor*/),
                      controller: controllerLogin.captchaController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
