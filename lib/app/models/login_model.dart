import 'package:o_woman/utils/password_validator_state.dart';

class LoginModel {
  int? statusCode;
  String? status;
  String? message;
  Data? data;
  var body;
  var totalCount;
  ValidatePassWord? validatePassWord;

  LoginModel(
      {this.statusCode,
        this.status,
        this.message,
        this.data,
        this.body,
        this.validatePassWord,
        this.totalCount});

  LoginModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    body = json['body'];
    totalCount = json['totalCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['body'] = this.body;
    data['totalCount'] = this.totalCount;
    return data;
  }
}

class Data {
  String? accessToken;

  Data({this.accessToken});

  Data.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this.accessToken;
    return data;
  }
}