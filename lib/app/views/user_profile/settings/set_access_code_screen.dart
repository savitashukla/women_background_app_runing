import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/font_size.dart';
import 'package:o_woman/constants/images_url.dart';

class SetAccessCodeScreen extends StatefulWidget {
  const SetAccessCodeScreen({super.key});

  @override
  State<SetAccessCodeScreen> createState() => _SetAccessCodeScreenState();
}

class _SetAccessCodeScreenState extends State<SetAccessCodeScreen> {
  TextEditingController pinController = TextEditingController();
  bool showButtons = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackgroundColor,
        appBar: AppBar(
          centerTitle: false,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding:  EdgeInsets.all(12.0.sp),
                child: SvgPicture.asset(
                  ImagesUrl.backArrowIcon,
                  color: AppColors.blackColor.withOpacity(0.7),
                ),
              )),
          title: Text(
            "Set Access Code",
            style: w400_16Poppins(
              color: AppColors.blackColor.withOpacity(0.7),
            ),
          ),
        ),
        body: Padding(
          padding:  EdgeInsets.all(12.0.sp),
          child: Align(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                height50,
                Text(
                  "Code must contain at least 4 digits",
                  style: w400_14Poppins(),
                ),
                height20,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: TextFormField(
                    cursorColor: AppColors.blackColor,
                    keyboardType: TextInputType.phone,
                    controller: pinController,
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(4),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColors.buttonColor.withOpacity(0.5)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColors.buttonColor.withOpacity(0.5)),
                      ),
                    ),
                    onChanged: (value) {
                      showButtons = true;
                      setState(() {});
                    },
                  ),
                ),
                height20,
                showButtons
                    ? Padding(
                        padding:  EdgeInsets.all(12.0.sp),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "cancel",
                              style: w400_12Poppins(
                                  color: AppColors.buttonColor.withOpacity(0.5)),
                            ),
                            Text("Continue",
                                style:
                                    w400_12Poppins(color: AppColors.buttonColor))
                          ],
                        ),
                      )
                    : const SizedBox.shrink()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
