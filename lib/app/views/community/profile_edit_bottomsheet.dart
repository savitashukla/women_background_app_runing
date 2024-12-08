import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:o_woman/app/routes/routes.dart';
import 'package:o_woman/constants/app_colors.dart';

class ProfileEditAndPolls extends StatelessWidget {
  const ProfileEditAndPolls({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 5,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: AppColors.mainColor.withOpacity(0.5),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.r),
              topRight: Radius.circular(10.r))),
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ////////
               Padding(
                padding:
                    EdgeInsets.only(left: 15, top: 15),
                child: Row(
                  children: [
                    const Icon(
                      Icons.edit,
                      size: 15,
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, Routes.communityEditProfile);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 12),
                        child: Text(
                          'Edit Profile',
                          style: TextStyle(
                              color: AppColors
                                  .colorPrimaryTestDarkMore.withOpacity(0.8),
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              //////////
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15),
                child: Divider(
                  color: AppColors
                      .colorPrimaryTestDarkMore
                      .withOpacity(0.5),
                  thickness: 0.5,
                ),
              ),
    
              /////////
               Padding(
                padding:
                    const EdgeInsets.only(left: 15, top: 15),
                child: Row(
                  children: [
                    const Icon(
                      Icons.poll_outlined,
                      size: 15,
                    ),
                    GestureDetector(
                      onTap: (){
                         Navigator.pushNamed(context, Routes.communityCreatePolls);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 12),
                        child: Text(
                          'Create Polls',
                          style: TextStyle(
                              color: AppColors
                                  .colorPrimaryTestDarkMore.withOpacity(0.8),
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
