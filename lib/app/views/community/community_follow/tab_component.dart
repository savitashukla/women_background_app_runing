import 'package:flutter/material.dart';
import 'package:o_woman/constants/app_colors.dart';

class FollowersWidget extends StatelessWidget {
   FollowersWidget({
    super.key,
    required this.circulerImage,
    required this.title,
    required this.subtitle,
    required this.followText,
     this.onTap,
    this.showIcon = true,
    });
  final Image circulerImage;
  final String title;
  final String subtitle;
  final bool showIcon;
  final String followText;
  final onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10,right: 10,top: 5),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(6)),
        child: Row(
          children: [
            //1st Colunm
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25)),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: circulerImage),
                  ),
                ],
              ),
            ),
            //2nd Colunm
             Padding(
              padding: EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      title,
                      style: TextStyle(
                          color: AppColors.colorPrimaryTestDarkMore,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      subtitle,
                      style: TextStyle(
                          color: AppColors.colorPrimaryTestDarkMore,
                          fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            //
             Padding(
              padding: EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: onTap,
                child: Text(
                  followText,
                  style: const TextStyle(
                      color: AppColors.homePageBottomIconColor, fontSize: 12),
                ),
              ),
            ),
           showIcon ? const Icon(Icons.more_vert):IgnorePointer()
          ],
        ),
      ),
    );
  }
}
