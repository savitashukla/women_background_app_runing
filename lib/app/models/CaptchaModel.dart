// ignore_for_file: prefer_typing_uninitialized_variables

class CaptchaModel {
  int? statusCode;
  String? status;
  String? message;
  Data? data;
  var body;
  var totalCount;

  CaptchaModel(
      {this.statusCode,
      this.status,
      this.message,
      this.data,
      this.body,
      this.totalCount});

  CaptchaModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    body = json['body'];
    totalCount = json['totalCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['body'] = body;
    data['totalCount'] = totalCount;
    return data;
  }
}

class Data {
  String? captcha;
  String? uuid;
  Data({this.captcha, this.uuid});
  Data.fromJson(Map<String, dynamic> json) {
    captcha = json['captcha'];
    uuid = json['uuid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['captcha'] = captcha;
    data['uuid'] = uuid;
    return data;
  }
}
