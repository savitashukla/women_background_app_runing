import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:o_woman/app/viewmodels/community_controller/community_createpost_controller.dart';

import 'package:o_woman/app/views/dashboard/app_bar.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/font_size.dart';
import 'package:o_woman/constants/images_url.dart';
import 'package:o_woman/utils/helper_widgets/bottom_sheet_call.dart';
import 'package:o_woman/utils/helper_widgets/customTextformfield.dart';
import 'package:o_woman/utils/helper_widgets/switch.dart';

class CommunityCreatePost extends StatefulWidget {
  const CommunityCreatePost({super.key});

  @override
  State<CommunityCreatePost> createState() => _CommunityCreatePostState();
}

class _CommunityCreatePostState extends State<CommunityCreatePost> {
  CommunityProfileController communityScreenController =
      Get.put(CommunityProfileController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackgroundColor,
        appBar: const AppbarCustom(
          title: "Community",
        ),
        body: Obx(
          () => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset(ImagesUrl.iconClose)),
                    Wrap(
                      children: [
                        const Text("Anonymous Post"),
                        width10,
                        //TODO : Checkbox widget instead of image.

                        CustomSwitch(
                            initialValue:
                                communityScreenController.anonymousPost.value,
                            onChanged: (value) {
                              communityScreenController.anonymousPost.value =
                                  !communityScreenController
                                      .anonymousPost.value;
                              if (communityScreenController
                                  .anonymousPost.value) {
                                communityScreenController.anonymousPost.value =
                                    true;
                                communityScreenController.imagePicker.value =
                                    "";
                              } else {
                                communityScreenController.anonymousPost.value =
                                    false;
                              }
                            }),
                      ],
                    ),
                  ],
                ),
                height10,
                Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      border: Border.all(
                          color: AppColors.mainColor.withOpacity(0.5))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: Obx(
                              () => SizedBox(
                                  height: 35,
                                  width: 35,
                                  child: communityScreenController
                                          .anonymousPost.value
                                      ? Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: SvgPicture.asset(
                                            ImagesUrl.personCapImg,
                                            fit: BoxFit.fill,
                                          ),
                                        )
                                      : Image.asset(ImagesUrl.profileImage)),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: CustomTextFormField(
                                maxlines: 3,
                                enableborderColor: Colors.transparent,
                                hintText: "Write something...",
                                hintStyle: w400_12Poppins(
                                  color: AppColors.blackColor.withOpacity(0.8),
                                )),
                          ),
                        ]),
                  ),
                ),
                height15,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Wrap(children: [
                      Obx(
                        () => communityScreenController
                                .imagePicker.value.isNotEmpty
                            ? Stack(children: [
                                Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.045,
                                    width:
                                        MediaQuery.of(context).size.width * 0.1,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: AppColors.disableColor),
                                    child: Image.file(
                                      File(communityScreenController
                                          .imagePicker.value),
                                      fit: BoxFit.fill,
                                    )),
                                const Positioned(
                                    top: 10,
                                    bottom: 10,
                                    left: 10,
                                    right: 10,
                                    child: Icon(
                                      Icons.add,
                                      color: AppColors.whiteColor,
                                    ))
                              ])
                            : InkWell(
                                onTap: () {
                                  BottomSheetCall()
                                      .addAttachmentsCommunityBottomSheet(
                                          communityScreenController);
                                },
                                child: Container(
                                  height: MediaQuery.of(context).size.height *
                                      0.045,
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: AppColors.disableColor),
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: SvgPicture.asset(
                                      ImagesUrl.galleryAdd,
                                      color: AppColors.mainColor,
                                    ),
                                  ),
                                ),
                              ),
                      ),
                      width10,
                      Container(
                        height: MediaQuery.of(context).size.height * 0.045,
                        width: MediaQuery.of(context).size.width * 0.1,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.disableColor),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: SvgPicture.asset(
                            ImagesUrl.videoPlay,
                            color: AppColors.mainColor,
                          ),
                        ),
                      )
                    ]),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                          height: MediaQuery.of(context).size.height * 0.045,
                          width: MediaQuery.of(context).size.width * 0.15,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColors.mainColor),
                          child: Center(
                            child: Text("Post",
                                style: w400_14Poppins(
                                  color: AppColors.whiteColor,
                                )),
                          )),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
