import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:o_woman/app/services/dio_error_interceptor.dart';
import 'package:o_woman/utils/helper_widgets/custom_toast.dart';
import '../../utils/hive_helper.dart';


class Request {




  static final Request _instance = Request._internal();
  late final Dio _dio;
  factory Request() {
    return _instance;
  }

  Request._internal() {
    _dio = Dio();
    _dio.interceptors.add(DioErrorInterceptor());
  }
   void updateAuthorization(String token, {bool clearToken = false}) {
    log('token added...');
    if (clearToken) {
      _dio.options.headers['authorization'] = null;
    } else {
      _dio.options.headers['authorization'] = 'Bearer $token';
    }
  }




   Future<Response> get(
    String path, {
    void Function(int, int)? onReceiveProgress,
    Options? options,
  }) async {
    return await _dio.get(
      path,
      onReceiveProgress: onReceiveProgress,
      options: options,
    );
  }

  ///[delete]
  Future<Response> delete(String path) async {
    return await _dio.delete(path);
  }

   Future<Response> post(
    String path, {
    Object? data,
    Options? options,
    void Function(int, int)? onReceiveProgress,
  }) async {

    log('Payload received==> $data');
    return await _dio.post(
      path,
      data: data,
      options: options,
      onReceiveProgress: onReceiveProgress,
    );
  }

   Future<Response> put(
    String path, {
    Object? data,
    Options? options,
  }) async {
    log('Payload received==> $data');
    return await _dio.put(path, data: data,options: options);
  }


   Future<Response> download(
    String path,
    String filePath, {
    Object? data,
    ResponseType? responseType,
    void Function(int, int)? onReceiveProgress,
    required String method,
  }) async {
    return await _dio.download(path, filePath,
        data: data,
        onReceiveProgress: onReceiveProgress,
        options: Options(
          method: method,
          responseType: responseType,
        ));
  }


   Future<bool> updateToken() async {
    final token = HiveHelper.getData("token");
    var response = await _dio.get('/refresh-token',
        options: Options(headers: {'Authorization': "Bearer $token"}));
    if (response.statusCode == 200) {
      updateAuthorization(response.data['data']['accessToken']);
      log(_dio.options.headers.toString());
      return true;
    } else if (response.statusCode == 401) {

      CustomToast.showErrorToast(
        msg: "Session Expired",
      );
      return false;
    }
    return false;
  }
}
