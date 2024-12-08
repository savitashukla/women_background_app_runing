import 'package:flutter/material.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/font_size.dart';

class PillCornerWidget extends StatefulWidget {
  PillCornerWidget({
    super.key,
    this.height,
    this.width,
    required this.title,
    required this.boolValue,
    this.onTapevent
  });
  double? height;
  double? width;
  String title;
  bool boolValue;
  VoidCallback? onTapevent;

  @override
  State<PillCornerWidget> createState() => _PillCornerWidgetState();
}

class _PillCornerWidgetState extends State<PillCornerWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTapevent,
      child: Container(
        height: widget.height ?? MediaQuery.of(context).size.height * 0.045,
        width: widget.width,
        //  MediaQuery.of(context).size.width * 0.42,
        decoration: BoxDecoration(
            color: widget.boolValue ? AppColors.mainColor : AppColors.whiteColor,
            border: Border.all(
              color: widget.boolValue
                  ? Colors.transparent
                  : AppColors.colorGray.withOpacity(0.5),
            ),
            borderRadius: BorderRadius.circular(6)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(widget.title, style: w400_12Poppins()),
        ),
      ),
    );
  }
}
