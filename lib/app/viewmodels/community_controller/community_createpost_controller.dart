import 'package:get/get.dart';

class CommunityProfileController extends GetxController {
  RxBool anonymousPost = false.obs;
  var imagePicker = "".obs;
  RxBool isTapped = false.obs;
  RxBool isNotLiked = true.obs;
  RxBool isNotCopied = true.obs;
  RxBool isTappedNo = false.obs;

  void isPostLiked() {
    isNotLiked.value = !isNotLiked.value;
    print(isNotLiked.value);
  }
  void isPostCopied(){
    isNotCopied.value =! isNotCopied.value; 
  }
}
