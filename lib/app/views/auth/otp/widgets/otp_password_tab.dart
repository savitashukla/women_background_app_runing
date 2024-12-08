import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:o_woman/app/viewmodels/login/login_controller.dart';
import 'package:o_woman/constants/app_colors.dart';

double width = 230.0.w;
double height = 45.0.h;
const Color normalColor = AppColors.maroonColor;
const Color selectedColor = Colors.blue;

class OtpAndPasswordTab extends StatefulWidget {
  final Function? onTap;

  const OtpAndPasswordTab({super.key, this.onTap});

  @override
  State<OtpAndPasswordTab> createState() => _OtpAndPasswordTabState();
}

class _OtpAndPasswordTabState extends State<OtpAndPasswordTab> {
  LoginController controllerLogin = Get.put(LoginController());

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        boxShadow: const [BoxShadow(blurRadius: 1, color: Color(0xfffefbfb))],
        color: const Color(0xfffefbfb),
        borderRadius: BorderRadius.all(
          Radius.circular(30.r),
        ),
      ),
      child: Card(
        shape: const StadiumBorder(),
        child: Stack(
          children: [
            AnimatedAlign(
              alignment: Alignment(
                  controllerLogin.isOtpPasswordStatus.value ? 1 : -1, 0),
              duration: const Duration(milliseconds: 300),
              child: Container(
                width: width * 0.5,
                margin: EdgeInsets.all(4.sp),
                height: 50.h,
                decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(50.0.r),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                if (widget.onTap != null) {
                  widget.onTap!();
                }
                controllerLogin.isOtpPasswordStatus.value = false;
              },
              child: Align(
                alignment: const Alignment(-1, 0),
                child: Container(
                  width: width * 0.5,
                  color: Colors.transparent,
                  alignment: Alignment.center,
                  child: Text(
                    "Password",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: controllerLogin.isOtpPasswordStatus.value
                          ? AppColors.mainColor
                          : AppColors.whiteColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                controllerLogin.isOtpPasswordStatus.value = true;
              },
              child: Align(
                alignment: const Alignment(1, 0),
                child: Container(
                  width: width * 0.5,
                  color: Colors.transparent,
                  alignment: Alignment.center,
                  child: Text(
                    'OTP',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: controllerLogin.isOtpPasswordStatus.value
                          ? AppColors.whiteColor
                          : AppColors.mainColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
