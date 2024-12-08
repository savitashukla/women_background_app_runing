import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:o_woman/app/viewmodels/community_controller/community_createpost_controller.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/font_size.dart';
import 'package:o_woman/constants/images_url.dart';

class MyPostComponent extends StatelessWidget {
  MyPostComponent({super.key});

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
                //More Icon
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
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(left: 15, top: 15),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.edit,
                                            size: 15,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 12),
                                            child: Text(
                                              'Edit',
                                              style: TextStyle(
                                                  color: AppColors
                                                      .colorPrimaryTestDarkMore,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14),
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
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(left: 15, top: 15),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.delete,
                                            size: 15,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 12),
                                            child: Text(
                                              'Delete',
                                              style: TextStyle(
                                                  color: AppColors
                                                      .colorPrimaryTestDarkMore,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14),
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
                        },
                      );
                    },
                    child: SvgPicture.asset(
                      ImagesUrl.moreVerticalIcon,
                      height: 16,
                      color: AppColors.colorPrimaryTestDarkMore,
                    ))
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
                        onTap: () {
                          controller.isPostLiked();
                        },
                        child: Obx(() => controller.isNotLiked.value
                            ? SvgPicture.asset(ImagesUrl.favoriteIcon)
                            : const Icon(
                                Icons.favorite,
                                color: AppColors.mainColor,
                              ))),
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
                    onTap: () {
                      controller.isPostCopied();
                    },
                    child: Obx(() => controller.isNotCopied.value
                        ? SvgPicture.asset(ImagesUrl.copyToClipboard)
                        : SvgPicture.asset(
                            ImagesUrl.copyToClipboard,
                            color: AppColors.mainColor,
                          )))
              ],
            )
          ],
        ),
      ),
    );
  }
}
