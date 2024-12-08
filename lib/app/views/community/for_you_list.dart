import 'package:flutter/material.dart';
import 'package:o_woman/constants/app_colors.dart';

class ForYouList extends StatelessWidget {
  const ForYouList({
    super.key,
    this.image,
    this.title,
    this.subTitle,
    this.time,

  });
  final String ?image;
  final String ?title;
  final String ?subTitle;
  final String ?time;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 275,
        decoration: BoxDecoration(
            color: AppColors.colorPrimary.withOpacity(0.3),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              Container(
                height: 160,
                width: 275,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
               child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                child: Image.network(image!,fit: BoxFit.fitWidth,)),
              ),
             const SizedBox(height: 10,),
    
             Padding(
               padding:  EdgeInsets.only(left: 15),
               child: Text(title!,style: TextStyle(color: AppColors.colorPrimaryTestDarkMore,fontSize: 14,fontWeight: FontWeight.w500),),
             ),
            
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                subTitle!,
                style: TextStyle(
                    color: AppColors.insightTextColor
                        .withOpacity(0.6),
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
            ),
              Padding(
                padding:
                  const EdgeInsets.only(top: 10, left: 15),
              child: Text(
                time!,
                style: TextStyle(
                  color: AppColors.insightTextColor
                      .withOpacity(0.6),
                  fontSize: 14,
                ),
              ),
            ),
    
                ],
              )
            );
  }
}
