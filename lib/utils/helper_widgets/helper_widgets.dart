import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../app/views/home/circle_paint/const/size_const.dart';
import '../../constants/app_colors.dart';
import '../../app/app.dart';
class HelperWidget {
  showProgress() async {
    showGeneralDialog(
      context: navigatorKey.currentState!.context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      // transitionDuration: Duration(milliseconds: 200),
      pageBuilder: (_, __, ___) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

 Widget centerWidget() {
   return Container(
      height: 6,
      width: 46,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 0),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: AppColors.mainColor.withOpacity(0.3)),
    );
  }

  hideProgress() async {
    Navigator.pop(navigatorKey.currentState!.context);
  }

   void alertLimitExhausted() {
    showGeneralDialog(
      context: navigatorKey.currentState!.context,
      barrierLabel: "Barrier",
      barrierDismissible: true,

      pageBuilder: (_, __, ___) {
        return Center(
          child: Container(
            decoration: const BoxDecoration(color: AppColors.colorPrimary),
            padding:  EdgeInsets.symmetric(horizontal: 20.w),
            height: getProportionateScreenHeight(200),
            margin:  EdgeInsets.symmetric(horizontal: 20.w),
            child: Card(
              margin:  EdgeInsets.only(top: 25.h, bottom: 10.h),
              elevation: 0,
              //color: AppColor().wallet_dark_grey,
              color: Colors.transparent,
              child: Padding(
                padding:  EdgeInsets.only(left: 12.w, right: 12.w),
                child: Column(
                  children: [
                     Padding(
                      padding: EdgeInsets.only(left: 0, top: 10.h, bottom: 20.h),
                      child: const Text(
                        'Daily Limit Reached, \n Contact Support To increase the Limit',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(navigatorKey.currentState!.context);
                      },
                      child: Container(
                        alignment: Alignment.center,

                        height: getProportionateScreenHeight(35),
                        margin:  EdgeInsets.only(
                            left: 0, right: 0, top: 10.h, bottom: 10.h),
                        width: ScreenUtil().screenWidth - ScreenUtil().setWidth(250),

                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              AppColors.greenColorLight,
                              AppColors.greenColor,
                            ],
                          ),

                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(
                                0.0,
                                1.0,
                              ),
                              blurRadius: 1.0,
                              spreadRadius: .3,
                              color: Color(0xFF067906),
                              //inset: true,
                            ),
                            BoxShadow(
                              offset: Offset(00, 00),
                              blurRadius: 00,
                              color: Color(0xFFffffff),
                              //inset: true,
                            ),
                          ],

                          border: Border.all(
                              color: AppColors.whiteColor, width: 2),
                          borderRadius: BorderRadius.circular(30.r),
                          // color: AppColor().whiteColor
                        ),
                        child: const Text(
                          "Contact Support",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontFamily: "Poppins",
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  getContainerWithRadius() {
    return Container(
        width: getProportionateScreenWidth(132),
        height: getProportionateScreenHeight(132.998),
        decoration:  BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15.r)),
        ));
  }

  


 Widget buttonCreateOnlyBorder(
      var textName, var colorsV, var fontWeight, var fontSizeC,var height,var width) {
    return Container(
      width: getProportionateScreenWidth(width),
      height: getProportionateScreenHeight(height),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: AppColors.buttonColorTextWithBorder, width: 1),
        borderRadius: BorderRadius.circular(20.r),
      ),
      alignment: Alignment.center,
      child: Text(
        textName,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize:  getFontSize(fontSizeC),
            fontFamily: "Poppins",
            fontWeight: fontWeight,
            color: colorsV),
      ),
    );
  }


  Widget buttonCreateWithoutBorder(
      var textName, var colorsV, var fontWeight, var fontSizeC,var height,var width) {
    return Container(
      width: getProportionateScreenWidth(width),
      height: getProportionateScreenHeight(height),
      decoration: BoxDecoration(
        color: AppColors.buttonColorTextWithBorder,
        borderRadius: BorderRadius.circular(20.r),
      ),
      alignment: Alignment.center,
      child: Text(
        textName,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize:  getFontSize(fontSizeC),
            fontFamily: "Poppins",
            fontWeight: fontWeight,
            color: colorsV),
      ),
    );
  }
  flutterCustomToast(String messageC) {
    Fluttertoast.showToast(msg: messageC);
  }

  Widget testMethod(var fontSize, var fontWeight, var colorsC, var textS) {
    return Text(
      '$textS',
      textAlign: TextAlign.center,
        textScaleFactor: 1.0,
      style: TextStyle(
        fontSize: getFontSize(fontSize),
        fontFamily: "Poppins",
        color: colorsC,
        fontWeight: fontWeight,
      ),
    );
  }

  Widget testMethodStartAlign(
      var fontSize, var fontWeight, var colorsC, var textS) {
    return Text(
      '$textS',
      textAlign: TextAlign.start,
      textScaleFactor: 1.0,
      style: TextStyle(
        fontSize: getFontSize(fontSize),
        fontFamily: "Poppins",

        color: colorsC,
        fontWeight: fontWeight,
      ),
    );
  }
  buttonCreate(
      var textName, var fontSizeC, var colorsC, var buttonShadowC, testColor) {
    return Container(
      width: getProportionateScreenWidth(140),
      height: getProportionateScreenHeight(35),
      margin: const EdgeInsets.only(right: 0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: buttonShadowC,
              offset: const Offset(0, 3),
              blurRadius: 0,
              spreadRadius: 0)
        ],
        color: colorsC,
        borderRadius: BorderRadius.circular(10.r),
      ),
      alignment: Alignment.center,
      child: Text(
        textName,
        textAlign: TextAlign.center,
        textScaleFactor: 1.0,
        style: TextStyle(
            fontSize: getFontSize(fontSizeC),
            fontFamily: "Poppins",
            fontWeight: FontWeight.w900,
            color: testColor),
      ),
    );
  }



  Widget listShimmer() {
    return Column(
      children: [
        Container(

          height: getProportionateScreenHeight(80),
        ),
        Container(
          height: getProportionateScreenHeight(80),
        )
      ],
    );
  }


}
