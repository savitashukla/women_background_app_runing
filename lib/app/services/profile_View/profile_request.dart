import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:o_woman/app/models/profile_view_data.dart';
import 'package:o_woman/app/services/api_url.dart';
import 'package:o_woman/utils/failure.dart';
import 'package:o_woman/utils/helper_widgets/bottom_sheet_call.dart';
import 'package:o_woman/utils/hive_helper.dart';
import 'package:o_woman/utils/http_extension.dart';

import '../../../utils/helper_method.dart';
import '../../../utils/helper_widgets/custom_toast.dart';
import '../../models/country_model.dart';
import '../request.dart';

class ProfileService{



  Future<Either<Failure, UserProfileData>> getprofileData(
      int customerId) async {
    try {
      Map<String, dynamic> headers = {
        'Accept': 'application/json',
        'Authorization': "Bearer ${HiveHelper.getData("token")}",
      };
      var url = "${ApiUrl.baseUrl}${ApiUrl.viewProfile}$customerId";
      final response =
          await Request().get(url, options: Options(headers: headers));

      print("response ${response.data.toString()}");
      Either<Failure, dynamic> profileResponse = await response.getResponse();
      return profileResponse.fold((l) {

        print(" vncb ${l.toString()}");

        Future.delayed(
            const Duration(milliseconds: 10), () {
          BottomSheetCall().logoutMethods();
          CustomToast.showErrorToast(msg: "Session Expired");

        });


        return left(l);
      }, (r) {
        try {
          UserProfileData profileData = UserProfileData.fromJson(r);
          print("Profile dATA${profileData.toJson()}");
          return Right(profileData!);
        } catch (e) {

          return left(ApiFailure(e.toString()));
        }
      });
    } catch (e) {
      Future.delayed(
          const Duration(milliseconds: 10), () {
        BottomSheetCall().logoutMethods();
        CustomToast.showErrorToast(msg: "Session Expired");

      });
      return left(ApiFailure(e.toString()));
    }
  }

  //Country List...
  Future<Either<Failure, CountriesList>> getCountryList() async {
    try {
      Map<String, dynamic> headers = {
        'Accept': 'application/json',
        'Authorization': "Bearer ${HiveHelper.getData("token")}",
      };
      var url = "${ApiUrl.baseUrl}${ApiUrl.countryurl}";
      final response =
          await Request().get(url, options: Options(headers: headers));
      Either<Failure, dynamic> countryResponse = await response.getResponse();
      return countryResponse.fold((l) {
        return left(l);
      }, (r) {
        try {
          CountriesList countryModel = CountriesList.fromJson(r);
          print("Country dATA${countryModel.toJson()}");
          return Right(countryModel);
        } catch (e) {
          return left(ApiFailure(e.toString()));
        }
      });
    } catch (e) {
      return left(ApiFailure(e.toString()));
    }
  }

  Future<Map<String, dynamic>?> uploadProfilePic(CroppedFile imageData) async {
    Map<String, dynamic> headers = {
      'Authorization': "Bearer ${HiveHelper.getData("token")}",
    };
    print(HiveHelper.getData("token"));
    print("\n");

    if (!await InternetConnectionChecker().hasConnection) {
      CustomToast.showErrorToast(msg: 'INTERNET CONNECTIVITY LOST');
      return null;
    }

    try {
      final response =
          await Request().post(ApiUrl.baseUrl + ApiUrl.uploadProfilePic,
              data: FormData.fromMap({
                'file': await MultipartFile.fromFile(
                  imageData.path,
                  filename: imageData.path.split('/').last,
                  contentType: MediaType('image', 'png'),
                )
              }),
              options: Options(headers: headers));
      if (response.statusCode == 200) {
        CustomToast.showSuccessToast(msg: "Your Profile Pic Updated successfully");

        return response.data;
      }
    } on DioException catch (e) {
      HelperMethod().customPrint("response User edit Code==== ${e.toString()}");
      CustomToast.showErrorToast(msg: "Something went Wrong");
      if (e.response!.statusCode == 400) {
      } else if (e.response!.statusCode == 403 ||
          e.response!.statusCode == 401) {}

      return null;
    } catch (e) {
      HelperMethod()
          .customPrint("response User Profile Code==== ${e.toString()}");
      return null;
    }

    return null;
  }

  Future<Map<String, dynamic>?> updateProfile(mapValues) async {
    Map<String, dynamic> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': "Bearer ${HiveHelper.getData("token")}",
    };
    print(HiveHelper.getData("token"));
    print("\n");
    print(mapValues.toString());

    if (!await InternetConnectionChecker().hasConnection) {
      CustomToast.showErrorToast(msg: 'INTERNET CONNECTIVITY LOST');
      return null;
    }
    try {
      final response = await Request().put(
          ApiUrl.baseUrl + ApiUrl.updateProfile,
          data: json.encode(mapValues),
          options: Options(headers: headers));

      HelperMethod()
          .customPrint("response User Profile Code==== ${response.statusCode}");

      if (response.statusCode == 200) {
        CustomToast.showSuccessToast(msg: "Your Profile Updated successfully");
        if (response != null) {

          return response.data;
        } else {
          return null;
        }
      }
    } on DioException catch (e) {
      HelperMethod().customPrint("response User edit Code==== ${e.toString()}");
      CustomToast.showErrorToast(msg: "Something went Wrong");
      if (e.response!.statusCode == 400) {

      } else if (e.response!.statusCode == 403 ||
          e.response!.statusCode == 401) {}

      return null;
    } catch (e) {
      HelperMethod()
          .customPrint("response User Profile Code==== ${e.toString()}");
      return null;
    }
    return null;
  }
}