import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:o_woman/app/viewmodels/search_screen_controller.dart';
import 'package:o_woman/constants/app_colors.dart';

class SearchPage extends StatelessWidget {
   SearchPage({super.key});

  SearchPageController controller = Get.put(SearchPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homeBgColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      SizedBox(height: 14.h,),
        IconButton(
          onPressed: (){Navigator.pop(context);},
           icon: Icon(Icons.arrow_back_rounded)),
         SizedBox(height: 10.h,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 15.h),
            child: Obx(() => TextFormField(
                controller: controller.searchController,
                cursorColor: AppColors.mainColor, 
                style: TextStyle(
                    color: AppColors.colorPrimaryTestDarkMore.withOpacity(0.5), fontSize: 14),
                decoration: InputDecoration(
                 hintText: 'Search...',
                   suffixIcon: IconButton(
                      icon: Icon(controller.isListening.value ? Icons.mic : Icons.mic_none),
                      onPressed: controller.listen,
                    ),
              
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide:  BorderSide(
                      color: AppColors.colorPrimaryTestDarkMore.withOpacity(0.5),
                      width: 1,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide:  BorderSide(
                      color: AppColors.colorPrimaryTestDarkMore.withOpacity(0.5),
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide:  BorderSide(
                      color: AppColors.colorPrimaryTestDarkMore.withOpacity(0.5),
                      width: 1,
                    ),
                  ),
                ),
                onChanged:controller.onChanged ,
              ),
            ),
          
        ),
          
        ],
      ),
    );
  }
}