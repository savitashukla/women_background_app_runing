import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:o_woman/constants/app_colors.dart';

import '../../../../../constants/font_size.dart';
import '../../../../routes/routes.dart';

class BackToLoginWidget extends StatelessWidget {
  const BackToLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Back to ',
          style: TextStyle(fontSize: 14.sp, color: AppColors.mainColor),
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamedAndRemoveUntil(
                context, Routes.login, (route) => false);
          },
          child:
              Text("Login", style: w400_14Poppins(color: AppColors.mainColor)),
        )
      ],
    );
  }
}
