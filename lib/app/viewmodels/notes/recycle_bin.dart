import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/font_size.dart';
import 'package:o_woman/constants/images_url.dart';

import '../../views/home/circle_paint/const/size_const.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: Padding(
        padding: EdgeInsets.all(12.0.sp),
        child: Column(
          children: [
            SizedBox(height: 30.h,),
            SizedBox(
              height: 40.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: EdgeInsets.all(12.0.sp),
                      child: SvgPicture.asset(
                        ImagesUrl.backArrowIcon,
                        color: AppColors.blackColor.withOpacity(0.7),
                      ),
                    ),
                  ),
                  Text(
                    "Recycle bin",
                    style: w400_16Poppins(
                      color: AppColors.blackColor.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  padding: const EdgeInsets.all(0.0),
                  itemBuilder: (BuildContext context, int index) {
                    return notesListWidget(context);
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Widget notesListWidget(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Container(
            height: 80.h,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10.r)),
            child: Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //Image
                      Container(
                        height: 57.h,
                        width: 60.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: const DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  'https://www.shutterstock.com/image-photo/portrait-happy-indian-asian-young-260nw-1833243328.jpg'),
                            )),
                      ),
                      //Title/subtitile
                      Padding(
                        padding: EdgeInsets.only(top: 15.h, left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Menstruation',
                              style: TextStyle(
                                  fontSize: getFontSize(16),
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.colorPrimaryTestDarkMore),
                            ),
                            Text(
                              'It is time to take care of out self',
                              style: TextStyle(
                                  fontSize: getFontSize(12),
                                  color: AppColors.colorPrimaryTestDarkMore),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            Text('12 Dec 2023',
                                style: TextStyle(
                                    fontSize: getFontSize(12),
                                    color: AppColors.colorPrimaryTestDarkMore)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        height10,
      ],
    );
  }
}
