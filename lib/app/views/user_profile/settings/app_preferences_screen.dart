import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:o_woman/app/routes/routes.dart';
import 'package:o_woman/app/viewmodels/hum_profile/settings_screen_controller.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/font_size.dart';
import 'package:o_woman/constants/images_url.dart';
import 'package:o_woman/main.dart';
import 'package:o_woman/utils/helper_widgets/switch.dart';

class AppPreferencesScreen extends StatefulWidget {
  const AppPreferencesScreen({super.key});

  @override
  State<AppPreferencesScreen> createState() => _AppPreferencesScreenState();
}

class _AppPreferencesScreenState extends State<AppPreferencesScreen> {
  List<String> laguage = <String>['  English'];
  SettingsScreenController settingsScreenController =
      Get.put(SettingsScreenController());
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
                  color: AppColors.blackColor.withOpacity(0.7),
                ),
              )),
          title: Text(
            "App preferences",
            style: w400_16Poppins(
              color: AppColors.blackColor.withOpacity(0.7),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: AppColors.whiteColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Text("Language", style: w400_14Poppins()),
                    ),
                    // Center(
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(5),
                    //       border: Border.all(color: AppColors.colorGray),
                    //     ),
                    //     height: MediaQuery.of(context).size.height * 0.055,
                    //     // width: MediaQuery.of(context).size.width * 0.1,
                    //     child: Padding(
                    //       padding: const EdgeInsets.all(0.0),
                    //       child: DropdownMenu<String>(
                    //         enabled: false,
                    //         initialSelection: laguage.first,
                    //         width: MediaQuery.of(context).size.width * 0.32,
                    //         menuHeight: MediaQuery.of(context).size.height * 0.02,
                    //         trailingIcon: SvgPicture.asset(
                    //           ImagesUrl.dropdownIcon,
                    //           color: AppColors.buttonColor,
                    //         ),
                    //         selectedTrailingIcon: const Icon(Icons.expand_less,
                    //             color: AppColors.buttonColor),
                    //         inputDecorationTheme: const InputDecorationTheme(
                    //             border: InputBorder.none),
                    //         onSelected: (String? value) {
                    //           // This is called when the user selects an item.
                    //           setState(() {
                    //             laguage.first = value!;
                    //           });
                    //         },
                    //         dropdownMenuEntries: laguage
                    //             .map<DropdownMenuEntry<String>>((String value) {
                    //           return DropdownMenuEntry<String>(
                    //               value: value, label: value);
                    //         }).toList(),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.04,
                        width: MediaQuery.of(context).size.width * 0.25,
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.colorGray),
                            borderRadius: BorderRadius.circular(5.r)),
                        child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("English"),
                              Icon(
                                Icons.expand_more,
                                color: AppColors.mainColor,
                              )
                            ]),
                      ),
                    )
                  ],
                ),
              ),
              height10,
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Routes.dateTimeScreen);
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.065,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: EdgeInsets.all(8.0.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Date & time",
                          style: w400_14Poppins(),
                        ),
                        SvgPicture.asset(ImagesUrl.forwardIcon,
                            color: AppColors.buttonColor)
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
                        "App Sound",
                        style: w400_14Poppins(),
                      ),
                      CustomSwitch(
                        onChanged: (value) {
                          settingsScreenController.appSoundToggle.value =
                              !settingsScreenController.appSoundToggle.value;
                        },
                        initialValue:
                            settingsScreenController.appSoundToggle.value,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
