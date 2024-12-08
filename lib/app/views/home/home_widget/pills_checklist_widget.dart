import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/images_url.dart';
import '../../../../utils/helper_widgets/helper_widgets.dart';
import '../../../viewmodels/home_controller/home_page_controller.dart';

class PillsCheckListWidget extends StatefulWidget {
  int index = 0;
  HomePageController homePageController;

  PillsCheckListWidget(this.index, this.homePageController, {super.key});

  @override
  State<PillsCheckListWidget> createState() => _PillsCheckListWidgetState();
}

class _PillsCheckListWidgetState extends State<PillsCheckListWidget> {
  var pillCheckUnCheck = false;

  @override
  Widget build(BuildContext context) {
    return /*widget.index == 0
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {

                  HelperWidget().flutterCustomToast("coming soon");
                //  Navigator.pushNamed(context, Routes.addPillScreen);
                },
                child: Container(
                  height: 70.h,
                  margin: const EdgeInsets.only(left: 0, right: 0),
                  width: (MediaQuery.of(context).size.width - 5) / 4.7,
                  decoration:  BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.pillChe.withOpacity(0.2),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 30.h,
                        width: 30.w,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.whiteColor),
                        child: const Icon(
                          Icons.add,
                          color: AppColors.colorAccent,
                        ),
                      )
                    ],
                  ),
                ),
              ),
               SizedBox(
                height: 1.h,
              ),
              HelperWidget().testMethod(12.0, FontWeight.w400,
                  AppColors.colorPrimaryTestDarkMore, "Add New\nPill"),
            ],
          )
        :*/ Container(
            height: 98.h,
            width: 102.w,

            padding:  EdgeInsets.only(left: 5.w, right: 5.w, top: 5.h),
            margin:  EdgeInsets.only(right: 10.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: AppColors.pillCornerBorder,width: 1),
                color: AppColors.whiteColor),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 40.h,
                      margin: const EdgeInsets.only(left: 0, right: 0,top: 5),
                      width: 40.w,
                      decoration:  const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.pillCornerGlass,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(ImagesUrl.pillsGynovedaC,
                              height: 20.h, width: 13.w, fit: BoxFit.fill),
                        ],
                      ),
                    ),
                     SizedBox(
                      height: 10.h,
                    ),
                    HelperWidget().testMethodStartAlign(12.0, FontWeight.w400,
                        AppColors.blackColor.withOpacity(0.60), "Gynoveda\nToday, 8:00 am ")
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    if (pillCheckUnCheck) {
                      pillCheckUnCheck = false;
                    } else {
                      pillCheckUnCheck = true;
                    }

                    setState(() {});
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      pillCheckUnCheck
                          ? Container(
                              height: 20.h,
                              width: 20.w,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,

                                color: AppColors.colorPrimaryLight,
                              ),
                              child: SvgPicture.asset(
                                ImagesUrl.mdiTick,
                                color: AppColors.whiteColor,
                              ),
                            )
                          : Container(
                              height: 20.h,
                              width: 20.w,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.pillCornerGlass,
                              ),
                              child: SvgPicture.asset(
                                ImagesUrl.mdiTick,
                                color: AppColors.whiteColor.withOpacity(0.5),
                              ),
                            ),
                    ],
                  ),
                )
              ],
            ),
          );
  }
}
