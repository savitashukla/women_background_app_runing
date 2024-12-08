import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:o_woman/app/viewmodels/insight_notification_controller.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/utils/appBarheader.dart';

class InsightNotification extends StatelessWidget {
   InsightNotification({super.key});
  InsightNotificationController controller = Get.put(InsightNotificationController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
             
            const SizedBox(height: 15),
            const AppBarHeader(
              title: "Notification",
            ),
            Expanded(
            child:  ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.only(left: 15, top: 10, right: 15),
                    child: GestureDetector(
                      onTap: (){
                        controller.colorChange(index);
                      },
                      child: Obx(() => Container(
                          //height: 200,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: controller.colorIndex.value == index? AppColors.appBarColor1:Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 15, top: 12),
                                child: Text(
                                  'Introducing pregnancy tracking',
                                  style: TextStyle(
                                      color: AppColors.colorPrimaryTestDarkMore,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  'It is time to understand a menstruating girl is as beautiful as a pregnant lady.....',
                                  style: TextStyle(
                                      color: AppColors.insightTextColor.withOpacity(0.5),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 10, left: 15,bottom: 15),
                                child: Text(
                                  'Have a look',
                                  style: TextStyle(
                                    color: AppColors.mainColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ));
              }),
            
          ),
          
          ],
        ),
      ),
    );
  }
}