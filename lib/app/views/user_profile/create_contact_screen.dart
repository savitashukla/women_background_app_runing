import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:o_woman/app/viewmodels/create-contact_controller.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/font_size.dart';
import 'package:o_woman/constants/images_url.dart';
import 'package:o_woman/utils/appBarheader.dart';
import 'package:o_woman/utils/crop.dart';
import 'package:o_woman/utils/helper_widgets/helper_widgets.dart';
import 'package:o_woman/utils/logger_utils.dart';

import '../../app.dart';

class CreateContact extends StatelessWidget {
  CreateContact({super.key});
  CreateContactController controller = Get.put(CreateContactController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.homeBgColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
            const AppBarHeader(
              title: "Create Contact",
            ),
            SizedBox(
              height: 8.h,
            ),
            Center(
              child: Stack(
                children: [
                  Container(
                    decoration: controller.kGradientBoxDecoration,
                    // width: 110.w,
                    height: 90.h,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: DecoratedBox(
                        decoration: controller.kInnerDecoration,
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Image.asset(
                            ImagesUrl.profileImage,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ) ,
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: GestureDetector(
                      onTap: (){
                    //Image picker
                        showModalBottomSheet(
          backgroundColor: AppColors.colorGrayDarkBg,
          context: navigatorKey.currentState!.context,
          isScrollControlled: true,
          builder: (context) {
            return Wrap(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                      left: 10,
                      right: 10),
                  decoration: const BoxDecoration(
                      color: AppColors.colorGrayDarkBg,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(
                            0.0,
                            5.0,
                          ),
                          blurRadius: 1.0,
                          spreadRadius: .3,
                          color: AppColors.mainColor,
                          //   inset: true,
                        ),
                      ],
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child:  centerWidget(),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        HelperWidget().testMethodStartAlign(
                          14.0,
                          FontWeight.w500,
                          AppColors.blackColor,
                          "Choose Image",
                        ),
                        height10,
                        Row(
                          children: [
                            InkWell(
                                onTap: () async {
                                  final image = await ImagePicker().pickImage(
                                    source: ImageSource.camera,
                                  );
                                  if (image != null) {
                                    final croppedImage =
                                        await CropImage.cropImage(File(image.path));
                                    if (croppedImage != null) {
                                      controller.imagePicker.value =
                                          croppedImage.path;
                                          print("Image Path ==>> ${ controller.imagePicker.value}");
                                      Navigator.pop(context);
                                    }
                                  }
                                },
                                child: SvgPicture.asset(ImagesUrl.cameraPicIcon)),
                            width15,
                            width15,
                            InkWell(
                                onTap: () async {
                                  final image = await ImagePicker().pickImage(
                                    source: ImageSource.gallery,
                                  );
                                  if (image != null) {
                                    final croppedImage =
                                        await CropImage. cropImage(File(image.path));
                                    print("image cropped${croppedImage!.path}");
                                    controller.imagePicker.value =
                                        croppedImage.path;
                                    // ignore: use_build_context_synchronously
                                    Navigator.pop(context);
                                  }
                                },
                                child:
                                    SvgPicture.asset(ImagesUrl.galleryPicIcon)),
                          ],
                        ),
                        height15,
                        Row(
                          children: [
                            HelperWidget().testMethodStartAlign(
                              14.0,
                              FontWeight.w500,
                              AppColors.colorGray,
                              "Camera",
                            ),
                            width15,
                            width15,
                            HelperWidget().testMethodStartAlign(
                              14.0,
                              FontWeight.w500,
                              AppColors.colorGray,
                              "Gallery",
                            ),
                          ],
                        ),
                        height10,
                      ],
                    ),
                  ),
                ),
              ],
            );
          });
                      },
                      child: Container(
                        height: 25.h,
                        width: 28.w,
                        decoration: BoxDecoration(
                          color: AppColors.lightPinkColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: SvgPicture.asset(
                            ImagesUrl.cameraIcon,
                            color: AppColors.mainColor,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                controller: controller.nameController,
                cursorColor: AppColors.mainColor,
                style: const TextStyle(
                    color: AppColors.colorPrimaryTestDarkMore, fontSize: 14),
                decoration: InputDecoration(
                  label: const Text('Name'),
                  labelStyle: const TextStyle(
                      color: AppColors.mainColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: AppColors.borderColor,
                      width: 1,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: AppColors.borderColor,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: AppColors.borderColor,
                      width: 1,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                controller: controller.phnController,
                cursorColor: AppColors.mainColor,
                keyboardType: TextInputType.number,
                style: const TextStyle(
                    color: AppColors.colorPrimaryTestDarkMore, fontSize: 14),
                decoration: InputDecoration(
                  label: const Text('Mobile'),
                  labelStyle: const TextStyle(
                      color: AppColors.mainColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: AppColors.borderColor,
                      width: 1,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: AppColors.borderColor,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: AppColors.borderColor,
                      width: 1,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  centerWidget() {
    Container(
      height: 6,
      width: 46,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 0),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: AppColors.mainColor.withOpacity(0.3)),
    );
  }

}
