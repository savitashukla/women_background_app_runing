import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:o_woman/app/viewmodels/dashboard_controller.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/font_size.dart';

class CommonAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  VoidCallback onTap;
  bool? center;
  @override
  final Size preferredSize;

  //const TopBar({Key key}) : super(key: key);
  CommonAppbar({
    super.key,
    @required this.title,
    required this.onTap,
    this.center,
  }) : preferredSize = const Size.fromHeight(105);

  DashboardController controllerDashBoard = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.15,
        child: AppBar(
          centerTitle: center,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              color: AppColors.mainColor,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(22.r),
              ),
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30.r),
            ),
          ),
          leading: InkWell(
              onTap: onTap,
              child: Padding(
                padding: EdgeInsets.only(left: 10.w, top: 15.h),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.05,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10.r),
                    // border: Border.all(
                    //   color: AppColors.mainColor,
                    // )
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 0.w,bottom: 20.h),
                    child: const Icon(
                      Icons.arrow_back,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              )),
          title: Padding(
            padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
            child: Text(
              title ?? "Back",
              style: w500_18Poppins(color: AppColors.whiteColor),
            ),
          ),
        ));
  }
}
