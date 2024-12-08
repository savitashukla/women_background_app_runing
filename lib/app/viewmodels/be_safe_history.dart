import 'package:get/get.dart';

class BeSafeHistory extends GetxController {
  RxBool panicToggle = true.obs;
  RxBool regularradiusToggle = true.obs;
  RxBool autoOnToggle = true.obs;
  var selectedValue = RxString('');
  var selectedValue2 = RxString('');
  var selectedValue3 = RxString('');

  void onValueChanged(String value) {
    selectedValue.value = value;
  }

  void onValueChanged2(String value) {
    selectedValue2.value = value;
  }

  void onValueChanged3(String value) {
    selectedValue3.value = value;
  }
}
