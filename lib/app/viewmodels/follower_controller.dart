import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FollowerController extends GetxController  with GetSingleTickerProviderStateMixin{
 final List<Tab> myTabs = <Tab>[
    const Tab(text: '223 Followers'),
    const Tab(text: '358 Following'),
  ];

  late TabController tabController;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}