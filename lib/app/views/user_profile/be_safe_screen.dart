import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:o_woman/app/routes/routes.dart';
import 'package:o_woman/app/viewmodels/be_safe_history.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/font_size.dart';
import 'package:o_woman/constants/images_url.dart';
import 'package:o_woman/utils/helper_widgets/switch.dart';

class BeSafeScreen extends StatefulWidget {
  const BeSafeScreen({super.key});

  @override
  State<BeSafeScreen> createState() => _BeSafeScreenState();
}

class _BeSafeScreenState extends State<BeSafeScreen> {
  BeSafeHistory controller = Get.put(BeSafeHistory());

  // @override
  // void initState() {
  //   SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
  //     show(context);
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.scaffoldBackgroundColor,
          appBar: AppBar(
            centerTitle: false,
            leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: EdgeInsets.all(12.0.sp),
                  child: SvgPicture.asset(
                    ImagesUrl.backArrowIcon,
                    color: AppColors.blackColor,
                  ),
                )),
            title: Text(
              "BeSafe",
              style: w400_16Poppins(
                color: AppColors.blackColor,
              ),
            ),
            actions: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Routes.historyScreen);
                },
                child: Padding(
                  padding: EdgeInsets.all(8.0.sp),
                  child: Text(
                    "History",
                    style: w500_14Poppins(color: AppColors.mainColor),
                  ),
                ),
              )
            ],
          ),
          body: Padding(
            padding: EdgeInsets.all(12.0.sp),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.contactListScreen);
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.065,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(5.r)),
                    child: Padding(
                      padding: EdgeInsets.all(8.0.sp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Contact List",
                            style: w400_14Poppins(),
                          ),
                          SvgPicture.asset(
                            ImagesUrl.forwardIcon,
                            color: AppColors.mainColor,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                height10,
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.panicModeSetupScreen);
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.065,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(5.r)),
                    child: Padding(
                      padding: EdgeInsets.all(8.0.sp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Panic Mode",
                            style: w400_14Poppins(),
                          ),
                          SvgPicture.asset(
                            ImagesUrl.forwardIcon,
                            color: AppColors.mainColor,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                height10,
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.radiusMonitoringScreen);
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.065,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(5.r)),
                    child: Padding(
                      padding: EdgeInsets.all(8.0.sp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Regular Radius Monitoring",
                            style: w400_14Poppins(),
                          ),
                          SvgPicture.asset(
                            ImagesUrl.forwardIcon,
                            color: AppColors.mainColor,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                height10,
                Container(
                  height: MediaQuery.of(context).size.height * 0.065,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(5.r)),
                  child: Padding(
                    padding: EdgeInsets.all(8.0.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Auto On GPS",
                          style: w400_14Poppins(),
                        ),
                        CustomSwitch(
                            initialValue: controller.autoOnToggle.value,
                            onChanged: (value) {
                              controller.autoOnToggle.value =
                                  !controller.autoOnToggle.value;
                            })
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      //isDismissible: false,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10.r), topLeft: Radius.circular(10.r))),
      builder: (context) {
        return Container(
          height: 220,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.r),
                  topRight: Radius.circular(10.r))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: SvgPicture.asset(ImagesUrl.iconClose),
                  ),
                  const Text(
                    'BeSafe',
                    style: TextStyle(
                        color: AppColors.colorPrimaryTestDarkMore,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              Row(
                children: [
                  Obx(
                    () => Radio(
                        value: 'Radio1',
                        groupValue: controller.selectedValue.value,
                        activeColor: AppColors.mainColor,
                        onChanged: (String? selected) {
                          controller.onValueChanged(selected ?? '');
                        }),
                  ),
                  const Text(
                    'Allow while using application',
                    style: TextStyle(
                        color: AppColors.colorPrimaryTestDarkMore,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              //2nd row
              Row(
                children: [
                  Obx(
                    () => Radio(
                        value: 'Radio2',
                        groupValue: controller.selectedValue2.value,
                        activeColor: AppColors.mainColor,
                        onChanged: (String? selected) {
                          controller.onValueChanged2(selected ?? '');
                        }),
                  ),
                  const Text(
                    'Allow always',
                    style: TextStyle(
                        color: AppColors.colorPrimaryTestDarkMore,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              //3rd row
              Row(
                children: [
                  Obx(
                    () => Radio(
                        value: 'Radio3',
                        groupValue: controller.selectedValue3.value,
                        activeColor: AppColors.mainColor,
                        onChanged: (String? selected) {
                          controller.onValueChanged3(selected ?? '');
                        }),
                  ),
                  const Text(
                    'Don’t allow',
                    style: TextStyle(
                        color: AppColors.colorPrimaryTestDarkMore,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
