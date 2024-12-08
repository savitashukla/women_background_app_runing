import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class CalendarController extends GetxController {
  var isMonthStatus = true.obs;
  var isYearStatus = false.obs;
  late ItemScrollController yearScrollController = ItemScrollController();
  final ItemScrollController allYearShowList = ItemScrollController();

  int futureYears = 1;

  var initialIndex = (DateTime.now().year - 1970) * 12 + DateTime.now().month-1;

  int allYearListInitial = (DateTime.now().year) - 1970;

  late int allYearCount;

  var applyFutureDe = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit

    allYearCount = (DateTime.now().year - 1970) + 1 + futureYears;

    super.onInit();
  }
}
