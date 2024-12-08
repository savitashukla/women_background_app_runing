import 'package:get/get.dart';

class NotesControllers extends GetxController
{

 List<String> notesFilterName=["Today","yesterday","last week","last month","last 2 month","last 3 month","last 6 month","Custom Date","Custom Range"];


 RxBool customDateSelect =false.obs;
 RxMap<dynamic,dynamic> selectedDateRange={}.obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}