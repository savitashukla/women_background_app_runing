import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:o_woman/app/views/user_profile/profile_screen.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/images_url.dart';

import '../../app/viewmodels/home_controller/home_page_controller.dart';

class ProfilePicturewithCameraIcon extends StatefulWidget {
  const ProfilePicturewithCameraIcon({super.key});

  @override
  State<ProfilePicturewithCameraIcon> createState() =>
      _ProfilePicturewithCameraIconState();
}

class _ProfilePicturewithCameraIconState extends State<ProfilePicturewithCameraIcon> {

HomePageController homePageController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
      SizedBox(
        width: 60,
        height: 60,
        child: UnicornOutlineButton(
          strokeWidth: 3,
          radius: 50.r,
          gradient: const LinearGradient(
              colors: [Color(0xff9DA4FB), Color(0xffF496C4)]),
          child: Image.asset(ImagesUrl.profileImage),
          onPressed: () {},
        ),
      ),
      Positioned(
        right: 5,
        bottom: 0,
        child: Container(
          height: 18,
          width: 18,
          decoration: BoxDecoration(
            color: AppColors.lightPinkColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: SvgPicture.asset(
              ImagesUrl.cameraIcon,
            ),
          ),
        ),
      )
    ]);
  }
}
