import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:o_woman/app/routes/routes.dart';
import 'package:o_woman/app/viewmodels/insightController.dart';
import 'package:o_woman/app/views/community/for_you_list.dart';
import 'package:o_woman/app/views/community/grid_image.dart';
import 'package:o_woman/app/views/community/horizontal_list.dart';
import 'package:o_woman/app/views/community/news_for_you.dart';
import 'package:o_woman/app/views/community/recomended_list.dart';
import 'package:o_woman/app/views/community/you_may_like.dart';
import 'package:o_woman/constants/app_colors.dart';

class InsightHomePage extends StatelessWidget {
   InsightHomePage({super.key});

  InsightController controller = Get.put(InsightController());
  
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homeBgColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //HorizontalList
            HorizontalList(),
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                'For you',
                style: TextStyle(
                    color: AppColors.colorPrimaryTestDarkMore,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
            ),
          //  const SizedBox(height: 15),
            //For you List
            SizedBox(
              height: 300,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.viewInsights);
                        },
                        child: const ForYouList(
                          image:
                              'https://thumbs.dreamstime.com/b/happy-family-mother-father-children-son-daughter-sunset-nature-150794881.jpg',
                          title: 'Importance of healthy food',
                          subTitle:
                              'It is time to understanda menstruating girl is as beautiful as a pregnant lady.',
                          time: '2 min Read',
                        ),
                      ),
                    );
                  }),
            ),
            //Popular
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                'Popular',
                style: TextStyle(
                    color: AppColors.colorPrimaryTestDarkMore,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
            ),
            const SizedBox(height: 15),
            const GridImage(
              grid1stText: 'Self Care \nIsn’t Selfish',
              grid2ndText: 'Self Care \nIsn’t Selfish',
              grid3rdText: 'Self Care \nIsn’t Selfish',
              grid4thText: 'Self Care \nIsn’t Selfish',
            ),
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                'Recomennded',
                style: TextStyle(
                    color: AppColors.colorPrimaryTestDarkMore,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
            ),

            //Recomended List
          const  RecomendedList(),
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                'You may like',
                style: TextStyle(
                    color: AppColors.colorPrimaryTestDarkMore,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
            ),
            //const SizedBox(height: 15),
            const YouMayLike(),
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                'News for you',
                style: TextStyle(
                    color: AppColors.colorPrimaryTestDarkMore,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
            ),
           // const SizedBox(height: 15),
            NewsForYou(),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}

