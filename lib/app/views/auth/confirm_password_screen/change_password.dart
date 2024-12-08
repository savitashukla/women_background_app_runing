import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:o_woman/app/views/auth/common_auth_widgets/common_appbar.dart';
import 'package:o_woman/app/views/home/circle_paint/const/size_const.dart';
import 'package:o_woman/constants/app_string.dart';
import 'package:o_woman/constants/images_url.dart';
import 'package:o_woman/utils/helper_widgets/custom_toast.dart';
import 'package:o_woman/utils/screen_config.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/font_size.dart';
import '../../../../utils/helper_widgets/commonTextField.dart';
import '../../../../utils/helper_widgets/custome_button.dart';
import '../../../viewmodels/login/ChangesPasswordController.dart';
import '../../../viewmodels/login/login_controller.dart';
import '../login/register_login.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key, required this.email}) : super(key: key);
  final String email;

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();
  LoginController controllerLogin = Get.find();
  ChangesPasswordController changesPasswordControllerGetx =
      Get.put(ChangesPasswordController());

  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    confirmPasswordController.dispose();
    newPasswordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
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
                  title: "Create new password",
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
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              height15,
                              SvgPicture.asset(ImagesUrl.appLogo),
                              height70,
                              height10,
                              height5,
                              Text(
                                  'Now you can enter your new password and enjoy the OES world again!!',
                                  textAlign: TextAlign.center,
                                  style: w400_14Poppins()),
                              height15,
                              _newPwdWidget(),
                              height15,
                              _confirmPwdWidget(),
                              height30,
                              CustomButton(
                                height: 35.h,
                                buttonText: "Save",
                                buttonTextStyle: w600_14Poppins(
                                    color: AppColors.whiteColor),
                                onTap: () {
                                  if (newPasswordController.text.isEmpty) {
                                    CustomToast.showErrorToast(
                                        msg: "Password is required ");
                                  } else if (confirmPasswordController
                                      .text.isEmpty) {
                                    CustomToast.showErrorToast(
                                        msg: "Confirm Password is required");
                                  } else if (_formKey.currentState!
                                      .validate()) {
                                    controllerLogin.resetPasswordApi(
                                        context,
                                        newPasswordController.text,
                                        widget.email);
                                    FocusScope.of(context).unfocus();
                                  }
                                },
                              ),
                              const Spacer(),
                              const TermsAndConditionsForAuth(),
                              height10,
                            ],
                          ),
                        ),
                      ),
                                              ),
                                            ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Widget _confirmPwdWidget() {
    return Obx(
      () => CommonTextFormField(
        label: "Confirm Password",
        image: SvgPicture.asset(ImagesUrl.passwordLock),
        border: 8.r,
        borderColor: Colors.transparent,
        starIcon: "*",
        addStar: true,
        fillColor: AppColors.colorGray.withOpacity(0.15),
        controller: confirmPasswordController,
        hintText: "Confirm Password",
        obscureText: !changesPasswordControllerGetx.newPassIsVisible.value,
        hintStyle: w400_14Poppins(color: Theme.of(context).disabledColor),
        style: const TextStyle(color: AppColors.blackColor),
        autoValid: true,
        validator: (value) {
          // if (value == null || value.isEmpty) {
          //   return 'Password cant be empty';
          // }
          if (value!.length > 16) {
            return "Maximum 16 characters";
          }
          if (newPasswordController.text != confirmPasswordController.text) {
            return "New password does not to confirm password...";
          }
          return null;
        },
        suffixIcon: Padding(
          padding: EdgeInsets.all(14.0.sp),
          child: GestureDetector(
              onTap: () {
                if (changesPasswordControllerGetx.newPassIsVisible.value) {
                  changesPasswordControllerGetx.newPassIsVisible.value = false;
                } else {
                  changesPasswordControllerGetx.newPassIsVisible.value = true;
                }
              },
              child: Obx(
                () => SvgPicture.asset(
                  changesPasswordControllerGetx.newPassIsVisible.value
                      ? ImagesUrl.show
                      : ImagesUrl.hide,
                  height: 12.h,
                  width: 12.w,
                  fit: BoxFit.contain,
                ),
              )),
        ),
      ),
    );
  }

  Widget _newPwdWidget() {
    return Column(
      children: [
        Obx(
          () => CommonTextFormField(
            label: "Password",
            image: SvgPicture.asset(ImagesUrl.passwordLock),
            border: 8.r,
            borderColor: Colors.transparent,
            starIcon: "*",
            addStar: true,
            fillColor: AppColors.colorGray.withOpacity(0.15),
            controller: newPasswordController,
            hintText: "New Password",
            style: const TextStyle(color: AppColors.blackColor),
            maxLength: 16,
            obscureText: !controllerLogin.passObsureChangePwd.value,
            hintStyle: w400_14Poppins(color: Theme.of(context).disabledColor),
            autoValid: true,
            validator: (value) {
              // if (value == null || value.isEmpty) {
              //   return 'Password cant be empty';
              // }
              if (value!.length > 16) {
                return "Maximum 16 characters";
              }
              return null;
            },
            suffixIcon: Padding(
              padding: EdgeInsets.all(14.0.sp),
              child: GestureDetector(
                  onTap: () {
                    if (controllerLogin.passObsureChangePwd.value) {
                      controllerLogin.passObsureChangePwd.value = false;
                    } else {
                      controllerLogin.passObsureChangePwd.value = true;
                    }
                  },
                  child: Obx(() => SvgPicture.asset(
                        controllerLogin.passObsureChangePwd.value
                            ? ImagesUrl.show
                            : ImagesUrl.hide,
                        height: 12.h,
                        width: 12.w,
                        fit: BoxFit.contain,
                      ))),
            ),
          ),
        ),
      ],
    );
  }
}
