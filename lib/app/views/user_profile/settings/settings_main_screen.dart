import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:o_woman/app/routes/routes.dart';
import 'package:o_woman/app/views/user_profile/profile_screen.dart';
import 'package:o_woman/app/views/user_profile/settings/settings_widget/common_settings.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/font_size.dart';
import 'package:o_woman/constants/images_url.dart';

class SettingsMainScreen extends StatefulWidget {
  const SettingsMainScreen({super.key});

  @override
  State<SettingsMainScreen> createState() => _SettingsMainScreenState();
}

class _SettingsMainScreenState extends State<SettingsMainScreen> {
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
            "Settings",
            style: w400_16Poppins(
              color: AppColors.blackColor.withOpacity(0.7),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(12.0.sp),
            child: Column(
              children: [
                // settingsWidget(
                //   onTap: () {
                //     Navigator.pushNamed(context, Routes.healthTrackingScreen);
                //   },
                //   bgColor: AppColors.purpleBackgroundColor,
                //   imgString: ImagesUrl.healthTrackingIcon,
                //   title: "Health Tracking",
                // ),
                // const SizedBox(
                //   height: 15,
                // ),
                settingsWidget(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.notificationsScreen);
                  },
                  bgColor: AppColors.greenBackgroundColor,
                  imgString: ImagesUrl.notificationGreenIcon,
                  title: "Notifications",
                ),
                height15,
                settingsWidget(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.remindersScreen);
                  },
                  bgColor: AppColors.maroonBackgroundColor,
                  imgString: ImagesUrl.reminderIcon,
                  title: "Reminder",
                ),
                height15,
                settingsWidget(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.appPreferencesScreen);
                  },
                  bgColor: AppColors.cyanBackgroundColor,
                  imgString: ImagesUrl.appPreferencesIcon,
                  title: "App preferences",
                ),
                // height15,
                // settingsWidget(
                //   onTap: () {
                //     Navigator.pushNamed(context, Routes.dataBackupScreen);
                //   },
                //   bgColor: AppColors.lightBlueColor,
                //   imgString: ImagesUrl.dataBackupIcon,
                //   title: "Data backup",
                // ),
                height15,
                settingsWidget(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.privacySecurityScreen);
                  },
                  bgColor: const Color(0xffffddf3),
                  imgString: ImagesUrl.privacySecurityIcon,
                  title: "Privacy & Security",
                ),
                height15,
                customContainer(context, AppColors.maroonBackgroundColor,
                    "Delete Acount", ImagesUrl.deleteAccountIcon),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
