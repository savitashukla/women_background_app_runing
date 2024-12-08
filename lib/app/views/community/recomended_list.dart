import 'package:flutter/material.dart';
import 'package:o_woman/app/routes/routes.dart';
import 'package:o_woman/constants/app_colors.dart';

class RecomendedList extends StatelessWidget {
  const RecomendedList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
          shrinkWrap: true,
          itemCount: 4,
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 12,right: 12,bottom: 6),
              child: GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, Routes.followerscreen);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6)),
                  child: Row(
                    children: [
                      //1st Colunm
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 70,
                              width: 117,
                              child: Image.asset("assets/images/morning.png"),
                            ),
                          ],
                        ),
                      ),
                      //2nd Colunm
                      Expanded(
                        flex: 4,
                        child: Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 15),
                                child: Container(
                                  width: 220,
                                  child: const Text(
                                    "Health is not valued until sickness come.",
                                    style: TextStyle(
                                        color: AppColors
                                            .colorPrimaryTestDarkMore,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 15),
                                child: Text(
                                  "2 min",
                                  style: TextStyle(
                                      color: AppColors
                                          .colorPrimaryTestDarkMore
                                          .withOpacity(0.5),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
    
  }
}
