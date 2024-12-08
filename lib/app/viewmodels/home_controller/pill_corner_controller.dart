import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PillCornerController extends GetxController {
  RxList<String> contraceptiveList = [
    "Oral Contraceptive",
    "Contraceptive Injection",
    "IUD",
    "Contraceptive Path",
    "Implant",
  ].obs;

  RxList<RxBool>? selectedContraceptiveItems;

  RxList<String> supplementsList = [
    "Vitamin A",
    "Vitamin B",
    "Vitamin C",
    "Vitamin D",
    "Vitamin B12",
    "Multi Vitamin",
    "Zinc",
    "Collagen",
    "Calcium",
    "Omega 3",
    "Ashwagandha"
  ].obs;

  RxList<RxBool>? selectedsupplementsItems;

  RxBool seeReminiderToggle = false.obs;
  RxBool loggedPills = false.obs;
  RxBool loggedPill1 = true.obs;
  RxBool loggedPill2 = false.obs;
  List<String> doseList = ["1", "2", "3", "4", "5"].obs;
  RxString dosevalue = "2".obs;
  var durationStart1Hours = 7.obs;
  var durationStart1Minutes = 30.obs;
  var durationEndHours = 7.obs;
  var durationEndMinutes = 30.obs;
  RxBool pillShape1 = false.obs;
  RxBool pillShape2 = false.obs;
  RxBool pillShape3 = false.obs;
  RxBool pillShape4 = false.obs;
  var pillNameController = TextEditingController().obs;
  var desccriptionController = TextEditingController().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    selectedContraceptiveItems =
        RxList.generate(contraceptiveList.length, (index) => false.obs);
    selectedsupplementsItems =
        RxList.generate(supplementsList.length, (index) => false.obs);
  }
}
