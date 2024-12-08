import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:o_woman/app/viewmodels/community_notification_cotroller.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/images_url.dart';
import 'package:o_woman/utils/appBarheader.dart';

class CommunityNotification extends StatelessWidget {
  CommunityNotification({super.key});

  CommunityNotificationCotroller controller =
      Get.put(CommunityNotificationCotroller());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.homeBgColor,
      body: Column(
        children: [
          const SizedBox(height: 15),
          const AppBarHeader(
            title: "Notification",
          ),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 20,
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 15, top: 10, right: 15),
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        //height: 200,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 38.h,
                              width: 48.w,
                              child: Stack(
                                children: [
                                  SizedBox(
                                      height: 38.h,
                                      width: 38.w,
                                      child: Image.asset(ImagesUrl.profileImage)),
                                  index%10==0?      Positioned(
                                    left:20.w,
                                    bottom: 0.h,
                                    child: Container(
                                      height: 22.h,
                                      width: 22.w,
                                      decoration: const BoxDecoration(
                                        color: AppColors.notificationBg,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: Image.asset(
                                          ImagesUrl.notificationPeople,
                                          height: 15.h,
                                          width: 15.w,
                                        ),
                                      ),
                                    ),
                                  ):Positioned(
                                    left:20.w,
                                    bottom: 0.h,
                                    child: Container(
                                      height: 22.h,
                                      width: 22.w,
                                      decoration: const BoxDecoration(
                                        color: AppColors.notificationBg,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: SvgPicture.asset(
                                          ImagesUrl.notificationRed,
                                          height: 15.h,
                                          width: 15.w,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                             Padding(
                              padding: EdgeInsets.only(left: 10.w),
                              child: const Text(
                                'katharine_97',
                                style:
                                 TextStyle(
                                    color: AppColors.colorPrimaryTestDarkMore,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                           Padding(
                              padding: EdgeInsets.only(left: 10.w,),
                              child: const Text(
                                'started following you',
                                style: TextStyle(
                                    color: AppColors.colorPrimaryTestDarkMore,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    ));
  }
}
