
class CountriesList {
    int? statusCode;
    String? status;
    String? message;
    dynamic data;
    List<Body>? body;
    dynamic totalCount;

    CountriesList({
        this.statusCode,
        this.status,
        this.message,
        this.data,
        this.body,
        this.totalCount,
    });

    factory CountriesList.fromJson(Map<String, dynamic> json) => CountriesList(
        statusCode: json["statusCode"],
        status: json["status"],
        message: json["message"],
        data: json["data"],
        body: json["body"] == null ? [] : List<Body>.from(json["body"]!.map((x) => Body.fromJson(x))),
        totalCount: json["totalCount"],
    );

    Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "status": status,
        "message": message,
        "data": data,
        "body": body == null ? [] : List<dynamic>.from(body!.map((x) => x.toJson())),
        "totalCount": totalCount,
    };
}

class Body {
    String? phoneCode;
    String? countryCode;
    String? countryName;

    Body({
        this.phoneCode,
        this.countryCode,
        this.countryName,
    });

    factory Body.fromJson(Map<String, dynamic> json) => Body(
        phoneCode: json["phoneCode"],
        countryCode: json["countryCode"],
        countryName: json["countryName"],
    );

    Map<String, dynamic> toJson() => {
        "phoneCode": phoneCode,
        "countryCode": countryCode,
        "countryName": countryName,
    };
}
