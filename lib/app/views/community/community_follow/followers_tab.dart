import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:o_woman/app/viewmodels/follower_controller.dart';
import 'package:o_woman/app/views/community/community_follow/tab_component.dart';
import 'package:o_woman/constants/app_colors.dart';

class FollowersTab extends StatelessWidget {
  FollowersTab({super.key});
  FollowerController controller = Get.put(FollowerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homeBgColor,
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: 15,
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return FollowersWidget(
              circulerImage: Image.asset(
                "assets/images/morning.png",
                fit: BoxFit.fill,
              ),
              title: "Emilia_watson",
              followText: "Follow",
              onTap: (){
              },
              subtitle: "Emilia_watson",
              showIcon: true,
            );
          }),
    );
  }
}

