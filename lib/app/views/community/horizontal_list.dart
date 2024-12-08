import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:o_woman/app/routes/routes.dart';
import 'package:o_woman/app/viewmodels/insightController.dart';
import 'package:o_woman/app/views/community/save_insights/save_insights.dart';
import 'package:o_woman/constants/app_colors.dart';

class HorizontalList extends StatelessWidget {
   HorizontalList({super.key});
InsightController controller = Get.put(InsightController());
  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
            child: Row(
              children: [
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width/1.2,
                  child: Obx(() => ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.communityList.length,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context,index){
                      return Padding(
                        padding:  EdgeInsets.all(8.0),
                        child: GestureDetector(
                        onTap: (){
                        controller.listIndex(index);
                          },
                          child: Obx(() =>  Container(
                              decoration: BoxDecoration(
                                color: controller.dataIndex.value == index?AppColors.colorPrimary.withOpacity(0.3):Colors.transparent,
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(color: controller.dataIndex.value == index?Colors.transparent:AppColors.colorPrimary.withOpacity(0.3)),
                              ),
                              child: Center(
                                child: Padding(
                                padding: const EdgeInsets.only(left: 10,right: 10),
                                child: Text(controller.communityList[index].toString(),style: const TextStyle(color: AppColors.colorPrimaryTestDarkMore,fontSize: 12,fontWeight: FontWeight.w400),),
                              )),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, Routes.saveInsights);
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: AppColors.appBarColor1,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: const Icon(Icons.copy,color: Colors.white,),
                  ),
                )
              ],
            ),
          );
  }
}