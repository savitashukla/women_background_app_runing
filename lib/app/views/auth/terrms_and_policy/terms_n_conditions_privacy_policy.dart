
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:o_woman/constants/app_string.dart';
import 'package:o_woman/utils/helper_widgets/helper_widgets.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/font_size.dart';
import '../../../../constants/images_url.dart';

class TermsNConditionsPrivacy extends StatelessWidget {
   const TermsNConditionsPrivacy({super.key, required this.appBarTitle, required this.iconName});

  final String appBarTitle;
  final String iconName;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
    
          Padding(
            padding: const EdgeInsets.only(top: 100,right: 10,left: 10),
            child: SingleChildScrollView(
              child: appBarTitle == "Terms & Conditions"
                  ? Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8,
                            ),
                            child: Text(
                              "Introduction:",
                              style: w600_14Poppins(
                                color: AppColors.calendarIconColor,
                              ).copyWith(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                          Text(
                            AppString.privacy_intro,
                            style: w400_14Poppins(
                                color: Theme.of(context).disabledColor),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              "Disclaimer:",
                              style: w600_14Poppins(
                                color: AppColors.calendarIconColor,
                              ).copyWith(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                          Text(
                            AppString.privacy_disclaimer,
                            style: w400_14Poppins(
                                color: Theme.of(context).disabledColor),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              "CHANGE OR AMENDMENTS:",
                              style: w600_14Poppins(
                                color: AppColors.calendarIconColor,
                              ).copyWith(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                          Text(
                            AppString.privacy_ammemendments,
                            style: w400_14Poppins(
                                color: Theme.of(context).disabledColor),
                          ),
                        ],
                      )
                    ],
                  )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                "Privacy policy for Owomen ",
                                style: w600_14Poppins(
                                    color: AppColors.calendarIconColor),
                              ),
                            ),
    
    
                            const SizedBox(height: 5,),
                            Text(
                              AppString.terms_important,
                              style: w400_14Poppins(
                                  color: Theme.of(context).disabledColor),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                "REQUIRMENTS",
                                style: w600_14Poppins(
                                    color: AppColors.calendarIconColor),
                              ),
                            ),
                            Text(
                              AppString.requirments,
                              style: w400_14Poppins(
                                  color: Theme.of(context).disabledColor),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                "CLAUSE 1: YOUR PRIVACY",
                                style: w600_14Poppins(
                                    color: AppColors.calendarIconColor),
                              ),
                            ),
                            Text(
                              AppString.cluase1,
                              style: w400_14Poppins(
                                  color: Theme.of(context).disabledColor),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                "CLAUSE 2: USE OF THE SERVICE AND YOUR LIABILITIES",
                                style: w600_14Poppins(
                                    color: AppColors.calendarIconColor),
                              ),
                            ),
                            Text(
                              AppString.cluase2,
                              style: w400_14Poppins(
                                  color: Theme.of(context).disabledColor),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                "CLAUSE 3: LIMITATION ON USE",
                                style: w600_14Poppins(
                                    color: AppColors.calendarIconColor),
                              ),
                            ),
                            Text(
                              AppString.cluase3,
                              style: w400_14Poppins(
                                  color: Theme.of(context).disabledColor),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                "CLAUSE 4: YOUR CONTENT",
                                style: w600_14Poppins(
                                    color: AppColors.calendarIconColor),
                              ),
                            ),
                            Text(
                              AppString.cluase4,
                              style: w400_14Poppins(
                                  color: Theme.of(context).disabledColor),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                "CLAUSE 5: CODE OF CONDUCT",
                                style: w600_14Poppins(
                                    color: AppColors.calendarIconColor),
                              ),
                            ),
                            Text(
                              AppString.cluase5,
                              style: w400_14Poppins(
                                  color: Theme.of(context).disabledColor),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                "CLAUSE 6: ELIGIBILITY",
                                style: w600_14Poppins(
                                    color: AppColors.calendarIconColor),
                              ),
                            ),
                            Text(
                              AppString.cluase6,
                              style: w400_14Poppins(
                                  color: Theme.of(context).disabledColor),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                AppString.cluase62,
                                style: w600_14Poppins(
                                    color: AppColors.calendarIconColor),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                "CLAUSE 7: USE OF SERVICE AND SUPPORT",
                                style: w600_14Poppins(
                                    color: AppColors.calendarIconColor),
                              ),
                            ),
                            Text(
                              AppString.cluase7,
                              style: w400_14Poppins(
                                  color: Theme.of(context).disabledColor),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                "CLAUSE 8: ENFORCEMENT",
                                style: w600_14Poppins(
                                    color: AppColors.calendarIconColor),
                              ),
                            ),
                            Text(
                              AppString.cluase8,
                              style: w400_14Poppins(
                                  color: Theme.of(context).disabledColor),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                "CLAUSE 9: INDEMNITY AND REMEDIES",
                                style: w600_14Poppins(
                                    color: AppColors.calendarIconColor),
                              ),
                            ),
                            Text(
                              AppString.cluase9,
                              style: w400_14Poppins(
                                  color: Theme.of(context).disabledColor),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                "CLAUSE 10: LIMITATION OF LIABLITY",
                                style: w600_14Poppins(
                                    color: AppColors.calendarIconColor),
                              ),
                            ),
                            Text(
                              AppString.cluase10,
                              style: w400_14Poppins(
                                  color: Theme.of(context).disabledColor),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                "CLAUSE 11: CONFIDENTIALITY",
                                style: w600_14Poppins(
                                    color: AppColors.calendarIconColor),
                              ),
                            ),
                            Text(
                              AppString.cluase11,
                              style: w400_14Poppins(
                                  color: Theme.of(context).disabledColor),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                "CLAUSE 12: NO PARTNERSHIP OR AGENCY",
                                style: w600_14Poppins(
                                    color: AppColors.calendarIconColor),
                              ),
                            ),
                            Text(
                              AppString.cluase12,
                              style: w400_14Poppins(
                                  color: Theme.of(context).disabledColor),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                "CLAUSE 13: TERMINATION",
                                style: w600_14Poppins(
                                    color: AppColors.calendarIconColor),
                              ),
                            ),
                            Text(
                              AppString.cluase13,
                              style: w400_14Poppins(
                                  color: Theme.of(context).disabledColor),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                "CLAUSE 14: CHARGES AND PAYMENT TERMS",
                                style: w600_14Poppins(
                                    color: AppColors.calendarIconColor),
                              ),
                            ),
                            Text(
                              AppString.cluase14,
                              style: w400_14Poppins(
                                  color: Theme.of(context).disabledColor),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                "CLAUSE 15: Cancellation Subscription and Refund Amount",
                                style: w600_14Poppins(
                                    color: AppColors.calendarIconColor),
                              ),
                            ),
                            Text(
                              AppString.cluase15,
                              style: w400_14Poppins(
                                  color: Theme.of(context).disabledColor),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                "CLAUSE 16: WAIVER AND SEVERANCE",
                                style: w600_14Poppins(
                                    color: AppColors.calendarIconColor),
                              ),
                            ),
                            Text(
                              AppString.cluase16,
                              style: w400_14Poppins(
                                  color: Theme.of(context).disabledColor),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                "CLAUSE 17. INTELLECTUAL PROPERTY",
                                style: w600_14Poppins(
                                    color: AppColors.calendarIconColor),
                              ),
                            ),
                            Text(
                              AppString.cluase17,
                              style: w400_14Poppins(
                                  color: Theme.of(context).disabledColor),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                "CLAUSE 18: ENTIRE AGREEMENT",
                                style: w600_14Poppins(
                                    color: AppColors.calendarIconColor),
                              ),
                            ),
                            Text(
                              AppString.cluase18,
                              style: w400_14Poppins(
                                  color: Theme.of(context).disabledColor),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                "CLAUSE 19: AMENEMDNETS AND CHANGE",
                                style: w600_14Poppins(
                                    color: AppColors.calendarIconColor),
                              ),
                            ),
                            Text(
                              AppString.cluase19,
                              style: w400_14Poppins(
                                  color: Theme.of(context).disabledColor),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                "CLAUSE 20: LAW AND JURISDICTION",
                                style: w600_14Poppins(
                                    color: AppColors.calendarIconColor),
                              ),
                            ),
                            Text(
                              AppString.cluase20,
                              style: w400_14Poppins(
                                  color: Theme.of(context).disabledColor),
                            ),
                          ],
                        ),
                      ],
                    ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
    
            children: [
    
            
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 30),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(
                        ImagesUrl.backArrowIcon,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    HelperWidget().testMethodStartAlign(16.0, FontWeight.w500,
                        AppColors.textColorCycleInfo, appBarTitle)
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
