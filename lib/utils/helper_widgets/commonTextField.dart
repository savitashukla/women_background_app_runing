import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../constants/app_colors.dart';
import '../../constants/font_size.dart';

class CommonTextFormField extends StatefulWidget {
  CommonTextFormField(
      {super.key,
      this.controller,
      this.hintText,
      this.readOnly = false,
      this.enabled = true,
      this.validator,
      this.keyboardType,
      this.labelStyle,
      this.suffixIcon,
      this.fillColor,
      this.prefixIcon,
      this.obscureText = false,
      this.errorMaxLines = 1,
      this.onChanged,
      this.inputAction,
      this.labelText,
      this.hintStyle,
      this.enableBorder = false,
      this.maxLength,
      this.style,
      this.borderColor,
      this.padding,
      this.maxLines = 1,
      this.onTap,
      this.allowSpace = true,
      this.numberOfchars,
      this.label,
      this.textInputFormatter,
      this.image,
      this.addStar = false,
      this.starIcon,
      this.border,
      this.autoValid = false});

  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final bool readOnly;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool enabled;
  final Widget? prefixIcon;
  final int errorMaxLines;
  final int maxLines;
  final ValueChanged<String>? onChanged;
  final int? maxLength;
  final TextStyle? style;
  final bool? enableBorder;
  final TextInputAction? inputAction;
  final EdgeInsetsGeometry? padding;
  final Color? fillColor;
  final Color? borderColor;
  final Function()? onTap;
  final bool allowSpace;
  final int? numberOfchars;
  final String? label;
  final String? starIcon;
  final List<TextInputFormatter>? textInputFormatter;
  final SvgPicture? image;
  final bool addStar;
  double? border;
  bool? autoValid;

  @override
  State<CommonTextFormField> createState() => _CommonTextFormFieldState();
}

class _CommonTextFormFieldState extends State<CommonTextFormField> {
  RxString onChangesString = "".obs;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    onChangesString.value = "";
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                widget.image ?? const SizedBox(),
                width5,
                Text(widget.label ?? "",
                    style: widget.labelStyle ??
                        w400_12Poppins(color: AppColors.blackColor)),
                Text(
                  widget.starIcon ?? "",
                  style: const TextStyle(color: Colors.red, fontSize: 13),
                )
              ]),
          // Stack(
          //   children: [
          // Obx(
          //   () => onChangesString.value.isEmpty
          //       ? Padding(
          //           padding: EdgeInsets.only(
          //               left: 12.w, bottom: 10.h, top: 11.h),
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.start,
          //             crossAxisAlignment: CrossAxisAlignment.center,
          //             children: [
          //               Text(widget.hintText!,
          //                   style: widget.hintStyle ??
          //                       w400_14Poppins(color: AppColors.hitText)),
          //               widget.addStar
          //                   ? const IgnoreBaseline()
          //                   : Text(' *',
          //                       style: w400_14Poppins(
          //                           color: AppColors.hitTextStar)),
          //             ],
          //           ),
          //         )
          //       : const IgnoreBaseline(),
          // ),
          TextFormField(
            onTapOutside: (event) {
              if (WidgetsBinding.instance.platformDispatcher.views.first
                      .viewInsets.bottom >
                  0.0) {
                FocusScope.of(context).unfocus();
              }
            },

            keyboardType: widget.keyboardType,
            maxLines: widget.maxLines,
            maxLength: widget.maxLength,
            enabled: widget.enabled,
            onTap: widget.onTap,
            onChanged: (values) {
              onChangesString.value = values;
              widget.onChanged?.call(
                  values); // Call the onChanged callback if it's not null
            },
            controller: widget.controller,

            readOnly: widget.readOnly,
            inputFormatters: widget.textInputFormatter ?? [],
            validator: widget.validator,
            obscureText: widget.obscureText,
            obscuringCharacter: "•",
            autovalidateMode: widget.autoValid!
                ? AutovalidateMode.disabled
                : AutovalidateMode.onUserInteraction,
            textInputAction: widget.inputAction ?? TextInputAction.next,
            style: widget.style ??
                w500_16Poppins(color: Theme.of(context).primaryColorLight),
            // inputFormatters: allowSpace
            //     ? null
            //     : [
            //         FilteringTextInputFormatter.allow(
            //             RegExp(r'[a-zA-Z 0-9@._-]+')),
            //         LengthLimitingTextInputFormatter(numberOfchars),
            //       ],
            decoration: InputDecoration(
              counterText: "",
              prefixIcon: widget.prefixIcon, hintText: widget.hintText!,
              labelText: widget.labelText,
              labelStyle: widget.labelStyle ??
                  w500_14Poppins(color: Theme.of(context).primaryColorLight),
              suffixIcon: widget.suffixIcon,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0.r)),
              contentPadding: widget.padding ??
                  EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
              filled: true,
              fillColor: widget.fillColor ?? AppColors.lightBgColor,
              hintStyle: widget.hintStyle ??
                  w400_12Poppins(color: AppColors.blackColor.withOpacity(0.5)),
              errorMaxLines: widget.errorMaxLines,
              errorStyle: w500_12Poppins(color: Colors.red),
              suffixIconColor: AppColors.mainColor,
              prefixIconColor: AppColors.mainColor,

              /// Disable Border
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.border ?? 20.0.r),
                borderSide: const BorderSide(color: Colors.transparent),
              ),

              /// Focused Border
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.border ?? 20.0.r),
                borderSide: const BorderSide(color: AppColors.mainColor),
              ),

              /// Enable Border
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.border ?? 20.0.r),
                  borderSide: BorderSide(
                      color: widget.borderColor ??
                          AppColors.colorGray.withOpacity(0.4))),

              /// Error Border
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.border ?? 20.0.r),
                borderSide: const BorderSide(color: AppColors.mainColor),
              ),

              /// Focused Error Border
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.border ?? 20.0.r),
                borderSide: const BorderSide(color: AppColors.mainColor),
              ),
            ),
          ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
