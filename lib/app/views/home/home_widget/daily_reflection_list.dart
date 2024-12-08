import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/images_url.dart';
import '../../../../utils/helper_widgets/helper_widgets.dart';

class DailyReflectionList
{
  methodDailyReflectionWidget(BuildContext context)
  {
   return Container(
     height: 135.h,
     margin: EdgeInsets.only(left: 0, right: 10.w),
     decoration: BoxDecoration(
         color: AppColors.homeMenstrualH,
         borderRadius: BorderRadius.all(
           Radius.circular(10.r),
         )),
     child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
       crossAxisAlignment: CrossAxisAlignment.center,
       children: [
         SizedBox(
           height: 10.h,
         ),
         Center(
           child: HelperWidget().testMethod(
               14.0,
               FontWeight.w500,
               AppColors.homePageDailyRText,
               "Menstrual health"),
         ),
         SizedBox(
           height: 5.h,
         ),
         Image.asset(
           ImagesUrl.dailyRef,
           height: 80.h,
           width: 100.w,
         ),

         // const SizedBox(height: 10,),
       ],
     ),
   );
  }
}