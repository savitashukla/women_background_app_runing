import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:o_woman/app/viewmodels/community_controller/community_createpost_controller.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/font_size.dart';
import 'package:o_woman/constants/images_url.dart';

class FollowWidget extends StatelessWidget {
  FollowWidget({super.key});

  CommunityProfileController controller = Get.put(CommunityProfileController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.whiteColor, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                        height: 45,
                        width: 45,
                        child: Image.asset(ImagesUrl.profileImage)),
                    width15,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Chanchal Soni",
                          style: w500_12Poppins(),
                        ),
                        Text(
                          "Delhi",
                          style: w400_12Poppins(),
                        )
                      ],
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: MediaQuery.of(context).size.height * 0.04,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: AppColors.mainColor)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.add,
                        color: AppColors.mainColor,
                      ),
                      width5,
                      Text(
                        "Follow",
                        style: w400_14Poppins(color: AppColors.mainColor),
                      )
                    ],
                  ),
                )
              ],
            ),
            Text(
              "Deep relaxaion meditation provides a gateway to ourinner wisdom and intuition. In the stillness of the...",
              style:
                  w400_12Poppins(color: AppColors.blackColor.withOpacity(0.5)),
            ),
            height10,
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                ImagesUrl.meditationImage,
                fit: BoxFit.fill,
              ),
            ),
            height15,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        controller.isPostLiked();
                      },
                      child: Obx(() => controller.isNotLiked.value? SvgPicture.asset(ImagesUrl.favoriteIcon)
                      :const Icon(Icons.favorite,color: AppColors.mainColor,))
                      ),
                    width5,
                    Text(
                      "1.2K",
                      style: w400_12Poppins(),
                    ),
                    width10,
                    GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10.r),
                                    topLeft: Radius.circular(10.r))),
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.of(context).viewInsets,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height / 1.7,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10.r),
                                          topRight: Radius.circular(10.r))),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      const Center(
                                        child: Text(
                                          'Comments',
                                          style: TextStyle(
                                              color: AppColors
                                                  .colorPrimaryTestDarkMore,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      Expanded(
                                        child: ListView.builder(
                                            itemCount: 100,
                                            physics:
                                                const BouncingScrollPhysics(),
                                            scrollDirection: Axis.vertical,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  children: [
                                                    SizedBox(
                                                        height: 45.h,
                                                        width: 45.h,
                                                        child: Image.asset(
                                                            ImagesUrl
                                                                .profileImage)),
                                                    const Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 15),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'katharine_97',
                                                            style: TextStyle(
                                                                color: AppColors
                                                                    .colorPrimaryTestDarkMore,
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                          Text(
                                                            'Wow...',
                                                            style: TextStyle(
                                                              color: AppColors
                                                                  .colorPrimaryTestDarkMore,
                                                              fontSize: 14,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              );
                                            }),
                                      ),
                                      Container(
                                        // height: 40,
                                        decoration: const BoxDecoration(
                                          color: AppColors.boxShadow1,
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                flex: 2,
                                                child: Image.asset(
                                                  ImagesUrl.profileImage,
                                                  height: 30,
                                                )),
                                            Expanded(
                                              flex: 11,
                                              child: TextFormField(
                                                maxLines: null,
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText:
                                                      'write a comment...',
                                                  hintStyle: TextStyle(
                                                      color: AppColors
                                                          .colorPrimaryTestDarkMore
                                                          .withOpacity(0.5)),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: SvgPicture.asset(ImagesUrl.messagesIcon)),
                    width5,
                    Text(
                      "150",
                      style: w400_12Poppins(),
                    ),
                    width10,
                    SvgPicture.asset(ImagesUrl.shareIcon),
                  ],
                ),
                GestureDetector(
                  onTap: (){
                    controller.isPostCopied();
                  },
                  child: Obx(() =>  
                controller.isNotCopied.value ? SvgPicture.asset(ImagesUrl.copyToClipboard): SvgPicture.asset(ImagesUrl.copyToClipboard,color: AppColors.mainColor,)
                  )
                 )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class QuestionWidget extends StatefulWidget {
  const QuestionWidget({super.key});

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  CommunityProfileController controller = Get.put(CommunityProfileController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.whiteColor, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    height: 45,
                    width: 45,
                    child: Image.asset(ImagesUrl.profileImage)),
                width15,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Keerthi",
                      style: w500_12Poppins(),
                    ),
                    Text(
                      "Delhi",
                      style: w400_12Poppins(),
                    )
                  ],
                ),
                width10,
                SvgPicture.asset(
                  ImagesUrl.starPeopleIcon,
                ),
              ],
            ),
            Text(
              "Do you have a family history of diabetes?",
              style:
                  w400_12Poppins(color: AppColors.blackColor.withOpacity(0.5)),
            ),
            height10,
            GestureDetector(
              onTap: () {
                controller.isTapped.value = true;
              },
              child: Obx(
                () => Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.05,
                      decoration: BoxDecoration(
                          color: AppColors.disableColor.withOpacity(0.5)),
                      child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("A. Yes"),
                          )),
                    ),
                    AnimatedContainer(
                      width: controller.isTapped.value
                          ? MediaQuery.of(context).size.width * .2
                          : 0,
                      duration: const Duration(milliseconds: 800),
                      color: Colors.blue,
                      curve: Curves.easeOut,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                            color: AppColors.disableColor.withOpacity(0.5)),
                        child: const Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("A. Yes"),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            height10,
            GestureDetector(
              onTap: (){
                controller.isTappedNo.value = true;
              },
              child: Obx(() => Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.05,
                      decoration: BoxDecoration(
                          color: AppColors.disableColor.withOpacity(0.5)),
                      child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "B. No",
                            ),
                          )),
                    ),
                    AnimatedContainer(
                      width: controller.isTappedNo.value
                          ? MediaQuery.of(context).size.width *.4
                          : 0,
                      duration: const Duration(milliseconds: 800),
                      color: Colors.blue,
                      curve: Curves.easeOut,
                     child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.05,
                      decoration: BoxDecoration(
                          color: AppColors.disableColor.withOpacity(0.5)),
                      child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "B. No",
                            ),
                          )),
                    ),
                    ),
                  ],
                ),
              ),
            ),
            height15,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(ImagesUrl.favoriteIcon),
                    width5,
                    Text(
                      "1.2K",
                      style: w400_12Poppins(),
                    ),
                    width10,
                    SvgPicture.asset(ImagesUrl.messagesIcon),
                    width5,
                    Text(
                      "150",
                      style: w400_12Poppins(),
                    ),
                    width10,
                    SvgPicture.asset(ImagesUrl.shareIcon),
                  ],
                ),
                SvgPicture.asset(ImagesUrl.copyToClipboard)
              ],
            )
          ],
        ),
      ),
    );
  }
}
