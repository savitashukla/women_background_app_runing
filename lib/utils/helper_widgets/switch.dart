import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:o_woman/constants/app_colors.dart';

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({
    super.key,
    this.initialValue,
    required this.onChanged,
  });

  final bool? initialValue;
  final void Function(bool value) onChanged;

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  late bool enabled;

  @override
  void initState() {
    super.initState();
    enabled = widget.initialValue ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final circleColor = enabled ? AppColors.mainColor : Colors.grey.shade300;
    final backgroundColor =
        enabled ? AppColors.mainColor.withOpacity(0.4) : Colors.grey.shade100;
    // final Border? border =
    //     !enabled ? Border.all(color: Colors.grey.shade300) : null;
    // final circlePosition =
    //     enabled ? Alignment.centerRight : Alignment.centerLeft;

    return GestureDetector(
      // borderRadius: BorderRadius.circular(64.0),
      onTap: () {
        widget.onChanged(!enabled);
        setState(() {
          enabled = !enabled;
        });
      },
      child: enabled
          ? Stack(
              clipBehavior: Clip.none,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 1.h, bottom: 3.5.h, right: 5.w),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(64.r),
                          bottomRight: Radius.circular(64.r),
                          topLeft: Radius.circular(64.r),
                          bottomLeft: Radius.circular(64.r)),
                      // border: border,
                      color: backgroundColor,
                    ),
                    width: 31.w,
                    height: 14.h,
                  ),
                ),
                Positioned(
                  left: 17.w,
                  bottom: 1.h,
                  child: Container(
                    width: 19.w,
                    height: 19.h,
                    decoration: BoxDecoration(
                      color: circleColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                )
              ],
            )
          : Stack(clipBehavior: Clip.none, children: [
              Padding(
                padding: EdgeInsets.only(top: 2.h, bottom: 5.h),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(64.r),
                      bottomRight: Radius.circular(64.r),
                      bottomLeft: Radius.circular(64.r),
                      topLeft: Radius.circular(64.r),
                    ),
                    // border: border,
                    color: backgroundColor,
                  ),
                  width: 37.w,
                  height: 14.h,
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                bottom: 2.h,
                right: 16.w,
                child: Container(
                  width: 18.w,
                  height: 16.h,
                  decoration: BoxDecoration(
                    color: circleColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ]),
    );
  }
}
