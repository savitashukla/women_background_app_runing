import 'package:get/get.dart';

class BeSafeController extends GetxController {
  RxBool panicModeButton = false.obs;
  RxBool radiusMonitoring = false.obs;

  RxBool notesTravel = false.obs;
  RxBool loveTravel = false.obs;
  RxBool natureTravel = false.obs;
  RxBool photographTravel = false.obs;
  RxBool friendsTravel = false.obs;
  RxBool empowermentTravel = false.obs;
  RxBool foodTravel = false.obs;
  RxString imagePicker = "".obs;
  RxBool editNotes = false.obs;
}
