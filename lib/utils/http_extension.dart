import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:o_woman/utils/failure.dart';
import 'package:o_woman/utils/status_code_extensions.dart';

extension HttpExtension on Response {
  Future<Either<Failure, dynamic>> getResponse() async {
    if (statusCode != 200) {
      if (statusCode == 401) {
        Fluttertoast.showToast(msg: 'Please handle this 401 issue',timeInSecForIosWeb: 5);
      }
      return _getErrorMessage();
    } else {
      if (data is Map && data['statusCode'] != null) {
        final resStatus = data['statusCode'] as int;
        if (resStatus != 200) {
          return _getErrorMessage();
        } else if (data['status'] == 'Failed') {
          return _getErrorMessage();
        }
      }
      return Right(data);
    }
  }

  Left<Failure, dynamic> _getErrorMessage() {
    try {
      final message = data['message'] ?? '';
      final error = data['error'] ?? '';
      final errMsg = message.toString().isNotEmpty ? message : error;

      if (errMsg.isNotEmpty) {
        return Left(ApiFailure(errMsg));
      } else {
        return Left(ApiFailure(statusCode!.getStatusMessage()));
      }
    } catch (e) {
      return Left(ApiFailure(statusCode!.getStatusMessage()));
    }
  }
}