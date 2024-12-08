import 'package:get/get.dart';

class InsightController extends GetxController {
  RxInt dataIndex = 0.obs;

  void listIndex(int index) {
    dataIndex.value = index;
  }

  List<String> communityList = [
    "Treanding",
    "Mensutral Cycle",
    "Hornamal Health",
    "Reproductive Health",
    "Mental Health",
    "Menopause",
    "Health Education",
    "Sexual Health",
    "Nutration & Fitness",
    "Breast Health",
    "Gynecologial Health",
    "Sleep Energy",
    "Skin & hair care",
    "Wellness&SelfCare"
  ].obs;

  
}
