import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:o_woman/app/routes/routes.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/font_size.dart';
import 'package:o_woman/constants/images_url.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
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
                child: SvgPicture.asset(ImagesUrl.backArrowIcon,color: AppColors.blackColor,),
              )),
          title: Text(
            "History",
            style: w500_16Poppins(
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.all(12.0.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "11-10-2023, Thursday, 8:22pm",
                  style: w400_14Poppins(color: AppColors.textBlueColor),
                ),
               height10,
                contactsliCard(context),
                height10,
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: AppColors.whiteColor),
                  child: Padding(
                    padding:  EdgeInsets.all(12.0.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Location",
                          style: w400_14Poppins(color: AppColors.textBlueColor),
                        ),
                        const Text(
                            "Plot no:852, Sector: 9, Hi-tech City Rd, HUDA Techno Enclave, Madhapur, Hyderabad, Telangana 500081, INDIA")
                      ],
                    ),
                  ),
                ),
                height10,
                Text(
                  "11-10-2023, Thursday, 8:22pm",
                  style: w400_14Poppins(color: AppColors.textBlueColor),
                ),
                height10,
                contactsliCard(context),
               height10,
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: AppColors.whiteColor),
                  child: Padding(
                    padding:  EdgeInsets.all(12.0.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Location",
                          style: w400_14Poppins(color: AppColors.textBlueColor),
                        ),
                        const Text(
                            "Plot no:852, Sector: 9, Hi-tech City Rd, HUDA Techno Enclave, Madhapur, Hyderabad, Telangana 500081, INDIA")
                      ],
                    ),
                  ),
                )
              ],
            ),
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
];
Widget contactsliCard(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.32,
    decoration: BoxDecoration(
        color: AppColors.whiteColor, borderRadius: BorderRadius.circular(16.r)),
    child: Padding(
      padding:  EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:  EdgeInsets.all(8.0.sp),
            child: Text(
              "Emergency Contacts",
              style: w400_14Poppins(color: AppColors.textBlueColor),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: ListView.separated(
                  itemCount: contactsList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        contactsList[index].name,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      leading: const CircleAvatar(child: Icon(Icons.person)),
                      // trailing: Text(contactsList[index].id),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(
                        thickness: 0.5,
                      )),
            ),
          ),
        ],
      ),
    ),
  );
}
