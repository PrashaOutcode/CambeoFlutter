class LoginResponse {
  String message;
  Data data;

  LoginResponse({this.message, this.data});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String token;
  String refreshToken;
  String userId;
  BasicInfo basicInfo;
  String applicationType;
  List<BusinessLocations> businessLocations;
  String aboutYou;
  String profileCompletedUpTo;
  bool isProfileCompleted;
  String profilePictureUrl;
  String businessLogoUrl;
  String bannerPictureUrl;
  List<Media> media;
  List<Industries> industries;
  SocialUrls socialUrls;
  List<Groups> groups;
  String accountType;
  bool isCardSave;
  bool hasOnBoardSeen;

  Data(
      {this.token,
        this.refreshToken,
        this.userId,
        this.basicInfo,
        this.applicationType,
        this.businessLocations,
        this.aboutYou,
        this.profileCompletedUpTo,
        this.isProfileCompleted,
        this.profilePictureUrl,
        this.businessLogoUrl,
        this.bannerPictureUrl,
        this.media,
        this.industries,
        this.socialUrls,
        this.groups,
        this.accountType,
        this.isCardSave,
        this.hasOnBoardSeen});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    refreshToken = json['refresh_token'];
    userId = json['user_id'];
    basicInfo = json['basic_info'] != null
        ? new BasicInfo.fromJson(json['basic_info'])
        : null;
    applicationType = json['application_type'];
    if (json['business_locations'] != null) {
      businessLocations = new List<BusinessLocations>();
      json['business_locations'].forEach((v) {
        businessLocations.add(new BusinessLocations.fromJson(v));
      });
    }
    aboutYou = json['about_you'];
    profileCompletedUpTo = json['profile_completed_up_to'];
    isProfileCompleted = json['is_profile_completed'];
    profilePictureUrl = json['profile_picture_url'];
    businessLogoUrl = json['business_logo_url'];
    bannerPictureUrl = json['banner_picture_url'];
    if (json['media'] != null) {
      media = new List<Media>();
      json['media'].forEach((v) {
        media.add(new Media.fromJson(v));
      });
    }
    if (json['industries'] != null) {
      industries = new List<Industries>();
      json['industries'].forEach((v) {
        industries.add(new Industries.fromJson(v));
      });
    }
    socialUrls = json['social_urls'] != null
        ? new SocialUrls.fromJson(json['social_urls'])
        : null;
    if (json['groups'] != null) {
      groups = new List<Groups>();
      json['groups'].forEach((v) {
        groups.add(new Groups.fromJson(v));
      });
    }
    accountType = json['account_type'];
    isCardSave = json['is_card_save'];
    hasOnBoardSeen = json['has_on_board_seen'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['refresh_token'] = this.refreshToken;
    data['user_id'] = this.userId;
    if (this.basicInfo != null) {
      data['basic_info'] = this.basicInfo.toJson();
    }
    data['application_type'] = this.applicationType;
    if (this.businessLocations != null) {
      data['business_locations'] =
          this.businessLocations.map((v) => v.toJson()).toList();
    }
    data['about_you'] = this.aboutYou;
    data['profile_completed_up_to'] = this.profileCompletedUpTo;
    data['is_profile_completed'] = this.isProfileCompleted;
    data['profile_picture_url'] = this.profilePictureUrl;
    data['business_logo_url'] = this.businessLogoUrl;
    data['banner_picture_url'] = this.bannerPictureUrl;
    if (this.media != null) {
      data['media'] = this.media.map((v) => v.toJson()).toList();
    }
    if (this.industries != null) {
      data['industries'] = this.industries.map((v) => v.toJson()).toList();
    }
    if (this.socialUrls != null) {
      data['social_urls'] = this.socialUrls.toJson();
    }
    if (this.groups != null) {
      data['groups'] = this.groups.map((v) => v.toJson()).toList();
    }
    data['account_type'] = this.accountType;
    data['is_card_save'] = this.isCardSave;
    data['has_on_board_seen'] = this.hasOnBoardSeen;
    return data;
  }
}

class BasicInfo {
  String firstName;
  String lastName;
  String businessName;
  String email;
  String phone;

  BasicInfo(
      {this.firstName,
        this.lastName,
        this.businessName,
        this.email,
        this.phone});

  BasicInfo.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    businessName = json['business_name'];
    email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['business_name'] = this.businessName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    return data;
  }
}

class BusinessLocations {
  String id;
  String name;
  String street;
  String streetAlt;
  String city;
  String state;
  String zip;
  String lat;
  String lng;
  String phone;
  bool isPrimary;

  BusinessLocations(
      {this.id,
        this.name,
        this.street,
        this.streetAlt,
        this.city,
        this.state,
        this.zip,
        this.lat,
        this.lng,
        this.phone,
        this.isPrimary});

  BusinessLocations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    street = json['street'];
    streetAlt = json['street_alt'];
    city = json['city'];
    state = json['state'];
    zip = json['zip'];
    lat = json['lat'];
    lng = json['lng'];
    phone = json['phone'];
    isPrimary = json['is_primary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['street'] = this.street;
    data['street_alt'] = this.streetAlt;
    data['city'] = this.city;
    data['state'] = this.state;
    data['zip'] = this.zip;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['phone'] = this.phone;
    data['is_primary'] = this.isPrimary;
    return data;
  }
}

class Media {
  String id;
  String url;
  String type;

  Media({this.id, this.url, this.type});

  Media.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    data['type'] = this.type;
    return data;
  }
}

class Industries {
  int id;
  String name;
  String description;

  Industries({this.id, this.name, this.description});

  Industries.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    return data;
  }
}

class SocialUrls {
  String companyUrl;
  String facebookUrl;
  String instagramUrl;
  String twitterUrl;
  String youtubeUrl;
  bool shareSocialUrl;

  SocialUrls(
      {this.companyUrl,
        this.facebookUrl,
        this.instagramUrl,
        this.twitterUrl,
        this.youtubeUrl,
        this.shareSocialUrl});

  SocialUrls.fromJson(Map<String, dynamic> json) {
    companyUrl = json['company_url'];
    facebookUrl = json['facebook_url'];
    instagramUrl = json['instagram_url'];
    twitterUrl = json['twitter_url'];
    youtubeUrl = json['youtube_url'];
    shareSocialUrl = json['share_social_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['company_url'] = this.companyUrl;
    data['facebook_url'] = this.facebookUrl;
    data['instagram_url'] = this.instagramUrl;
    data['twitter_url'] = this.twitterUrl;
    data['youtube_url'] = this.youtubeUrl;
    data['share_social_url'] = this.shareSocialUrl;
    return data;
  }
}

class Groups {
  int id;
  String name;

  Groups({this.id, this.name});

  Groups.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class BusinessLocation {
  String  city;
  String id;
  bool is_primary;
  String lat;
  String lng;
  String name;
  String phone;
  String state;
  String street;
  String street_alt;
  String zip;

  BusinessLocation({this.city, this.id, this.is_primary, this.lat, this.lng, this.name, this.phone, this.state, this.street, this.street_alt, this.zip});

  factory BusinessLocation.fromJson(Map<String, dynamic> json) {
    return BusinessLocation(
      city: json['city'],
      id: json['id'],
      is_primary: json['is_primary'],
      lat: json['lat'],
      lng: json['lng'],
      name: json['name'],
      phone: json['phone'],
      state: json['state'],
      street: json['street'],
      street_alt: json['street_alt'],
      zip: json['zip'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['is_primary'] = this.is_primary;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['state'] = this.state;
    data['street'] = this.street;
    data['street_alt'] = this.street_alt;
    data['zip'] = this.zip;
    data['city'] = this.city;


    return data;
  }
}

