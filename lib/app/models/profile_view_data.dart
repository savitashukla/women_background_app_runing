class UserProfileData {
    int? statusCode;
    String? status;
    String? message;
    Data? data;
    dynamic body;
    dynamic totalCount;

    UserProfileData({
        this.statusCode,
        this.status,
        this.message,
        this.data,
        this.body,
        this.totalCount,
    });

    factory UserProfileData.fromJson(Map<String, dynamic> json) => UserProfileData(
        statusCode: json["statusCode"],
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        body: json["body"],
        totalCount: json["totalCount"],
    );

    Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "status": status,
        "message": message,
        "data": data?.toJson(),
        "body": body,
        "totalCount": totalCount,
    };
}

class Data {
    String? lastName;
    String? mobileNumber;
    int? isndasigned;
    int? isOfounder;
    DateTime? affAggsigndate;
    String? emailId;
    DateTime? joinedDate;
    String? countryCode;
    dynamic ofJoinedDate;
    String? ndasign;
    String? alternateEmail;
    String? totalEarnings;
    String? affiliationLink;
    int? cutomerAccountId;
    String? profilePic;
    int? reseller;
    dynamic nationality;
    DateTime? ndasigndate;
    int? emailVerified;
    String? firstName;
    String? affiliationName;
    List<TotalAffiliateDetail>? totalAffiliateDetails;
    String? name;
    int? customerId;
    String? location;
    String? affiliationId;
    int? totalAffiliates;
    String? region;

    Data({
        this.lastName,
        this.mobileNumber,
        this.isndasigned,
        this.isOfounder,
        this.affAggsigndate,
        this.emailId,
        this.joinedDate,
        this.countryCode,
        this.ofJoinedDate,
        this.ndasign,
        this.alternateEmail,
        this.totalEarnings,
        this.affiliationLink,
        this.cutomerAccountId,
        this.profilePic,
        this.reseller,
        this.nationality,
        this.ndasigndate,
        this.emailVerified,
        this.firstName,
        this.affiliationName,
        this.totalAffiliateDetails,
        this.name,
        this.customerId,
        this.location,
        this.affiliationId,
        this.totalAffiliates,
        this.region,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        lastName: json["lastName"],
        mobileNumber: json["mobileNumber"],
        isndasigned: json["isndasigned"],
        isOfounder: json["isOfounder"],
        affAggsigndate: json["affAggsigndate"] == null ? null : DateTime.parse(json["affAggsigndate"]),
        emailId: json["emailId"],
        joinedDate: json["joinedDate"] == null ? null : DateTime.parse(json["joinedDate"]),
        countryCode: json["countryCode"],
        ofJoinedDate: json["ofJoinedDate"],
        ndasign: json["Ndasign"],
        alternateEmail: json["alternateEmail"],
        totalEarnings: json["totalEarnings"],
        affiliationLink: json["affiliationLink"],
        cutomerAccountId: json["cutomerAccountID"],
        profilePic: json["profilePic"],
        reseller: json["reseller"],
        nationality: json["Nationality"],
        ndasigndate: json["ndasigndate"] == null ? null : DateTime.parse(json["ndasigndate"]),
        emailVerified: json["emailVerified"],
        firstName: json["firstName"],
        affiliationName: json["affiliationName"],
        totalAffiliateDetails: json["totalAffiliateDetails"] == null ? [] : List<TotalAffiliateDetail>.from(json["totalAffiliateDetails"]!.map((x) => TotalAffiliateDetail.fromJson(x))),
        name: json["name"],
        customerId: json["customerID"],
        location: json["location"],
        affiliationId: json["affiliationId"],
        totalAffiliates: json["totalAffiliates"],
        region: json["region"],
    );

    Map<String, dynamic> toJson() => {
        "lastName": lastName,
        "mobileNumber": mobileNumber,
        "isndasigned": isndasigned,
        "isOfounder": isOfounder,
        "affAggsigndate": affAggsigndate?.toIso8601String(),
        "emailId": emailId,
        "joinedDate": joinedDate?.toIso8601String(),
        "countryCode": countryCode,
        "ofJoinedDate": ofJoinedDate,
        "Ndasign": ndasign,
        "alternateEmail": alternateEmail,
        "totalEarnings": totalEarnings,
        "affiliationLink": affiliationLink,
        "cutomerAccountID": cutomerAccountId,
        "profilePic": profilePic,
        "reseller": reseller,
        "Nationality": nationality,
        "ndasigndate": ndasigndate?.toIso8601String(),
        "emailVerified": emailVerified,
        "firstName": firstName,
        "affiliationName": affiliationName,
        "totalAffiliateDetails": totalAffiliateDetails == null ? [] : List<dynamic>.from(totalAffiliateDetails!.map((x) => x.toJson())),
        "name": name,
        "customerID": customerId,
        "location": location,
        "affiliationId": affiliationId,
        "totalAffiliates": totalAffiliates,
        "region": region,
    };
}

class TotalAffiliateDetail {
    dynamic profilepic;
    String? displayName;

    TotalAffiliateDetail({
        this.profilepic,
        this.displayName,
    });

    factory TotalAffiliateDetail.fromJson(Map<String, dynamic> json) => TotalAffiliateDetail(
        profilepic: json["profilepic"],
        displayName: json["display_name"],
    );

    Map<String, dynamic> toJson() => {
        "profilepic": profilepic,
        "display_name": displayName,
    };
}
