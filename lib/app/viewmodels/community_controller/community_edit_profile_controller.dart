import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommunityProfileEditController extends GetxController {
  final formKey = GlobalKey<FormState>();
  var imagePicker = "".obs;
  final kGradientBoxDecoration = const BoxDecoration(
    shape: BoxShape.circle,
    gradient: LinearGradient(colors: [Color(0xff9DA4FB), Color(0xffF496C4)]),
  );

  final kInnerDecoration = const BoxDecoration(
    shape: BoxShape.circle,
    color: Colors.white,
  );
  RxList<TextEditingController> questions = <TextEditingController>[].obs;

  @override
  void onInit() {
    questions.addAll([TextEditingController(), TextEditingController()]);
    super.onInit();
  }
 void removeItem(int index) {
    if (index >= 0 && index < questions.length) {
      questions.removeAt(index);
    }
  }
  
  // void disposeList() {
  //   print('Dispose method called');
  //   for (var i = 0; i < items.length; i++) {
  //     items[i].dispose();
  //   }
  // }

  onAdd() {
    questions.add(TextEditingController());
    update();
  }
}
