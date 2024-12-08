import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:o_woman/app/viewmodels/follower_controller.dart';
import 'package:o_woman/app/views/community/community_follow/followingTab.dart';
import 'package:o_woman/app/views/community/community_follow/followers_tab.dart';
import 'package:o_woman/constants/app_colors.dart';

class FollowerScreen extends StatelessWidget {
   FollowerScreen({super.key});
   
  FollowerController controller = Get.put(FollowerController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
          bottom: TabBar(
            controller: controller.tabController,
            tabs: controller.myTabs,
            unselectedLabelColor: AppColors.dailyTipTextC,
            labelColor: AppColors.colorPrimaryTestDarkMore,
          ),
        ),
           body: TabBarView(
          controller: controller.tabController,
          children: [
            FollowersTab(),
            FollowingTab(),
          ]
           )
      ),
    );
  }
}