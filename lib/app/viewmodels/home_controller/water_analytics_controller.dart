import 'package:get/get.dart';
import 'package:o_woman/app/views/home/water_mag/sales_data.dart';

class WaterAnalyctisController extends GetxController{
  List<String> chooseCycle =["Jan-Feb","Feb-Mar","Mar-Apr","Apr-May","May-Jun","Jun-Jul","Jul-Aug","Aug-Sep","Sep-Oct","Oct-Nov","Nov-Dec"].obs;
   var selectedMonth = "Oct-Nov".obs;

     var salesData = [
    SalesData(1, 1),
    SalesData(2, 1.5),
    SalesData(3, 2),
    SalesData(4, 2.5),
    SalesData(5, 3),
    SalesData(6, 3.5),
    SalesData(7, 4),
    
  ].obs;



}