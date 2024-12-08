import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/font_size.dart';

class CustomHealthContainer extends StatefulWidget {
  CustomHealthContainer(
      {super.key,
      required this.title,
      required this.imgString,
      this.onTap,
      this.bgColor,
      required this.boolValue,
      this.width});

  final String title;
  final Color? bgColor;
  final String imgString;
  VoidCallback? onTap;
  final bool boolValue;
  double? width;

  @override
  State<CustomHealthContainer> createState() => _CustomHealthContainerState();
}

class _CustomHealthContainerState extends State<CustomHealthContainer> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.055,
        width: widget.width,
        decoration: BoxDecoration(
            color: widget.boolValue == true
                ? widget.bgColor
                : AppColors.whiteColor,
            border: Border.all(
              color: widget.boolValue == true
                  ? Colors.transparent
                  : AppColors.colorGray,
            ),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              SvgPicture.asset(widget.imgString),
              width5,
              Text(
                widget.title,
                style: w400_12Poppins(),
              )
            ],
          ),
        ),
      ),
    );
  }
}