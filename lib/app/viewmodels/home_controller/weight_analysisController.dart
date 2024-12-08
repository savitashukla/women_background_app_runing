import 'package:get/get.dart';
import 'package:o_woman/app/views/home/water_mag/sales_data.dart';

class WeightAnalysisController extends GetxController{
   List<String> weightList =["40 kg","41 kg","42 kg","43 kg","44 kg","45 kg","46 kg","47 kg","48 kg","49 kg","50 kg","51 kg","52 kg","53 kg","54 kg","55 kg"].obs;
   var currentWeight = "45 kg".obs;
  
    var chooseCycle =["Jan-Feb","Feb-Mar","Mar-Apr","Apr-May","May-Jun","Jun-Jul","Jul-Aug","Aug-Sep","Sep-Oct","Oct-Nov","Nov-Dec"].obs;
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