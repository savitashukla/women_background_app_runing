import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:o_woman/app/viewmodels/save_insights.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/utils/appBarheader.dart';
import 'package:o_woman/utils/helper_widgets/helper_widgets.dart';

class SaveInsights extends StatelessWidget {
  SaveInsights({super.key});

  SaveInsightsController controller = Get.put(SaveInsightsController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.homeBgColor,
        body: Column(
          children: [
           
            const SizedBox(height: 15),
            const AppBarHeader(
              title: "Saved Insights",
            ),
          
          Expanded(
            child: ListView.builder(
            shrinkWrap: true,
            itemCount: 4,
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                  padding: const EdgeInsets.only(left: 15, top: 10, right: 15),
                  child: Container(
                    //height: 200,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          child: Container(
                            height: 180,
                            width: MediaQuery.of(context).size.width,
                            child: Image.network(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSONav3Bs8tlsS1BPyAGvkzNVIzCgE1eZj9Q&usqp=CAU',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 15, top: 12),
                          child: Text(
                            'Importance of healthy food',
                            style: TextStyle(
                                color: AppColors.colorPrimaryTestDarkMore,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            'It is time to understanda menstruating girl is as beautiful as a pregnant lady.',
                            style: TextStyle(
                                color: AppColors.insightTextColor.withOpacity(0.6),
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 15,bottom: 15),
                          child: Text(
                            '2 min Read',
                            style: TextStyle(
                              color: AppColors.insightTextColor.withOpacity(0.6),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
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
