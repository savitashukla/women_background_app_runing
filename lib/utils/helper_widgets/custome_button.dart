import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import 'package:o_woman/constants/app_colors.dart';

import '../../constants/font_size.dart';
import '../../constants/images_url.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {Key? key,
      required this.buttonText,
      this.onTap,
      this.buttonColor,
      this.textColor,
      this.height,
      this.width,
      this.buttonTextStyle,
      this.borderColor,
      this.isLoading = false,
      this.borderRadius})
      : super(key: key);

  final String buttonText;
  final VoidCallback? onTap;
  final Color? buttonColor;
  final Color? textColor;
  double? height;
  double? width;
  TextStyle? buttonTextStyle;
  double? borderRadius;
  final bool isLoading;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? MediaQuery.of(context).size.width * 0.8,
        margin: EdgeInsets.symmetric(horizontal: 0.w, vertical: 5.h),
        height: height ?? 40.h,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: AppColors.mainColor.withOpacity(0.4),
                  blurRadius: 30,
                  spreadRadius: 1,
                  offset: const Offset(0, 15))
            ],
            border: Border.all(color: borderColor ?? Colors.transparent),
            color: buttonColor ?? AppColors.mainColor,
            borderRadius: BorderRadius.circular(borderRadius ?? 20.r)),
        child: Center(
            child: isLoading
                ? Lottie.asset(ImagesUrl.loadingJson, height: 40.w, width: 40.w)
                : Text(
                    buttonText,
                    style: buttonTextStyle ??
                        w500_14Poppins(color: textColor ?? Colors.white),
                  )),
      ),
    );
  }
}
