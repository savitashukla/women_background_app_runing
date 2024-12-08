// ignore_for_file: use_build_context_synchronously

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:o_woman/app/routes/routes.dart';
import 'package:o_woman/utils/logger_utils.dart';

import '../../../utils/hive_helper.dart';
import '../../app.dart';

class AppLockTypeScreenController extends GetxController {
  final LocalAuthentication auth = LocalAuthentication();
  RxBool canCheckBiometrics = false.obs;
  RxBool youDeviceSupported = false.obs;

  RxList<BiometricType> availableBiometrics = <BiometricType>[].obs;

  RxBool authenticatedPinCheck = false.obs;
  RxBool authenticatedBioMetric = false.obs;
  RxBool authenticatedFace = false.obs;
  RxBool accessCodeToggle = false.obs;
  RxBool fingerprintsToggle = false.obs;
  RxBool faceToggle = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    //  getStoreData();
  }

  Future<void> checkBioMetric() async {
    try {
      canCheckBiometrics.value = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      canCheckBiometrics.value = false;
      debugPrint(e.toString());
    }
  }

  Future<void> getAvailableBiometricsDevice() async {
    try {
      availableBiometrics.value = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      // availableBiometrics = <BiometricType>[];
      print('Error caught in platform block : $e');
    } catch (e) {
      print('Error caught in catch block : $e');
    }
  }

// pin authentication
  Future<void> authenticatePin() async {
    try {
      authenticatedPinCheck.value = await auth.authenticate(
        localizedReason: 'Let OS determine authentication method',
        options: const AuthenticationOptions(
          stickyAuth: true,
        ),
      );
    } on PlatformException catch (e) {
      debugPrint(e.toString());
      Fluttertoast.showToast(msg: "Try Again");
      return;
    }

    if (authenticatedPinCheck.value) {
      Navigator.pushNamed(navigatorKey.currentState!.context, Routes.dashBoard);
    } else {
      Fluttertoast.showToast(msg: "Try Again");
    }
  }

  // face or biometrix

  Future<void> authenticateWithBiometrics() async {
    try {
      authenticatedBioMetric.value = await auth.authenticate(
        localizedReason:
            'Scan your fingerprint (or face or whatever) to authenticate',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
    } on PlatformException catch (e) {
      print(e);
      authenticatedBioMetric.value = false;

      return;
    }
  }

  Future<void> authenticateWithFace() async {
    try {
      authenticatedPinCheck.value = await auth.authenticate(
        localizedReason: ' ',
        options: const AuthenticationOptions(
          stickyAuth: true,
            useErrorDialogs: false
        ),
      );
    } on PlatformException catch (e) {
      debugPrint(e.toString());
      Fluttertoast.showToast(msg: "Try Again");
      return;
    }

    if (authenticatedPinCheck.value) {
      Navigator.pushNamed(navigatorKey.currentState!.context, Routes.dashBoard);
    } else {
      Fluttertoast.showToast(msg: "Try Again");
    }
  }

  Future<void> checkPinCode() async {
    if (youDeviceSupported.value) {
      // await authenticatePin();
      await authenticateWithFace();
    } else {
      Fluttertoast.showToast(msg: "Your Device Not Supported");
      Navigator.pushNamed(navigatorKey.currentState!.context, Routes.dashBoard);
    }
  }

  void accessCode(bool codeValues) {
    if (youDeviceSupported.value) {
      accessCodeToggle.value = !accessCodeToggle.value;
    } else {}
  }

  void getStoreData() {
    accessCodeToggle.value = HiveHelper.getData("accessCodeToggle") ?? false;
    faceToggle.value = HiveHelper.getData("faceToggle") ?? false;
    fingerprintsToggle.value =
        HiveHelper.getData("fingerprintsToggle") ?? false;

    if (accessCodeToggle.value ||
        faceToggle.value ||
        fingerprintsToggle.value) {
      auth.isDeviceSupported().then((bool isSupported) {
        youDeviceSupported.value = isSupported;
        checkPinCode();
      });
    } else {
      Navigator.pushNamed(navigatorKey.currentState!.context, Routes.dashBoard);
    }
  }

  void checkDeviceSupport() {
    accessCodeToggle.value = HiveHelper.getData("accessCodeToggle") ?? false;
    faceToggle.value = HiveHelper.getData("faceToggle") ?? false;
    fingerprintsToggle.value =
        HiveHelper.getData("fingerprintsToggle") ?? false;


    auth.isDeviceSupported().then((bool isSupported) {
      youDeviceSupported.value = isSupported;
    });
  }
}
