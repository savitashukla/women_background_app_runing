import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:o_woman/app/routes/routes.dart';
import 'package:o_woman/app/viewmodels/community_controller/community_createpost_controller.dart';
import 'package:o_woman/app/views/home/circle_gap_custom_paint.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/font_size.dart';
import 'package:o_woman/constants/images_url.dart';
import 'package:o_woman/utils/helper_widgets/community_widgets.dart';
import 'package:o_woman/utils/helper_widgets/helper_widgets.dart';

class CommunityHomeScreen extends StatefulWidget {
  const CommunityHomeScreen({super.key});

  @override
  State<CommunityHomeScreen> createState() => _CommunityHomeScreenState();
}

class _CommunityHomeScreenState extends State<CommunityHomeScreen> {
  CommunityProfileController controller = Get.put(CommunityProfileController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackgroundColor,
   /*     appBar: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Row(
            children: [
              Container(
                height: 52.h,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
                child: ClipRRect(
                  child: Container(
                    height: 52.h,
                    decoration: const BoxDecoration(
                      color: AppColors.appBarColor1,
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 52.0),
                      child: SizedBox(
                          height: 52.h,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, Routes.profileScreen);
                                      },
                                      child: Stack(
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                width: 48.w,
                                                height: 48.h,
                                                margin:
                                                    EdgeInsets.only(left: 10.w),
                                                child: CircleGapCustomPaint(
                                                  color: AppColors.whiteColor
                                                      .withOpacity(0.4),
                                                  opacity: 0.4,
                                                  strokeWidth: 2.0.w,
                                                  gapPercentage: 60,
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  Navigator.pushNamed(context,
                                                      Routes.profileScreen);
                                                },
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 18.w),
                                                  child: Center(
                                                    child: HelperWidget()
                                                        .testMethod(
                                                            16.0,
                                                            FontWeight.w700,
                                                            AppColors
                                                                .colorPrimary,
                                                            "Community"),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Positioned(
                                            left: 38.w,
                                            bottom: 1.h,
                                            child: Container(
                                              height: 23.h,
                                              width: 23.w,
                                              decoration: const BoxDecoration(
                                                color: AppColors.whiteColor,
                                                shape: BoxShape.circle,
                                              ),
                                              child: Center(
                                                child: SvgPicture.asset(
                                                  ImagesUrl.drawIcon,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                            padding:
                                                EdgeInsets.only(left: 12.w),
                                            child: GestureDetector(
                                              onTap: () {
                                                Navigator.pushNamed(
                                                    context, Routes.searchPage);
                                              },
                                              child: SvgPicture.asset(
                                                ImagesUrl.searchIcon,
                                                color: AppColors.colorPrimary,
                                              ),
                                            )),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 7.w,
                                                top: 0.h,
                                                right: 7.w),
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 10.w, right: 5.w),
                                              child: GestureDetector(
                                                onTap: () {
                                                  Navigator.pushNamed(
                                                      context,
                                                      Routes
                                                          .communityNotification);
                                                },
                                                child: SvgPicture.asset(
                                                  ImagesUrl.notificationRed,
                                                  color: AppColors.colorPrimary,
                                                ),
                                              ),
                                            ))
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),*/
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 15.h,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, Routes.communityProfileScreen);
                      },
                      child: Stack(
                        children: [
                          Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2,
                                    color: AppColors.mainColor
                                        .withOpacity(0.5)),
                                borderRadius: BorderRadius.circular(50)),
                            child: Image.asset(ImagesUrl.profileImage),
                          ),
                          Positioned(
                            right: 1,
                            bottom: 20,
                            left: 22,
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                color: AppColors.lightPinkColor,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: SvgPicture.asset(
                                  ImagesUrl.starPeopleIcon,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    width10,
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, Routes.communityCreatePostScreen);
                      },
                      child: Container(
                          height: MediaQuery.of(context).size.height * 0.06,
                          width: MediaQuery.of(context).size.width / 1.3,
                          decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              border:
                                  Border.all(color: AppColors.colorGray),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Write something...",
                                  style: w400_12Poppins(
                                    color: AppColors.blackColor
                                        .withOpacity(0.5),
                                  ),
                                ),
                                SvgPicture.asset(
                                  ImagesUrl.linkIcon,
                                ),
                              ],
                            ),
                          )),
                    )
                  ],
                ),
              ),
              SizedBox(height: 15.h,),
              ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 15,
                      ),
                  itemCount: 10,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return index.isEven
                        ? Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10),
                            child: FollowWidget(),
                          )
                        : const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: QuestionWidget(),
                          );
                  }),
            ],
          ),
        ),

      ),
    );
  }
}
