import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:o_woman/app/routes/routes.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/font_size.dart';
import 'package:o_woman/constants/images_url.dart';

class ContactListViewScreen extends StatefulWidget {
  const ContactListViewScreen({super.key});

  @override
  State<ContactListViewScreen> createState() => _ContactListViewScreenState();
}

class _ContactListViewScreenState extends State<ContactListViewScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackgroundColor,
        appBar: AppBar(
          centerTitle: false,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding:  EdgeInsets.all(12.0.sp),
                child: SvgPicture.asset(ImagesUrl.backArrowIcon),
              )),
          title: Text(
            "Contact list",
            style: w400_16Poppins(
              color: AppColors.textBlueColor,
            ),
          ),
          actions: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, Routes.historyScreen);
              },
              child: Padding(
                padding:  EdgeInsets.all(8.0.sp),
                child: Text(
                  "History",
                  style: w500_14Poppins(color: AppColors.textColor),
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              contactsliCard(context),
            ],
          ),
        ),
      ),
    );
  }
}

class contacts {
  String name;
  String id;

  contacts({required this.name, required this.id});
}

List contactsList = [
  contacts(name: "Anu", id: "122"),
  contacts(name: "Anju", id: "122"),
  contacts(name: "Archana", id: "122"),
  contacts(name: "Anu", id: "122"),
  contacts(name: "Anju", id: "122"),
  contacts(name: "Archana", id: "122"),
];
Widget contactsliCard(BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.pushNamed(context, Routes.contactListViewScreen);
    },
    child: Container(
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
          // color: AppColors.whiteColor, borderRadius: BorderRadius.circular(16)
          ),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 5.w),
        child: ListView.separated(
            itemCount: contactsList.length,
            itemBuilder: (context, index) {
              return Container(
                color: AppColors.whiteColor,
                child: ListTile(
                    title: Text(
                      contactsList[index].name,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    leading: const CircleAvatar(child: Icon(Icons.person)),
                    trailing: Wrap(
                      children: [
                        SvgPicture.asset(
                          ImagesUrl.editIcon,
                          height: 16.h,
                          width: 16.w,
                          color: AppColors.buttonColor,
                        ),
                        width15,
                        SvgPicture.asset(ImagesUrl.binIcon,
                            height: 16.h,
                            width: 16.w,
                            color: AppColors.buttonColor),
                      ],
                    )),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                height5,),
      ),
    ),
  );
}
