import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:o_woman/app/viewmodels/view_insight_controller.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/utils/helper_widgets/helper_widgets.dart';

class ViewInsight extends StatelessWidget {
  ViewInsight({super.key});
  ViewInsightController controller = Get.put(ViewInsightController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.homeBgColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: AppColors.colorPrimaryTestDarkMore,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.copy,
                      color: AppColors.mainColor,
                    ))
              ],
            ),
            SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                '11 Small Changes You Can Make This Year for Your Mental Health',
                style: TextStyle(
                    color: AppColors.colorPrimaryTestDarkMore,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'https://www.sheknows.com/',
                    style: TextStyle(
                        color: AppColors.colorPrimaryTestDarkMore,
                        fontSize: 10,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    '2 Min Read.',
                    style: TextStyle(
                        color: AppColors.colorPrimaryTestDarkMore,
                        fontSize: 10,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 180,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSONav3Bs8tlsS1BPyAGvkzNVIzCgE1eZj9Q&usqp=CAU',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Center(
              child: Text(
                'Self Care Isn’t Selfish',
                style: TextStyle(
                    color: AppColors.insightTextColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
            ),
          const SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Text('If your New Years resolution this year is to improve your mental health, know that it’s definitely possible (and an excellent goal to have!) but you probably won’t have it checked off your list by February. For one thing, big New Years resolutions are always tough. If you’re anything like me, you hit the ground running in January, all energetic and determined, only to lose steam by March, give up by April, and totally forget what the resolution even was by the time December rolls around again.',style: TextStyle(color: AppColors.colorPrimaryTestDarkMore,fontSize: 14,fontWeight: FontWeight.w400),)
              
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
