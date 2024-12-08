import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/font_size.dart';
import 'package:o_woman/constants/images_url.dart';

class settingsWidget extends StatelessWidget {
  settingsWidget(
      {super.key,
      required this.title,
      required this.imgString,
      this.onTap,
      required this.bgColor});

  final String title;
  final Color bgColor;
  final String imgString;
  VoidCallback? onTap;

  @override
  Widget build(
    BuildContext context,
  ) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.065,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: AppColors.whiteColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        color: bgColor),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SvgPicture.asset(imgString),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    title,
                    style: w400_14Poppins(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: SvgPicture.asset(
                ImagesUrl.forwardIcon,
                height: 18,
                width: 18,
                color: AppColors.mainColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
