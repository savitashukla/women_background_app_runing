import 'package:get/get.dart';

class InsightNotificationController extends GetxController{
  RxInt colorIndex = 0.obs;

  void colorChange(int index){
  colorIndex.value = index;
  }
}