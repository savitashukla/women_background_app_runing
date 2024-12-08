import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:o_woman/app/routes/routes.dart';
import 'package:o_woman/app/viewmodels/community_controller/community_createpost_controller.dart';
import 'package:o_woman/app/views/community/profile_edit_bottomsheet.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/font_size.dart';
import 'package:o_woman/constants/images_url.dart';
import 'package:o_woman/utils/helper_widgets/community_widgets.dart';
import 'package:o_woman/utils/helper_widgets/my_post_widget.dart';
import 'package:o_woman/utils/helper_widgets/setings_widgets.dart';

class CommunityProfileScreen extends StatefulWidget {
  const CommunityProfileScreen({super.key});

  @override
  State<CommunityProfileScreen> createState() => _CommunityProfileScreenState();
}

class _CommunityProfileScreenState extends State<CommunityProfileScreen>

    with SingleTickerProviderStateMixin {
  late TabController _postsController;
  @override
  void initState() {
    super.initState();
    _postsController = TabController(length: 2, vsync: this);
    _postsController.addListener(() {
      setState(() {});
    });
  }
  CommunityProfileController controller = Get.put(CommunityProfileController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 160.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(
                                Icons.arrow_back_ios_new_sharp,
                                color: AppColors.whiteColor,
                                size: 15,
                              ),
                            ),
                            const ProfilePicturewithCameraIcon(),
                            GestureDetector(
                              onTap: (){
                           showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10.r),
                                topLeft: Radius.circular(10.r))),
                        builder: (context) {
                          return const ProfileEditAndPolls();
                        },
                      ); },
                              child: SvgPicture.asset(ImagesUrl.moreVerticalIcon,height: 16,))
                          ],
                        ),
                      ),
                      Wrap(children: [
                        Text(
                          "Chanchal Soni",
                          style: w400_14Poppins(color: AppColors.whiteColor),
                        ),
                        width10,
                        SvgPicture.asset(ImagesUrl.starPeopleIcon)
                      ]),
                      height5,
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Text(
                            "Just working on my path to ultimate self love",
                            textAlign: TextAlign.center,
                            style: w400_12Poppins(
                                color: AppColors.whiteColor.withOpacity(0.8)),
                          )),
                      height10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text(
                                "51",
                                style:
                                    w500_16Poppins(color: AppColors.whiteColor),
                              ),
                              Text(
                                "Posts",
                                style:
                                    w400_12Poppins(color: AppColors.whiteColor),
                              ),
                            ],
                          ),
                          width30,
                          GestureDetector(
                            onTap: (){
                              Navigator.pushNamed(context, Routes.followerscreen);
                            },
                            child: Column(
                              children: [
                                Text(
                                  "310",
                                  style:
                                      w500_16Poppins(color: AppColors.whiteColor),
                                ),
                                Text(
                                  "Followers",
                                  style:
                                      w400_12Poppins(color: AppColors.whiteColor),
                                ),
                              ],
                            ),
                          ),
                          width30,
                          GestureDetector(
                            onTap: (){
                              Navigator.pushNamed(context, Routes.followerscreen);
                            },
                            child: Column(
                              children: [
                                Text(
                                  "51",
                                  style:
                                      w500_16Poppins(color: AppColors.whiteColor),
                                ),
                                Text(
                                  "Following",
                                  style:
                                      w400_12Poppins(color: AppColors.whiteColor),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(children: [
                    const TabBar(
                        tabAlignment: TabAlignment.start,
                        isScrollable: true,
                        unselectedLabelColor: AppColors.dailyTipTextC,
                        tabs: [
                          Tab(
                            text: "My Posts",
                            height: 30,
                          ),
                          Tab(
                            text: "Saved",
                          ),
                        ]),
                    Expanded(
                      child: TabBarView(
                        children: [
                        ListView.separated(
                      separatorBuilder: (context,index)=>SizedBox(height: 15,),
                      itemCount: 10,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context,index){
                        return index.isEven ?MyPostComponent():const QuestionWidget();
                      }),
                      
                      ListView.separated(
                      separatorBuilder: (context,index)=>SizedBox(height: 15,),
                      itemCount: 10,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context,index){
                        return index.isEven ?MyPostComponent():const QuestionWidget();
                      }),
                      ]),
                    )
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

