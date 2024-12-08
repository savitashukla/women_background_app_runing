import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:o_woman/app/routes/routes.dart';
import 'package:o_woman/app/viewmodels/add_contacts_controller.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/utils/appBarheader.dart';
import 'package:o_woman/utils/helper_widgets/helper_widgets.dart';

class AddContactsScreen extends StatefulWidget {
   AddContactsScreen({super.key});

  @override
  State<AddContactsScreen> createState() => _AddContactsScreenState();
}

class _AddContactsScreenState extends State<AddContactsScreen> {
AddContactsScreenController controller = Get.put(AddContactsScreenController());

@override
  void initState() {
    controller.getContactPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     print(controller.contacts.length.toString());
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.homeBgColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          
            const AppBarHeader(
              title: "Add List",
            ),
          Expanded(
            child: Obx(() =>controller.isLoading.value?
            const Center(child: CircularProgressIndicator(),)
             :controller.contacts.length!=null && controller.contacts.isNotEmpty?
             ListView.builder(
              itemCount: controller.contacts.length,
              shrinkWrap: true,
              padding:  EdgeInsets.all(0.sp),
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context,index){
                return controller.contacts[index].givenName!=null && controller.contacts[index].givenName!.isNotEmpty?Padding(
                  padding:  EdgeInsets.all(8.0.sp),
                  child: Container(
                  height: 40.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.r),
                        child: CircleAvatar(
                          child: controller.contacts[index].givenName!=null && controller.contacts[index].givenName!.isNotEmpty?Text(controller.contacts[index].givenName![0],style: TextStyle(fontSize: 18,color: Colors.primaries[Random().nextInt(Colors.primaries.length)]),):IgnorePointer()
                        ),
                      ),
                      controller.contacts[index].givenName!=null 
                      && controller.contacts[index].givenName!.isNotEmpty? 
                      Padding(
                        padding:  EdgeInsets.only(left: 15.w),
                        child: Text(controller.contacts[index].givenName.toString(),style: TextStyle(color: AppColors.colorPrimaryTestDarkMore,fontSize: 14),),
                      ):const Text('')
                    ],
                  ),
                  ),
                ):IgnorePointer();
              }):const Center(child: Text('No Contacts availiable at this moment'))),
          )
         
          ],
        ),
      ),
    );
  }
}


