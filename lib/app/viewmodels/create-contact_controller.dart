import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateContactController extends GetxController{
  TextEditingController nameController = TextEditingController();
   TextEditingController phnController = TextEditingController();
   var imagePicker="".obs;
  final kGradientBoxDecoration = const BoxDecoration(
    shape: BoxShape.circle,
    gradient: LinearGradient(colors: [Color(0xff9DA4FB), Color(0xffF496C4)]),
  );

  final kInnerDecoration = const BoxDecoration(
    shape: BoxShape.circle,
    color: Colors.white,
  );
}