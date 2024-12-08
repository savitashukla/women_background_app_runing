import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/images_url.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.07,
        child: TextFormField(
          decoration: InputDecoration(
            suffixIcon: Padding(
              padding: EdgeInsets.all(10.0.w),
              child: SvgPicture.asset(
                ImagesUrl.searchIcon,
                color: AppColors.buttonColor,
              ),
            ),
            hintText: "Search",
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.0.h, horizontal: 10.0.w),
            border: InputBorder.none,
            fillColor: AppColors.whiteColor,
            filled: true,
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0.r),
              borderSide: const BorderSide(
                color: AppColors.whiteColor,
              ),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0.r),
                borderSide: const BorderSide(
                  color: AppColors.whiteColor,
                )),
          ),
        ),
      ),
    );
  }
}
