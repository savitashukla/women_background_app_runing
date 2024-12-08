import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:o_woman/constants/images_url.dart';

class HomeHealthLifestyleController extends GetxController {
  RxList<String> physicalActivityList = [
    "Cycling",
    "Yoga",
    "Gym",
    "Didn't exercise",
    "Running",
    "Swimming",
    "Walking"
  ].obs;
  RxList<String> physicalActivityImagesList = [
    ImagesUrl.cyclingIcon,
    ImagesUrl.yogaIcon,
    ImagesUrl.gymIcon,
    ImagesUrl.exerciseIcon,
    ImagesUrl.runningIcon,
    ImagesUrl.swimmingIcon,
    ImagesUrl.walkingIcon,
  ].obs;
  RxList<RxBool>? selectedphysicalActivityItems;

  RxList<String> quiteTimeList =
      ["Meditation", "Kegal Exercise", "Journaling", "Breathing Exercise"].obs;
  RxList<String> quiteTimeImagesList = [
    ImagesUrl.meditationIcon,
    ImagesUrl.kegalIcon,
    ImagesUrl.journalingIcon,
    ImagesUrl.breathingIcon
  ].obs;
  RxList<RxBool>? selectedquiteTimeListItems;

  RxList<String> outdoorActivitiesList =
      ["Hiking", "Camping", "Hunting", "Gardening", "Travel"].obs;
  RxList<String> outdoorActivitiesImagesList = [
    ImagesUrl.hikingIcon,
    ImagesUrl.campingIcon,
    ImagesUrl.huntingIcon,
    ImagesUrl.gardeningIcon,
    ImagesUrl.travelIcon,
  ].obs;
  RxList<RxBool>? selectedoutdoorActivitiesItems;

  RxList<String> cookingBakingList = [
    "Baking bread",
    "Trying new recipes",
    "Cake decoration",
    "Experimenting with ingredients"
  ].obs;
  RxList<String> cookingBakingImagesList = [
    ImagesUrl.bakingBreadIcon,
    ImagesUrl.tryingNewRecipesIcon,
    ImagesUrl.cakeDecorationIcon,
    ImagesUrl.experimentinIngredientsIcon,
  ].obs;
  RxList<RxBool>? selectedcookingBakingItems;

  RxList<String> musicList =
      ["Playing musical instruments", "Composing", "Singing", "DJing"].obs;
  RxList<String> musicImagesList = [
    ImagesUrl.playingMusicalIcon,
    ImagesUrl.composingIcon,
    ImagesUrl.singingIcon,
    ImagesUrl.djingIcon
  ].obs;
  RxList<RxBool>? selectedmMusicItems;

  RxList<String> otherList =
      ["Disease/ Injury", "Smoking", "Alcohol", "Stress"].obs;
  RxList<String> otherImagesList = [
    ImagesUrl.diseaseinjuryIcon,
    ImagesUrl.smokingIcon,
    ImagesUrl.alcoholIcon,
    ImagesUrl.stressIcon
  ].obs;
  RxList<RxBool>? selectedOtherItems;

  RxDouble count = 0.0.obs;
  var weightController = TextEditingController().obs;
  final double lowerLimit = 0;
  final double upperLimit = 3.5;
  final double incrementValue = 0.25;

  void increment() {
    if (count < upperLimit) {
      count.value += incrementValue;
    }
  }

  void decrement() {
    if (count > lowerLimit) {
      count.value -= incrementValue;
    }
  }

  var sleepingHoursController = TextEditingController().obs;
  var temperatureController = TextEditingController().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    selectedphysicalActivityItems =
        RxList.generate(physicalActivityList.length, (index) => false.obs);
    selectedquiteTimeListItems =
        RxList.generate(quiteTimeList.length, (index) => false.obs);
    selectedoutdoorActivitiesItems =
        RxList.generate(outdoorActivitiesList.length, (index) => false.obs);
    selectedcookingBakingItems =
        RxList.generate(cookingBakingList.length, (index) => false.obs);
    selectedmMusicItems =
        RxList.generate(musicList.length, (index) => false.obs);
    selectedOtherItems =
        RxList.generate(otherList.length, (index) => false.obs);
  }
}
