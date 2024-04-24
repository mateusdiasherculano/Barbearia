import 'package:firebase_auth/firebase_auth.dart';

class UserProfileModel {
  UserProfileModel({
    this.uid,
    this.email,
    this.profile,
  });
  factory UserProfileModel.fromUserCredential(UserCredential userCredential) {
    // Extrair os dados relevantes do UserCredential
    String userId = userCredential.user!.uid;
    String userEmail = userCredential.user!.email!;

    // Retornar uma nova instância de UserProfileModel
    return UserProfileModel(
      uid: userId,
      email: userEmail,
    );
  }

  UserProfileModel.fromJson(dynamic json) {
    uid = json['id'];
    email = json['email'];
    profile =
        json['profile'] != null ? Profile.fromJson(json['profile']) : null;
  }

  String? uid;
  String? email;
  Profile? profile;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = uid;
    map['email'] = email;
    if (profile != null) {
      map['profile'] = profile?.toJson();
    }
    return map;
  }
}

class Profile {
  Profile({
    this.uid,
    this.name,
    this.email,
    this.customerAppVersion,
  });
  Profile.fromJson(dynamic json) {
    uid = json['id'];
    name = json['name'];
    email = json['email'];
    customerAppVersion = json['customer_app_version'];
    mobilePlatform = json['mobile_platform'];
  }

  String? uid;
  String? name;
  String? email;
  String? customerAppVersion;
  String? mobilePlatform;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (uid != null) map['id'] = uid;
    if (name != null) map['name'] = name;
    if (email != null) map['email'] = email;
    if (customerAppVersion != null)
      map['customer_app_version'] = customerAppVersion;
    if (mobilePlatform != null) map['mobile_platform'] = mobilePlatform;
    return map;
  }
}
