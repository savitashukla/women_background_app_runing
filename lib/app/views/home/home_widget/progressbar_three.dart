import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../../progress_bar/simple_circular_progress.dart';

class ProgressBarThree extends StatelessWidget {
  ProgressBarThree({super.key});

  ValueNotifier<double> cycleLength = ValueNotifier(90);
  ValueNotifier<double> periodLength = ValueNotifier(90);
  ValueNotifier<double> variationLength = ValueNotifier(90);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 100,
          width: 100,
          child: SimpleCircularProgressBar(
            valueNotifier: variationLength,
            progressColors: const [AppColors.avgCycleDayProgressBarFull3],
            backColor: AppColors.avgCycleDayProgressBarEmpty3,
            fullProgressColor: AppColors.avgCycleDayProgressBarFull3,
            mergeMode: true,
          ),
        ),
        SizedBox(
          height: 100,
          width: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 75,
                width: 75,
                child: SimpleCircularProgressBar(
                  valueNotifier: periodLength,
                  progressColors: const [AppColors.avgCycleDayProgressBarFull2],
                  backColor: AppColors.avgCycleDayProgressBarEmpty2,
                  fullProgressColor: AppColors.avgCycleDayProgressBarFull2,
                  mergeMode: true,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 100,
          width: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 45,
                width: 45,
                child: Center(
                  child: SimpleCircularProgressBar(
                    valueNotifier: cycleLength,
                    progressColors: const [
                      AppColors.avgCycleDayProgressBarFull
                    ],
                    backColor: AppColors.avgCycleDayProgressBarEmpty,
                    fullProgressColor: AppColors.avgCycleDayProgressBarFull,
                    mergeMode: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
