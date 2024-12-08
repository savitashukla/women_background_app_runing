import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/app_colors.dart';
import '../../../../utils/helper_widgets/helper_widgets.dart';

class HelpWeightHealthQuery {
  Widget nextContainer( {  buttonColor,text}) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 30),
      height: 37,
      width: 111,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: buttonColor ? AppColors.mainColor : AppColors.disableColor,
      ),
      child: Center(
        child: HelperWidget()
            .testMethod(14.0, FontWeight.w500, Colors.white,text?? "Next"),
      ),
    );
  }

  Widget answerWidgetContainerCenterV5(
      BuildContext context, String answer, Color? boxColor, Color? textColor) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      height: 38,
      padding: const EdgeInsets.only(left: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: boxColor ?? AppColors.whiteColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          HelperWidget().testMethod(14.0, FontWeight.w400,
              textColor ?? AppColors.textColorQus, answer),
        ],
      ),
    );
  }

  Widget answerWidgetContainerBottomV10(
      BuildContext context, String answer, Color? boxColor, Color? textColor) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      height: 38,
      padding: const EdgeInsets.only(left: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: boxColor ?? AppColors.whiteColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          HelperWidget().testMethod(14.0, FontWeight.w400,
              textColor ?? AppColors.textColorQus, answer),
        ],
      ),
    );
  }

  Widget answerWidgetContainerBottomSheet(
      BuildContext context, String answer, Color? boxColor) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 38,
      padding: const EdgeInsets.only(left: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: boxColor ?? AppColors.whiteColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          HelperWidget().testMethod(
              14.0, FontWeight.w500, AppColors.textColorQus, answer),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.colorPrimary),
            child: Icon(
              Icons.add,
              size: 20.sp,
              color: Theme.of(context).disabledColor,
            ),
          )
        ],
      ),
    );
  }
}
