import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:o_woman/app/viewmodels/community_controller/community_edit_profile_controller.dart';
import 'package:o_woman/app/views/dashboard/second_app_bar.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/images_url.dart';

class CommunityCreatePolls extends StatelessWidget {
  CommunityCreatePolls({super.key});
  CommunityProfileEditController controller =
      Get.put(CommunityProfileEditController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.homeBgColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 52.h,
              color: Colors.transparent,
              child: ClipRRect(
                child: Container(
                  height: 52.h,
                  decoration: const BoxDecoration(
                    color: AppColors.appBarColor1,
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 52.0),
                    child: AppBarSec().appBarSecondMethod(context),
                  ),
                ),
              ),
            ),
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Padding(
                  padding: EdgeInsets.all(12.0.sp),
                  child: SvgPicture.asset(ImagesUrl.iconClose),
                )),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 12, top: 12),
                      child: Text(
                        "Write your questions?",
                        style: TextStyle(
                            color: AppColors.colorPrimaryTestDarkMore,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Obx(
                      () => ListView.builder(
                        itemCount: controller.questions.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          bool isLastItem =
                              index == controller.questions.length - 1;
                          bool isBeyondFixedItems = index > 1;
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 8),
                            child: Container(
                              height: 30,
                              decoration: BoxDecoration(
                                  color: AppColors.homeBgColor,
                                  borderRadius: BorderRadius.circular(5)),
                              child: TextFormField(
                                controller: controller.questions[index],
                                cursorColor: AppColors.mainColor,
                                style: const TextStyle(
                                    color: AppColors.colorPrimaryTestDarkMore,
                                    fontSize: 14),
                                maxLines: null,
                                decoration: InputDecoration(
                                  hintText: "  Options",
                                  hintStyle: TextStyle(
                                      color: AppColors.colorPrimaryTestDarkMore
                                          .withOpacity(0.5)),
                                  contentPadding: EdgeInsets.zero,
                                  filled: true,
                                  fillColor: Colors.grey.shade100,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      color: AppColors.borderColor,
                                      width: 1,
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      color: AppColors.borderColor,
                                      width: 1,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      color: AppColors.borderColor,
                                      width: 1,
                                    ),
                                  ),
                                  suffixIcon: (isLastItem && isBeyondFixedItems)
                                      ? IconButton(
                                          onPressed: () {
                                            controller.removeItem(index);
                                          },
                                          icon: Icon(Icons.dangerous_sharp,color: AppColors.mainColor,),
                                        )
                                      : null,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Obx(
              () => Visibility(
                visible: controller.questions.length < 6 ? true : false,
                child: TextButton(
                    onPressed: () {
                      controller.onAdd();
                    },
                    child: const Text(
                      "Add Option",
                      style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
