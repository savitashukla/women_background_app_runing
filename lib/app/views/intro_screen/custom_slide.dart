import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/font_size.dart';
import '../../models/static_mode.dart';

class CustomSlide extends StatefulWidget {
  final int idx;
  final PageController controller;

  const CustomSlide({super.key, required this.idx, required this.controller});

  @override
  State<CustomSlide> createState() => _CustomSlideState();
}

class _CustomSlideState extends State<CustomSlide> {
  Future<bool> initializeController() {
    Completer<bool> completer = Completer<bool>();

    /// Callback called after widget has been fully built
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      completer.complete(true);
    });

    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r)),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: 200.h,
                  child:
                  _buildFullscreenImage(customSlideLst[widget.idx].image)),
              height30,
              Text(customSlideLst[widget.idx].key,
                  maxLines: 3,
                  textAlign: TextAlign.center,
                  style: w600_20Poppins(color: AppColors.colorPrimary)),
              height40,
              Text(customSlideLst[widget.idx].key1,
                  maxLines: 4,
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.ltr,
                  style:
                  w400_16Poppins(color: Theme.of(context).disabledColor)),
            ],
          ),
        ));
  }

  Widget _buildFullscreenImage(String image) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.h),
      child: Image.asset(
        image,
        fit: BoxFit.cover,
        alignment: Alignment.center,
      ),
    );
  }
}