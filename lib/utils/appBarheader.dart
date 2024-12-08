import 'package:flutter/material.dart';
import 'package:o_woman/constants/app_colors.dart';

class AppBarHeader extends StatelessWidget {
  const AppBarHeader({
    super.key,
    required this.title,
    this.trailing = "",
  });

  final String title;
  final String? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: AppColors.colorPrimaryTestDarkMore,
              )),
          Text(
            title,
            style: const TextStyle(
                color: AppColors.colorPrimaryTestDarkMore,
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              trailing!,
              style: const TextStyle(
                  color: AppColors.textColorCycleInfoMore,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ),
          
        ],
      ),
    );
  }
}
