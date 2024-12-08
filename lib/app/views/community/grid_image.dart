import 'package:flutter/material.dart';
import 'package:o_woman/constants/app_colors.dart';

class GridImage extends StatelessWidget {
  const GridImage({
  super.key,
  required  this.grid1stText,
  required  this.grid2ndText,
  required  this.grid3rdText,
  required  this.grid4thText,
  });

  final String grid1stText;
   final String grid3rdText;
    final String grid4thText;
     final String grid2ndText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
        //1st Column
          Column(
            children: [
              Container(
                width: 155,
                decoration: BoxDecoration(
                  color: AppColors.insightGrid1stColor,
                  borderRadius: BorderRadius.circular(10)
                ),
                child:  Column(
                  children: [
                    const SizedBox(height: 12,),
                    Text(grid1stText,style: TextStyle(color: AppColors.insightGrid1stText,fontSize: 14,fontWeight: FontWeight.w400),),
                  Image.asset("assets/images/girlimage.png")
                  ],
                ),
              ),
              const SizedBox(height: 10,),
               Container(
                width:  155,
                decoration: BoxDecoration(
                  color: AppColors.insightGrid2ndColor,
                  borderRadius: BorderRadius.circular(10)
                ),
                  child:  Column(
                  children: [
                    const SizedBox(height: 12,),
                    Text(grid2ndText,style: TextStyle(color: AppColors.insightGri4thText,fontSize: 14,fontWeight: FontWeight.w400),),
                  Image.asset("assets/images/yogaimage.png")
                  ],
                ),
              ),
            ],
          ),
        //2nd Colunm
    
           Column(
             children: [
               Container(
                 width: 155,
                 decoration: BoxDecoration(
                   color: AppColors.insightGrid3rdColor,
                   borderRadius: BorderRadius.circular(10)
                 ),
                  child: Column(
                  children: [
                    const SizedBox(height: 12,),
                     Text(grid3rdText,style: TextStyle(color: AppColors.insightGrid3rdText,fontSize: 14,fontWeight: FontWeight.w400),),
                 Image.asset("assets/images/heartimage.png")
                  ],
                ),
               ),
               SizedBox(height: 10,),
                Container(
                height: 204 ,
                 width:  155,
                 decoration: BoxDecoration(
                   color: AppColors.insightGrid4thColor,
                   borderRadius: BorderRadius.circular(10)
                 ),
                  child: Column(
                  children: [
                    const SizedBox(height: 12,),
                     Text(grid4thText,style: TextStyle(color: AppColors.insightGrid3rdText,fontSize: 14,fontWeight: FontWeight.w400),),
                    Image.asset("assets/images/yogabig.png",height: 150,)
                  ],
                ),
               ),
             ],
           ),
        ],
      ),
    );
  }
}