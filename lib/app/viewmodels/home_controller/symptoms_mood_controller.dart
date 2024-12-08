import 'package:get/get.dart';
import 'package:o_woman/constants/images_url.dart';

class SymptomsAndMoodController extends GetxController {
  RxList<String> menutrualFlowList = [
    "Light",
    "Moderate",
    "Heavy",
  ].obs;
  RxList<String> menutrualFlowImagesList = [
    ImagesUrl.lightIcon,
    ImagesUrl.moderateIcon,
    ImagesUrl.heavyIcon,
  ].obs;
  RxList<RxBool>? selectedMenusrualFlowItems;

  RxList<String> gutHealthList = [
    "Nausea",
    "Bloating",
    "Constipation",
  ].obs;
  RxList<String> gutHealthImagesList = [
    ImagesUrl.nauseaIcon,
    ImagesUrl.constipationIcon,
    ImagesUrl.bloatingIcon,
  ].obs;
  RxList<RxBool>? selectedgutHealthListItems;

  RxList<String> mucusMonitoringList =
      ["Sticky", "Creamy", "Watery", "No Discharge", "Egg White"].obs;
  RxList<String> mucusMonitoringImagesList = [
    ImagesUrl.stickyIcon,
    ImagesUrl.creamyIcon,
    ImagesUrl.wateryIcon,
    ImagesUrl.noDischargeIcon,
    ImagesUrl.eggWhiteIcon,
  ].obs;
  RxList<RxBool>? selectedmucusMonitoringItems;

  RxList<String> sexAndSexDriveList = [
    "Unprotected Sex",
    "Didn't have sex",
    "Protected Sex",
  ].obs;
  RxList<String> sexAndSexDriveImagesList = [
    ImagesUrl.unptotectedSexIcon,
    ImagesUrl.didntHaveSexIcon,
    ImagesUrl.protectedSexIcon,
  ].obs;
  RxList<RxBool>? selectedsexAndSexDriveItems;

  RxList<String> ovulationtestList = [
    "Didn't take test",
    "Ovulation: My Method",
    "Test: Positive",
    "Test: Negative"
  ].obs;
  RxList<String> ovulationtestImagesList = [
    ImagesUrl.didntTakeTestIcon,
    ImagesUrl.ovulationMyMethodIcon,
    ImagesUrl.ovulationMyMethodIcon,
    ImagesUrl.ovulationMyMethodIcon
  ].obs;
  RxList<RxBool>? selectedovulationtestItems;

  RxList<String> pregnancytestList =
      ["Didn't take test", "Test: Positive", "Test: Negative"].obs;
  RxList<String> pregnancytestImagesList = [
    ImagesUrl.didntTakeTestIcon,
    ImagesUrl.ovulationMyMethodIcon,
    ImagesUrl.ovulationMyMethodIcon,
  ].obs;
  RxList<RxBool>? selectedpregnancytestItems;

  RxList<String> feelingsList = [
    "Romantic",
    "Happy",
    "Apathetic",
    "Frisky",
    "Calm",
    "Anxiuos",
    "Irritated",
    "Guilty",
    "Confused",
    "Jealous",
    "Crying",
    "Love",
    "Forgetful",
    "Energetic",
    "Low Energy",
    "Sad",
    "Depressed",
    "Obsessive",
    "Mood Swing"
  ].obs;
  RxList<RxBool>? selectedfeelingsItems;
  RxList<String> feelingsImagesList = [
    ImagesUrl.romanticIcon,
    ImagesUrl.happyIcon,
    ImagesUrl.apatheticIcon,
    ImagesUrl.friskyIcon,
    ImagesUrl.calmIcon,
    ImagesUrl.anxiousIcon,
    ImagesUrl.irritatedIcon,
    ImagesUrl.guiltyIcon,
    ImagesUrl.confusedIcon,
    ImagesUrl.jealousIcon,
    ImagesUrl.cryingIcon,
    ImagesUrl.loveIcon,
    ImagesUrl.forgetfulIcon,
    ImagesUrl.energeticIcon,
    ImagesUrl.lowenEnergyIcon,
    ImagesUrl.sadIcon,
    ImagesUrl.depressedIcon,
    ImagesUrl.obsessiveIcon,
    ImagesUrl.moodSwingIcon,
  ].obs;

  RxList<String> symptomsList = [
    "Cramps",
    "Ache",
    "Fever",
    "Tender breast",
    "Headache",
    "Vaginal dryness",
    "Insomnia",
    "Abdominal pain",
    "Sweaty",
    "Vaginal itching",
    "Craving",
    "Fatigue",
  ].obs;
  RxList<RxBool>? selectedSymptomsItems;
  RxList<String> symptomsImagesList = [
    ImagesUrl.cramp,
    ImagesUrl.ache,
    ImagesUrl.fever,
    ImagesUrl.breast,
    ImagesUrl.headache,
    ImagesUrl.vaginalDryness,
    ImagesUrl.insomnia,
    ImagesUrl.abdominalPain,
    ImagesUrl.sweatyIcon,
    ImagesUrl.itching,
    ImagesUrl.craving,
    ImagesUrl.fatigue,
  ].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    selectedMenusrualFlowItems =
        RxList.generate(menutrualFlowList.length, (index) => false.obs);
    selectedgutHealthListItems =
        RxList.generate(gutHealthList.length, (index) => false.obs);
    selectedmucusMonitoringItems =
        RxList.generate(mucusMonitoringList.length, (index) => false.obs);
    selectedsexAndSexDriveItems =
        RxList.generate(sexAndSexDriveList.length, (index) => false.obs);
    selectedovulationtestItems =
        RxList.generate(ovulationtestList.length, (index) => false.obs);
    selectedpregnancytestItems =
        RxList.generate(pregnancytestList.length, (index) => false.obs);
    selectedfeelingsItems =
        RxList.generate(feelingsList.length, (index) => false.obs);
    selectedSymptomsItems =
        RxList.generate(symptomsList.length, (index) => false.obs);
  }
}
