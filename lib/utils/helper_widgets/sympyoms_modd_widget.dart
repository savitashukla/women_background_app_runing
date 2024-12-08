import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/font_size.dart';

class SymptomsMoodWidget extends StatefulWidget {
  SymptomsMoodWidget(
      {super.key,
      required this.title,
      required this.fillColor,
      required this.borderColor,
      required this.imagURL,
      this.iconColor,
      this.height,
      this.width});
  String title;
  Color fillColor;
  Color borderColor;
  String imagURL;
  Color? iconColor;
  double? height;
  double? width;
  @override
  State<SymptomsMoodWidget> createState() => _SymptomsMoodWidgetState();
}

class _SymptomsMoodWidgetState extends State<SymptomsMoodWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.045,
      decoration: BoxDecoration(
          color: widget.fillColor,
          border: Border.all(
            color: widget.borderColor,
          ),
          borderRadius: BorderRadius.circular(6)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
        child: Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            SvgPicture.asset(
              widget.imagURL,
              color: widget.iconColor,
              height: widget.height,
              width: widget.width,
            ),
            width5,
            Text(widget.title, style: w400_14Poppins()),
          ],
        ),
      ),
    );
  }
}

class FeelingsWidget extends StatefulWidget {
  FeelingsWidget(
      {super.key,
      required this.imgUrl,
      required this.text,
      required this.fillColor});
  String imgUrl;
  String text;
  Color fillColor;

  @override
  State<FeelingsWidget> createState() => _FeelingsWidgetState();
}

class _FeelingsWidgetState extends State<FeelingsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 78.h,
      width: 70.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          // shape: BoxShape.circle,
          color: widget.fillColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            widget.imgUrl,
            // "assets/images/icons/symptoms_moods/romantic.gif",
            height: 50.h,
            width: 50.w,
          ),
          Text(
            widget.text,
            // "Romantic",
            style: w400_12Poppins(),
          )
        ],
      ),
    );
  }
}
