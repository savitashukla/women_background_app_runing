import 'package:flutter/material.dart';
import 'package:o_woman/constants/app_colors.dart';

class YouMayLike extends StatelessWidget {
  const YouMayLike({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 250,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                          height: 150,
                          width: 180,
                          child: Image.asset(
                            "assets/images/likeimage.png",
                            fit: BoxFit.fill,
                          )),
                        const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'Health is not valued until the sickness come',
                          style: TextStyle(
                              color: AppColors.colorPrimaryTestDarkMore,
                              fontWeight: FontWeight.w400,
                              fontSize: 12),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                        ),
                      ),
                    ],
                  ),
                ));
          }),
    );
  }
}
