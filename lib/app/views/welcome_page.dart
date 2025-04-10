import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:o_woman/app/routes/routes.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/images_url.dart';

import '../../constants/font_size.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Color(0xfffbd2d9),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25))),
              child: CarouselSlider(
                items: [
                  Image.asset(
                    ImagesUrl.onboarding1,
                  ),
                  Image.asset(
                    ImagesUrl.onboarding2,
                  ),
                  SvgPicture.asset(
                    ImagesUrl.welcomeImg,
                    height: 230.h,
                  ),
                ],
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height / 2.5,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 200),
                  viewportFraction: 1,
                ),
              ),
            ),
            Column(
              children: [
                height70,
                height70,
                height70,
                height70,
                height50,
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(24)),
                    child: Column(
                      children: [
                        height20,
                        SvgPicture.asset(ImagesUrl.appLogo),
                        height15,
                        // Text(
                        //   "Welcome to OWOMEN",
                        //   style: w700_20Poppins(color: AppColors.maroonColor),
                        // ),
                        height15,
                        Text(
                          "Where Every Woman's \nStory Matters",
                          style: w500_20Poppins(
                              color: AppColors.blackColor.withOpacity(0.8)),
                          textAlign: TextAlign.center,
                        ),
                        height40,
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, Routes.login);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.05,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: const Color(0xffBF9299)
                                          .withOpacity(0.5),
                                      blurRadius: 30,
                                      spreadRadius: 1,
                                      offset: const Offset(0, 15))
                                ],
                                color: AppColors.mainColor,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                                child: Text(
                              "Login",
                              style:
                                  w500_16Poppins(color: AppColors.whiteColor),
                            )),
                          ),
                        ),
                        height20,
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, Routes.register);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.05,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.mainColor,
                                ),
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                                child: Text(
                              "Register",
                              style: w500_16Poppins(color: AppColors.mainColor),
                            )),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
