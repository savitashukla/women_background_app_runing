import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:o_woman/app/routes/routes.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/font_size.dart';
import 'package:o_woman/constants/images_url.dart';
import 'package:o_woman/utils/appBarheader.dart';
import 'package:o_woman/utils/helper_widgets/helper_widgets.dart';

class ContactListScreen extends StatefulWidget {
  const ContactListScreen({super.key});

  @override
  State<ContactListScreen> createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.homeBgColor,
        body: Column(
          children: [
           
            const AppBarHeader(
              title: "Contact List",
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
              child: Container(
                // height: MediaQuery.of(context).size.height * 0.45,
                width: MediaQuery.of(context).size.width,
                decoration:  BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.r)),
                    color: AppColors.scaffoldBackgroundColor),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(ImagesUrl.noContactsIcon),
                      Text(
                        "Having no contacts in the list",
                        style: w500_16Poppins(),
                      ),
                      height10,
                      Text(
                        "Emergency text and location will sent to the contacts, "
                        "add some contact from your mobile contact list",
                        textAlign: TextAlign.center,
                        style: w400_14Poppins(color: AppColors.blackColor),
                      ),
                      height10,
                    ],
                  ),
                ),
              ),
            ),
            height15,
            Padding(
              padding:  EdgeInsets.only(left: 15.w),
              child: GestureDetector(
                onTap: () {
               Navigator.pushNamed(context, Routes.createContact);
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.add,
                      color: AppColors.mainColor,
                    ),
                    Text(
                      " Create new Contacts",
                      style: w500_14Poppins(color: AppColors.mainColor),
                    ),
                  ],
                ),
              ),
            ),
           height15,
            Padding(
              padding:  EdgeInsets.only(left: 15.w),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Routes.addContactsScreen);
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.add,
                      color: AppColors.mainColor,
                    ),
                    Text(
                      " Add new Contacts",
                      style: w500_14Poppins(color: AppColors.mainColor),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
