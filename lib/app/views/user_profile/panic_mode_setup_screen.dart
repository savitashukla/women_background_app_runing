import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:o_woman/app/routes/routes.dart';
import 'package:o_woman/app/viewmodels/hum_profile/be_safe_controller.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/font_size.dart';
import 'package:o_woman/constants/images_url.dart';
import 'package:o_woman/utils/helper_widgets/switch.dart';

enum volume { volumeUp, volumeDown }

class PanicModeSetupScreen extends StatefulWidget {
  const PanicModeSetupScreen({super.key});

  @override
  State<PanicModeSetupScreen> createState() => _PanicModeSetupScreenState();
}

class _PanicModeSetupScreenState extends State<PanicModeSetupScreen> {
  volume? _volumeButton = volume.volumeUp;
  final TextEditingController _emergerncyTextController =
      TextEditingController();
  BeSafeController beSafeController = Get.put(BeSafeController());
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
            "Panic Mode Setup",
            style: w400_16Poppins(
              color: AppColors.blackColor.withOpacity(0.7),
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
                  style: w500_14Poppins(color: AppColors.textColor),
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(12.0.sp),
            child: Obx(
              () => Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(5.r)),
                    child: Padding(
                      padding: EdgeInsets.all(8.0.sp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Panic Mode",
                                style: w400_14Poppins(),
                              ),
                              Text(
                                "Lorum Ipsum lorum ipsum",
                                style: w400_10Poppins(),
                              )
                            ],
                          ),
                          CustomSwitch(
                            onChanged: (value) {
                              beSafeController.panicModeButton.value =
                                  !beSafeController.panicModeButton.value;
                            },
                            initialValue:
                                beSafeController.panicModeButton.value,
                          )
                         
                        ],
                      ),
                    ),
                  ),
                  beSafeController.panicModeButton.value
                      ? Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              height20,
                              Text(
                                "Assign Button",
                                style: w400_14Poppins(),
                              ),
                              height10,
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Text(
                                  "Press the assigned button three times to activate the feature",
                                  style: w400_10Poppins(),
                                ),
                              ),
                              height10,
                              Container(
                                color: AppColors.whiteColor,
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.w),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Radio<volume>(
                                            value: volume.volumeUp,
                                            activeColor: AppColors.mainColor,
                                            // fillColor:
                                            //     MaterialStateProperty.all(AppColors.buttonColor),
                                            groupValue: _volumeButton,
                                            onChanged: (volume? value) {
                                              setState(() {
                                                _volumeButton = value;
                                              });
                                            },
                                          ),
                                          const Text('Volume Up'),
                                        ],
                                      ),
                                      const Divider(
                                        thickness: 0.3,
                                      ),
                                      Row(
                                        children: [
                                          Radio<volume>(
                                            value: volume.volumeDown,
                                            groupValue: _volumeButton,
                                            activeColor: AppColors.mainColor,
                                            onChanged: (volume? value) {
                                              setState(() {
                                                _volumeButton = value;
                                              });
                                            },
                                          ),
                                          const Text('Volume Down'),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              height15,
                              Text(
                                "Add emergency text",
                                style: w400_14Poppins(),
                              ),
                              height10,
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Text(
                                  "Emergency text will sent to the contacts you have added to list",
                                  style: w400_10Poppins(),
                                ),
                              ),
                              height10,
                              Container(
                                color: AppColors.whiteColor,
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 5.w),
                                  child: TextFormField(
                                    maxLines: 4,
                                    controller: _emergerncyTextController,
                                    decoration: InputDecoration(
                                        hintText: "Start writing",
                                        hintStyle: w400_14Poppins(
                                            color: AppColors.colorGray),
                                        border: InputBorder.none),
                                  ),
                                ),
                              ),
                              height20,
                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.r),
                                      color: AppColors.mainColor),
                                  child: Center(
                                    child: Text(
                                      "Save",
                                      style: w500_14Poppins(
                                          color: AppColors.whiteColor),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      : const SizedBox.shrink()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
