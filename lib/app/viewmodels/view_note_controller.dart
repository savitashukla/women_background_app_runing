import 'package:get/get.dart';

class ViewNoteController extends GetxController {
  RxString imageValue =
      "https://images.pexels.com/photos/2253879/pexels-photo-2253879.jpeg".obs;
  RxList<String> images = [
    'https://www.shutterstock.com/image-photo/portrait-happy-indian-asian-young-260nw-1833243328.jpg',
    "https://st.depositphotos.com/1001001/3958/i/450/depositphotos_39582193-stock-photo-family-vacation-portrait.jpg",
    'https://hips.hearstapps.com/hmg-prod/images/family-quotes-1573234196.jpg?crop=1xw:0.84375xh;center,top&resize=1200:*'
  ].obs;
}
