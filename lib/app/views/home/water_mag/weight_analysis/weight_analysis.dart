import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:o_woman/app/views/home/water_mag/sales_data.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/images_url.dart';
import 'package:o_woman/utils/appBarheader.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../viewmodels/home_controller/weight_analysisController.dart';

class WeightAnalysis extends StatelessWidget {
  WeightAnalysis({super.key});
  WeightAnalysisController controller = Get.put(WeightAnalysisController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homeBgColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
            AppBarHeader(
            title: "Weight Analysis",
            trailing: DateFormat("dd MMMM yyyy").format(DateTime.now()),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Current Weight',
                      style: TextStyle(
                          color: AppColors.colorPrimaryTestDarkMore,
                          fontSize: 13,
                          fontWeight: FontWeight.w400),
                    ),
                    Container(
                      height: 40,
                      width: 120,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: AppColors.containerBorderC, width: 1),
                      ),
                       child: Obx(
                            () => DropdownButtonHideUnderline(
                              child: DropdownButton2<String>(
                                isExpanded: true,
                                items: controller.weightList
                                    .map((String item) =>
                                        DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.textColorCycleInfo,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ))
                                    .toList(),
                                value: controller.currentWeight.value,
                                onChanged: (String? value) {
                                 controller.currentWeight.value = value!;
                                },
                                buttonStyleData: ButtonStyleData(
                                  height: 50,
                                  width: 160,
                                  padding: const EdgeInsets.only(
                                      left: 14, right: 14),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: Colors.white,
                                  ),
                                ),
                                iconStyleData:  IconStyleData(
                                  icon: SvgPicture.asset(ImagesUrl.downArrow),
                                  iconSize: 13,
                                ),
                                dropdownStyleData: DropdownStyleData(
                                  maxHeight: 200,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: Colors.white,
                                  ),
                                  offset: const Offset(0, -5),
                                  scrollbarTheme: ScrollbarThemeData(
                                    radius: const Radius.circular(40),
                                    thickness:
                                        MaterialStateProperty.all<double>(3),
                                    thumbVisibility:
                                        MaterialStateProperty.all<bool>(true),
                                  ),
                                ),
                                menuItemStyleData: const MenuItemStyleData(
                                  height: 40,
                                  padding: EdgeInsets.only(left: 14, right: 14),
                                ),
                              ),
                            ),
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Choose one cycle',
                      style: TextStyle(
                          color: AppColors.colorPrimaryTestDarkMore,
                          fontSize: 13,
                          fontWeight: FontWeight.w400),
                    ),
                    Container(
                      height: 40,
                      width: 120,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: AppColors.containerBorderC, width: 1),
                      ),
                       child: Obx(
                            () => DropdownButtonHideUnderline(
                              child: DropdownButton2<String>(
                                isExpanded: true,
                                items: controller.chooseCycle
                                    .map((String item) =>
                                        DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.textColorCycleInfo,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ))
                                    .toList(),
                                value: controller.selectedMonth.value,
                                onChanged: (String? value) {
                                  controller.selectedMonth.value = value!;
                                },
                                buttonStyleData: ButtonStyleData(
                                  height: 50,
                                  width: 120,
                                  padding: const EdgeInsets.only(
                                      left: 14, right: 14),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: Colors.white,
                                  ),
                                ),
                                iconStyleData:  IconStyleData(
                                  icon: SvgPicture.asset(ImagesUrl.downArrow),
                                  iconSize: 13,
                                ),
                                dropdownStyleData: DropdownStyleData(
                                  maxHeight: 200,
                                  width: 250,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: Colors.white,
                                  ),
                                  offset: const Offset(0, 10),
                                  scrollbarTheme: ScrollbarThemeData(
                                    radius: const Radius.circular(40),
                                    thickness:
                                        MaterialStateProperty.all<double>(3),
                                    thumbVisibility:
                                        MaterialStateProperty.all<bool>(true),
                                  ),
                                ),
                                menuItemStyleData: const MenuItemStyleData(
                                  height: 40,
                                  padding: EdgeInsets.only(left: 14, right: 14),
                                ),
                              ),
                            ),
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 12, right: 12),
            child: Row(
              children: [
                Text(
                  'Changes during cycle',
                  style: TextStyle(
                      color: AppColors.colorPrimaryTestDarkMore,
                      fontSize: 13,
                      fontWeight: FontWeight.w400),
                ),
                Spacer(),
                Row(
                  children: [
                    Text(
                      '+2.2',
                      style: TextStyle(
                          color: AppColors.colorPrimaryTestDarkMore,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'kg',
                      style: TextStyle(
                          color: AppColors.colorPrimaryTestDarkMore,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Obx(
            () => Container(
              width: 400,
              child: SfCartesianChart(
               primaryXAxis: CategoryAxis(
                majorTickLines: MajorTickLines(size: 0),
               ),
                primaryYAxis: NumericAxis(
                  labelFormat: '{value}L',
                ),
                series: <CartesianSeries>[
                  StackedLineSeries<SalesData, int>(
                    color: AppColors.darkPinkColor,
                    dataSource: controller.salesData.value,
                    markerSettings: const MarkerSettings(
                      color: AppColors.darkPinkColor,
                      isVisible: true,
                    ),
                    xValueMapper: (SalesData sales, _) => sales.month,
                    yValueMapper: (SalesData sales, _) => sales.sales1,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
