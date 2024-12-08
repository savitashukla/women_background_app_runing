import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:o_woman/app/models/country_model.dart';
import 'package:o_woman/app/models/profile_view_data.dart';
import 'package:o_woman/app/services/profile_View/profile_request.dart';
import 'package:o_woman/app/viewmodels/home_controller/home_page_controller.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/utils/failure.dart';
import 'package:o_woman/utils/helper_widgets/custom_toast.dart';
import 'package:o_woman/utils/hive_helper.dart';

class SettingsScreenController extends GetxController {
  RxBool sleepReminderToggle = false.obs;
  RxBool isProfileLoading = false.obs;
  Rx<UserProfileData> profiledata = UserProfileData().obs;
  RxList<Body> countryDataList = <Body>[].obs;
  RxBool getPregnant = false.obs;
  RxBool editprofile = false.obs;
  RxString countryNameData = "".obs;
  RxString countryCodeString = "AF".obs;
  RxString countryCode = "".obs;
  RxString phoneCode = "".obs;
  RxString imagePicker = "".obs;
  RxBool pillReminderToggle = false.obs;
  RxBool dataPrivacyToggle = true.obs;
  RxBool encryptionToggle = false.obs;
  RxBool applockToggle = false.obs;
  RxBool accountRecoveryToggle = false.obs;
  RxBool twoFactorToggle = false.obs;
  RxBool pushNotificationstoggle = true.obs;
  RxBool emailNotificationstoggle = true.obs;
  RxBool automaticDatetimeToggle = true.obs;
  RxBool useFormatToggle = false.obs;
  RxBool lastBackupToggle = true.obs;
  RxBool endToEndToggle = false.obs;
  RxBool backupCellularToggle = false.obs;
  RxBool cycleTrackingToggle = true.obs;
  RxBool getPregnantToggle = true.obs;
  RxBool panicModeToggle = true.obs;
  RxBool regularRaiudMonitoringToggle = true.obs;
  RxBool appSoundToggle = true.obs;

  List<String> countryList =
      <String>['India', 'Singapore', 'Egypt', 'Dubai'].obs;
  RxString selectedCountry = "India".obs;

  List<String> femaleList = <String>['Female'].obs;
  List<String> genderList = ["Male", "Female"].obs;
  var selectedGenderList = "Female".obs;

  RxString selectedfemaleList = "Female".obs;
  var nameController = TextEditingController().obs;
  var nameControllerLast = TextEditingController().obs;
  var omailIDController = TextEditingController().obs;
  var nationalityController = TextEditingController().obs;
  var indiaController = TextEditingController().obs;
  var femaleController = TextEditingController().obs;
  var dobController = TextEditingController().obs;
  var phoneController = TextEditingController().obs;

  var kInnerDecoration = const BoxDecoration(
    shape: BoxShape.circle,
    color: AppColors.mainColor,
  ).obs;
  var kGradientBoxDecoration = const BoxDecoration(
    shape: BoxShape.circle,
    gradient: LinearGradient(colors: [Color(0xff9DA4FB), Color(0xffF496C4)]),
  ).obs;
  RxBool switchEnable = false.obs;

  void upDateCountry(int index) {
    countryNameData.value = countryDataList[index].countryName!;
    countryCodeString.value = countryDataList[index].countryCode!;
    countryCode.value = countryDataList[index].countryCode!;
    phoneCode.value = countryDataList[index].phoneCode!;
    nationalityController.value.text = countryNameData.value;
  }

  Future profileViewData() async {
    Future.delayed(Duration.zero, () {
      isProfileLoading.value = true;
    });
    var response = await ProfileService()
        .getprofileData(HiveHelper.getData("customer_id"));
    print("Response......$response");
    isProfileLoading.value = false;
    response.fold((l) {
      isProfileLoading.value = false;

      // Fluttertoast.showToast(msg: l.message);
    }, (r) {
      isProfileLoading.value = false;
      profiledata.value = r;
      profiledata.value.data!.name == null &&
              profiledata.value.data!.name!.isEmpty
          ? ""
          : nameController.value.text =
              profiledata.value.data!.firstName!.toString();
      profiledata.value.data!.name == null &&
              profiledata.value.data!.name!.isEmpty
          ? ""
          : nameControllerLast.value.text =
              profiledata.value.data!.lastName!.toString();
      profiledata.value.data!.emailId == null &&
              profiledata.value.data!.emailId!.isEmpty
          ? ""
          : omailIDController.value.text =
              profiledata.value.data!.emailId!.toString();
      profiledata.value.data!.mobileNumber == null ||
              profiledata.value.data!.mobileNumber!.isEmpty
          ? ""
          : phoneController.value.text =
              profiledata.value.data!.mobileNumber!.toString();
      countryCode.value = profiledata.value.data!.countryCode ?? '';

      getCountryData();
      countryCodeString.value = profiledata.value.data!.countryCode ?? '';

      //nationalityController.value.text = countryCodeString.value.toString();
      print("call here values ${countryCodeString.value}");
    });
  }

//GetCOuntryData
  Future getCountryData() async {
    try {
      var response = await ProfileService().getCountryList();
      response.fold((l) {
        //  Fluttertoast.showToast(msg: l.message);
      }, (r) {
        print("+++>>>>>${r.body}");
        countryDataList.addAll(r.body!);
        phoneCode.value = countryDataList
            .firstWhere((element) => element.countryCode == countryCode.value)
            .phoneCode
            .toString();

        countryNameData.value = countryDataList
            .firstWhere((element) => element.countryCode == countryCode.value)
            .countryName
            .toString();

        nationalityController.value.text = countryNameData.value;
        print(phoneCode.value);
      });
    } catch (e) {
      return left(ApiFailure(e.toString()));
    }
  }

  Future<void> saveProfileData() async {
    if (nameController.value.text.isNotEmpty) {
      if (nameControllerLast.value.text.isNotEmpty) {
        if (phoneController.value.text.isNotEmpty) {
          var dataParse = {
            "firstName": nameController.value.text,
            "lastName": nameControllerLast.value.text,
            "countryCode": countryCodeString.toString(),
            "alternateEmail": omailIDController.value.text,
            "mobileNumber": phoneController.value.text,
            "nationality": "",
          };

          var response = await ProfileService().updateProfile(dataParse);

          if (response != null) {
            editprofile.value = false;
            HomePageController controller = Get.find();
            controller.profileViewData();
            profileViewData();
          }
        } else {
          CustomToast.showErrorToast(msg: "Phone number is required");
        }
      } else {
        CustomToast.showErrorToast(msg: "Last name is required");
      }
    } else {
      CustomToast.showErrorToast(msg: "First name is required");
    }
  }

  Future<void> saveProfilePic(CroppedFile imagePic) async {
    isProfileLoading.value = true;
    var response = await ProfileService().uploadProfilePic(imagePic);

    if (response != null) {
      HomePageController controller = Get.find();
      controller.profileViewData();
      profileViewData();
    }
  }
}
