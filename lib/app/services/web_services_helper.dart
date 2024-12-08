import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:o_woman/app/services/api_url.dart';
import 'package:o_woman/utils/helper_method.dart';
import 'package:o_woman/utils/hive_helper.dart';

import '../../constants/app_string.dart';
import '../../utils/EncryptionHelper.dart';
import '../../utils/helper_widgets/custom_toast.dart';

class WebServicesAuthHelper {
  final dio = Dio();
  Map<String, dynamic> headers = {
    // 'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  Future<Map<String, dynamic>?> apiLoginWithOtp(emailId) async {
    Options options = Options(headers: headers);

    //check net connectivity check
    if (!await InternetConnectionChecker().hasConnection) {
      CustomToast.showErrorToast(msg: 'INTERNET CONNECTIVITY LOST');
      return null;
    }
    Map<String, dynamic> queryParameters = {
      "emailId": emailId,
    };
    try {
      var url = "${ApiUrl.baseUrl}${ApiUrl.apiSendOtpLogin}";

      final response = await dio.get(url,
          options: options, queryParameters: queryParameters);

      HelperMethod()
          .customPrint("response User Profile Body ====${response.data}");
      HelperMethod()
          .customPrint("response User Profile Code==== ${response.statusCode}");

      if (response.statusCode == 200) {
        CustomToast.showSuccessToast(msg: "Sent Otp Successfully");

        return response.data;
      }
    } on DioException catch (e) {
      CustomToast.showErrorToast(msg: e.response!.data["message"]);
      return null;
      /*if (e.response!.statusCode == 400) {
        HelperMethod().customPrint("response User Profile Body ====$e");
        return null;
      } else if (e.response!.statusCode == 403 ||
          e.response!.statusCode == 401) {}*/
    } catch (e) {
      CustomToast.showErrorToast(msg: "Something went Wrong");
      return null;
    }
    return null;
  }

  //HeaderInfo Api...
  Future getHeaderInfo() async {
    var url = "${ApiUrl.baseUrl}${ApiUrl.headerinfo}";
    Map<String, dynamic> headers = {
      'Accept': 'application/json',
      'Authorization': "Bearer ${HiveHelper.getData("token")}",
    };
    var response = await dio.get(url, options: Options(headers: headers));
    if (response.statusCode == 200) {
      print("Header Info Response::${response.data}");
      return response.data;
    } else {
      return null;
    }
  }

  Future<Map<String, dynamic>?> verifyOtpLogin(emailId, otp) async {
    Options options = Options(headers: headers);

    //check net connectivity check
    if (!await InternetConnectionChecker().hasConnection) {
      CustomToast.showErrorToast(msg: 'INTERNET CONNECTIVITY LOST');
      return null;
    }
    Map<String, dynamic> queryParameters = {
      "emailId": emailId,
      "otp": otp,
    };
    try {
      var url = "${ApiUrl.baseUrl}${ApiUrl.verifyOtpLogin}";

      final response = await dio.get(url,
          options: options, queryParameters: queryParameters);

      HelperMethod()
          .customPrint("response User Profile Body ====${response.data}");
      HelperMethod()
          .customPrint("response User Profile Code==== ${response.statusCode}");

      if (response.statusCode == 200) {
        return response.data;
      }
    } on DioException catch (e) {
      CustomToast.showErrorToast(msg: e.response!.data["message"]);
      return null;

      /* if (e.response!.statusCode == 400) {
        HelperMethod().customPrint("response User Profile Body ====$e");
        return null;
      } else if (e.response!.statusCode == 403 ||
          e.response!.statusCode == 401) {}*/
    } catch (e) {
      CustomToast.showErrorToast(msg: "Something went Wrong");
      return null;
    }
    return null;
  }

  //https://obsapi-dev.onpassive.com/payment/create-captcha/registration?captcha=null

  Future<Map<String, dynamic>?> apiLogin(email, password) async {
    Options options = Options(headers: headers);

    String encryptedMail =
        EncryptionHelper.encrypt(email + AppString.oMailEndTag);
    String encryptedPass = EncryptionHelper.encrypt(password);

    Map<String, dynamic> requestData = {
      "emailId": encryptedMail,
      "password": encryptedPass,
    };

    if (!await InternetConnectionChecker().hasConnection) {
      CustomToast.showErrorToast(msg: 'INTERNET CONNECTIVITY LOST');
      return null;
    }
    try {
      final response = await dio.post(ApiUrl.baseUrl + ApiUrl.apiLogin,
          data: requestData, options: options);

      HelperMethod()
          .customPrint("response User Profile Code==== ${response.statusCode}");

      if (response.statusCode == 200) {
        return response.data;
      }
    } on DioException catch (e) {
      CustomToast.showErrorToast(msg: e.response!.data["message"]);
      return null;
    } catch (e) {
      CustomToast.showErrorToast(msg: "Something went Wrong");

      HelperMethod()
          .customPrint("response User Profile Code==== ${e.toString()}");
      return null;
    }
    return null;
  }

  Future<Map<String, dynamic>?> apiRegister(mapData) async {
    Options options = Options(headers: headers);

    if (!await InternetConnectionChecker().hasConnection) {
      CustomToast.showErrorToast(msg: 'INTERNET CONNECTIVITY LOST');
      return null;
    }
    Response response;
    try {
      response = await dio.post(ApiUrl.baseUrl + ApiUrl.register,
          data: mapData, options: options);
      HelperMethod()
          .customPrint("response User Profile Code==== ${response.statusCode}");
      if (response.statusCode == 200) {
        return response.data;
      }
    } on DioException catch (e) {
      CustomToast.showErrorToast(msg: e.response!.data["message"]);
      return null;
    } catch (e) {
      print("error call${e.toString()}");
      CustomToast.showErrorToast(msg: "Something went Wrong");
      return null;
    }
    return null;
  }

  Future<Map<String, dynamic>?> forgotPassword(emailId) async {
    Options options = Options(headers: headers);

    //check net connectivity check
    if (!await InternetConnectionChecker().hasConnection) {
      CustomToast.showErrorToast(msg: 'INTERNET CONNECTIVITY LOST');
      return null;
    }
    Map<String, dynamic> queryParameters = {
      "alternateEmailId": emailId,
    };
    try {
      var url = "${ApiUrl.baseUrl}${ApiUrl.forgotPassword}";

      final response = await dio.get(url,
          options: options, queryParameters: queryParameters);

      HelperMethod()
          .customPrint("response User Profile Body ====${response.data}");
      HelperMethod()
          .customPrint("response User Profile Code==== ${response.statusCode}");

      if (response.statusCode == 200) {
        return response.data;
      }
    } on DioException catch (e) {
      CustomToast.showErrorToast(msg: e.response!.data["message"]);
      return null;
    } catch (e) {
      CustomToast.showErrorToast(msg: "Something went Wrong");

      HelperMethod()
          .customPrint("response User Profile Code==== ${e.toString()}");
      return null;
    }
    return null;
  }

  Future<Map<String, dynamic>?> forgotPasswordOtpVerify(email, otp) async {
    Options options = Options(headers: headers);

    Map<String, dynamic> requestData = {
      "emailId": email,
      "otp": otp,
    };

    if (!await InternetConnectionChecker().hasConnection) {
      CustomToast.showErrorToast(msg: 'INTERNET CONNECTIVITY LOST');
      return null;
    }
    try {
      final response = await dio.post(
          ApiUrl.baseUrl + ApiUrl.forgotPasswordOtpVerify,
          queryParameters: requestData,
          options: options);

      HelperMethod()
          .customPrint("response User Profile Code==== ${response.statusCode}");

      if (response.statusCode == 200) {
        return response.data;
      }
    } on DioException catch (e) {
      CustomToast.showErrorToast(msg: e.response!.data["message"]);
      return null;
    } catch (e) {
      CustomToast.showErrorToast(msg: "Something went Wrong");

      HelperMethod()
          .customPrint("response User Profile Code==== ${e.toString()}");
      return null;
    }
    return null;
  }

  Future<Map<String, dynamic>?> resetPassword(password, email) async {
    Options options = Options(headers: headers);

    Map<String, dynamic> data = {
      "newPassword": password,
      "confirmPassword": password,
      "alternateEmailId": email
    };

    if (!await InternetConnectionChecker().hasConnection) {
      CustomToast.showErrorToast(msg: 'INTERNET CONNECTIVITY LOST');
      return null;
    }
    try {
      final response = await dio.post(ApiUrl.baseUrl + ApiUrl.resetPassword,
          data: data, options: options);

      HelperMethod()
          .customPrint("response User Profile Code==== ${response.statusCode}");

      if (response.statusCode == 200) {
        return response.data;
      }
    } on DioException catch (e) {
      CustomToast.showErrorToast(msg: "Something went Wrong");
      if (e.response!.statusCode == 400) {
        return null;
      } else if (e.response!.statusCode == 403 ||
          e.response!.statusCode == 401) {}
    } catch (e) {
      CustomToast.showErrorToast(msg: "Something went Wrong");
      HelperMethod()
          .customPrint("response User Profile Code==== ${e.toString()}");
    }
    return null;
  }

// image Ca..

  Future<Map<String, dynamic>?> apiGetCaptchaN() async {
    Options options = Options(headers: headers);

    //check net connectivity check
    if (!await InternetConnectionChecker().hasConnection) {
      CustomToast.showErrorToast(msg: 'INTERNET CONNECTIVITY LOST');
      return null;
    }

    try {
      var url = "${ApiUrl.baseUrl}${ApiUrl.captchaCode}";

      final response = await dio.get(url, options: options);

      HelperMethod()
          .customPrint("response User Profile Body ====${response.data}");
      HelperMethod()
          .customPrint("response User Profile Code==== ${response.statusCode}");

      if (response.statusCode == 200) {
        return response.data;
      }
    } on DioException catch (e) {
      CustomToast.showErrorToast(msg: "Something went Wrong");
      if (e.response!.statusCode == 400) {
        HelperMethod().customPrint("response User Profile Body ====$e");
        return null;
      } else if (e.response!.statusCode == 403 ||
          e.response!.statusCode == 401) {}
    }
    return null;
  }
}
