import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:o_woman/app/routes/routes.dart';
import 'package:o_woman/app/viewmodels/post_login/health_query_controller.dart';
import 'package:o_woman/app/views/health_query/help_weight_health_query/help_weight_health_query.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/font_size.dart';
import 'package:o_woman/constants/images_url.dart';
import 'package:o_woman/utils/helper_widgets/commonTextField.dart';
import 'package:o_woman/utils/helper_widgets/customTextformfield.dart';
import 'package:o_woman/utils/helper_widgets/custom_toast.dart';
import 'package:o_woman/utils/helper_widgets/helper_widgets.dart';

class ApplicationScreen extends StatelessWidget {
  ApplicationScreen({super.key});

  HealthQueryController introScreenController =
      Get.put(HealthQueryController());
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: SafeArea(
          top: false,
          left: true,
          right: true,
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: AppColors.homeBgColor,
            body: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Obx(
                        () => Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              introScreenController.myselfSelected.value == true
                                  ? height70
                                  : height10,
                              height30,
                              Center(
                                  child:
                                      Image.asset(ImagesUrl.questionIconPng)),
                              height10,
                              const Text(
                                  "Who are you using this application for"),
                              Obx(
                                () => Row(
                                  children: [
                                    Radio(
                                      value: true,
                                      groupValue: introScreenController
                                          .myselfSelected.value,
                                      onChanged: (bool? value) {
                                        introScreenController
                                            .myselfSelected.value = true;
                                        if (introScreenController
                                            .selectedRelation!
                                            .any(
                                          (value) => value == true,
                                        )) {
                                          for (var item in introScreenController
                                              .selectedRelation!) {
                                            item.value = false;
                                          }
                                        }
                                      },
                                    ),
                                    const Text('Myself'),
                                  ],
                                ),
                              ),
                              Obx(
                                () => Row(
                                  children: [
                                    Radio(
                                      value: false,
                                      groupValue: introScreenController
                                          .myselfSelected.value,
                                      onChanged: (bool? value) {
                                        introScreenController
                                            .myselfSelected.value = false;
                                      },
                                    ),
                                    const Text('Others'),
                                  ],
                                ),
                              ),
                              Obx(
                                () =>
                                    !introScreenController.myselfSelected.value
                                        ? Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              height10,
                                              Wrap(
                                                spacing: 10.w,
                                                runSpacing: 10.h,
                                                children: List.generate(
                                                    introScreenController
                                                        .relationsList.length,
                                                    (index) => GestureDetector(
                                                        onTap: () {
                                                          introScreenController
                                                                  .nameInput
                                                                  .value =
                                                              introScreenController
                                                                      .relationsList[
                                                                  index];

                                                          for (int i = 0;
                                                              i <
                                                                  introScreenController
                                                                      .relationsList
                                                                      .length;
                                                              i++) {
                                                            if (i == index) {
                                                              introScreenController
                                                                      .selectedRelation![
                                                                          i]
                                                                      .value =
                                                                  !introScreenController
                                                                      .selectedRelation![
                                                                          i]
                                                                      .value;
                                                              print(
                                                                  introScreenController
                                                                      .nameInput
                                                                      .value);
                                                            } else {
                                                              introScreenController
                                                                  .selectedRelation![
                                                                      i]
                                                                  .value = false;
                                                            }
                                                          }
                                                        },
                                                        child: Obx(
                                                          () => Container(
                                                            decoration:
                                                                BoxDecoration(
                                                                    color: introScreenController.selectedRelation![index].value ==
                                                                            true
                                                                        ? AppColors
                                                                            .mainColor
                                                                        : AppColors
                                                                            .whiteColor,
                                                                    borderRadius:
                                                                        BorderRadius.circular(6
                                                                            .sp),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: introScreenController.selectedRelation![index].value ==
                                                                              true
                                                                          ? Colors
                                                                              .transparent
                                                                          : AppColors
                                                                              .colorGray
                                                                              .withOpacity(0.5),
                                                                    )),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Text(
                                                                "My ${introScreenController.relationsList[index]}",
                                                                style: w400_14Poppins(
                                                                    color: introScreenController.selectedRelation![index].value ==
                                                                            true
                                                                        ? AppColors
                                                                            .whiteColor
                                                                        : AppColors
                                                                            .blackColor),
                                                              ),
                                                            ),
                                                          ),
                                                        ))),
                                              ),
                                              height10,
                                              Obx(
                                                () => introScreenController
                                                        .selectedRelation!
                                                        .any(
                                                  (value) => value == true,
                                                )
                                                    ? CustomTextFormField(
                                                        controller:
                                                            introScreenController
                                                                .relationEditingController
                                                                .value,
                                                        hintText:
                                                            "Enter the name of your ${introScreenController.nameInput.value.toString()}",
                                                      )
                                                    : const SizedBox.shrink(),
                                              )
                                            ],
                                          )
                                        : const SizedBox(),
                              ),
                              const Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // width30,
                                  GestureDetector(
                                    onTap: () {
                                      if (!introScreenController
                                          .myselfSelected.value) {
                                        if (introScreenController
                                                .selectedRelation!
                                                .any(
                                              (value) => value == true,
                                            ) &&
                                            introScreenController
                                                .relationEditingController
                                                .value
                                                .text
                                                .isNotEmpty) {
                                          Navigator.pushNamed(
                                              context, Routes.intent);
                                        } else if (introScreenController
                                            .nameInput.value
                                            .toString()
                                            .isEmpty) {
                                          CustomToast.showErrorToast(
                                              msg:
                                                  "Select any one of the above");
                                        } else if (introScreenController
                                            .selectedRelation!
                                            .any(
                                          (value) => value == true,
                                        )) {
                                          CustomToast.showErrorToast(
                                              msg:
                                                  "Enter the name of your ${introScreenController.nameInput.value.toString()}");
                                        } else {
                                          CustomToast.showErrorToast(
                                              msg:
                                                  "Select any one of the above");
                                        }
                                      } else {
                                        Navigator.pushNamed(
                                            context, Routes.intent);
                                      }
                                    },
                                    child: Obx(
                                      () => HelpWeightHealthQuery()
                                          .nextContainer(
                                              buttonColor: !introScreenController
                                                      .myselfSelected.value
                                                  ? introScreenController
                                                      .selectedRelation!
                                                      .any(
                                                      (value) =>
                                                          value == true &&
                                                          introScreenController
                                                              .relationEditingController
                                                              .value
                                                              .text
                                                              .isNotEmpty,
                                                    )
                                                  : true &&
                                                          introScreenController
                                                              .myselfSelected
                                                              .value
                                                      ? true
                                                      : false),
                                    ),
                                  ),
                                ],
                              ),
                            ]),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
