import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/font_size.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {super.key,
      this.controller,
      this.maxlines = 1,
      this.hintText,
      this.label,
      this.readOnly = false,
      this.validator,
      this.keyboardType,
      this.suffixIcon,
      this.fillColor,
      this.prefixIcon,
      this.obscureText = false,
      this.errorMaxLines = 1,
      this.onChanged,
      this.inputAction,
      this.hintStyle,
      this.enableBorder = false,
      this.maxLength,
      this.style,
      this.borderColor,
      this.padding,
      this.starIcon,
      this.onTap,
      this.labelStyle,
      this.focusNode,
      this.initialValue,
      this.textInputFormatter,
      this.autoValidate,
      this.enableborderColor,
      this.suffixText});

  final TextEditingController? controller;
  final int? maxlines;
  final String? hintText;
  final TextStyle? hintStyle;
  final bool readOnly;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final bool obscureText;
  final Widget? prefixIcon;
  final int errorMaxLines;
  final ValueChanged<String>? onChanged;
  final int? maxLength;
  final String? label;
  final TextStyle? style;
  final bool? enableBorder;
  final TextInputAction? inputAction;
  final EdgeInsetsGeometry? padding;
  final Color? fillColor;
  final Color? borderColor;
  final String? starIcon;
  final VoidCallback? onTap;
  final TextStyle? labelStyle;
  final FocusNode? focusNode;
  final String? initialValue;
  final AutovalidateMode? autoValidate;
  final List<TextInputFormatter>? textInputFormatter;
  Color? enableborderColor;
  String? suffixText;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            onTap: onTap,
            keyboardType: keyboardType,
            maxLength: maxLength,
            maxLines: maxlines,
            onChanged: onChanged,
            controller: controller,
            readOnly: readOnly,
            validator: validator,
            enabled: !readOnly,
            obscureText: obscureText,
            obscuringCharacter: "●",
            focusNode: focusNode,
            autovalidateMode:
                autoValidate ?? AutovalidateMode.onUserInteraction,
            textInputAction: TextInputAction.next,
            style: w500_16Poppins(color: const Color(0xff4C4E51)),
            inputFormatters: textInputFormatter ?? [],
            initialValue: initialValue,
            onTapOutside: (event) {
              if (focusNode != null) {
                FocusScope.of(context).unfocus();
              }
            },
            decoration: InputDecoration(
              counterText: "",
              suffixText:suffixText??"",
              prefixIcon: prefixIcon,
              hintText: hintText,
              suffixIcon: suffixIcon,
              labelText: label,
              labelStyle: labelStyle,
              border: InputBorder.none,
              contentPadding: padding ??
                  EdgeInsets.only(
                    left: 16.w,
                    right: 10.w,
                  ),
              filled: true,

              fillColor: fillColor ?? Colors.white,
              hintStyle:
                  // readOnly
                  //     ? TextStyle(
                  //         color: Theme.of(context).hintColor.withOpacity(0.4))
                  //     :
                  hintStyle,

              errorMaxLines: errorMaxLines,
              errorStyle: const TextStyle(
                fontWeight: FontWeight.bold,
              ),

              /// Disable Border
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0.r),
                borderSide: BorderSide(
                    width: 1, color: enableborderColor ?? Colors.grey.shade400),
              ),

              /// Focused Border
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0.r),
                borderSide: BorderSide(
                    width: 1,
                    color: enableborderColor ??
                        AppColors.colorGray.withOpacity(0.3)),
              ),

              /// Enable Border
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0.r),
                  borderSide: BorderSide(
                      width: 1,
                      color: enableborderColor ??
                          AppColors.colorGray.withOpacity(0.3))),

              /// Error Border
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0.r),
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 1.5,
                ),
              ),

              /// Focused Error Border
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0.r),
                borderSide: const BorderSide(width: 1.5, color: Colors.red),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
