import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/images_url.dart';
import '../../../utils/helper_widgets/commen_list_container.dart';
import '../../../utils/helper_widgets/helper_widgets.dart';
import '../../routes/routes.dart';
import '../user_profile/settings/settings_main_screen.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            CommonListContainer(
              onTap: () {
                  Navigator.pushNamed(context, Routes.cycleHistoryScreen);
              },
              bgColor: AppColors.purpleBackgroundColor,
              imgString: ImagesUrl.cycleHistoryIcon,
              title: "Cycle History",
            ),
            const SizedBox(
              height: 15,
            ),
            CommonListContainer(
              onTap: () {
                Navigator.pushNamed(context, Routes.cycleSummary);

                //Navigator.pushNamed(context, Routes.notificationsScreen);
              },
              bgColor: AppColors.greenBackgroundColor,
              imgString: ImagesUrl.myCycleSummaryIcon,
              title: "My Cycle Summary",
            ),
            const SizedBox(
              height: 15,
            ),
            CommonListContainer(
              onTap: () {
                Navigator.pushNamed(context, Routes.waterAnalytics);
              },
              bgColor: AppColors.maroonBackgroundColor,
              imgString: ImagesUrl.waterAnalysisIcon,
              title: "Water Analysis",
            ),
            const SizedBox(
              height: 15,
            ),
            CommonListContainer(
              onTap: () {
                Navigator.pushNamed(context, Routes.weightAnalysis);
              },
              bgColor: AppColors.cyanBackgroundColor,
              imgString: ImagesUrl.weightAnalysisIcon,
              title: "Weight Analysis",
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
