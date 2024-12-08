import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/font_size.dart';

class NotesTagSuggestionContainer extends StatefulWidget {
  NotesTagSuggestionContainer(
      {super.key,
      required this.title,
      this.onTap,
      this.bgColor,
      required this.boolValue,
      this.width});

  final String title;
  final Color? bgColor;
  VoidCallback? onTap;
  final bool boolValue;
  double? width;

  @override
  State<NotesTagSuggestionContainer> createState() =>
      _NotesTagSuggestionContainerState();
}

class _NotesTagSuggestionContainerState
    extends State<NotesTagSuggestionContainer> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.043,
        width: widget.width,
        decoration: BoxDecoration(
            color: widget.boolValue == true
                ? widget.bgColor
                : AppColors.whiteColor,
            border: Border.all(
              color: widget.boolValue == true
                  ? Colors.transparent
                  : AppColors.colorGray.withOpacity(0.3),
            ),
            borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Center(
            child: Text(
              widget.title,
              style: w400_12Poppins(),
            ),
          ),
        ),
      ),
    );
  }
}
