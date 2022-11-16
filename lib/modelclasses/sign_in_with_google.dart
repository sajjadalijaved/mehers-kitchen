import 'dart:convert';

class SignInWithGoogleModel {
  String? email;
  String? loginBy;
  SignInWithGoogleModel({
    this.email,
    this.loginBy,
  });

  factory SignInWithGoogleModel.fromJson(String str) =>
      SignInWithGoogleModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SignInWithGoogleModel.fromMap(Map<String, dynamic> json) =>
      SignInWithGoogleModel(
        email: json["Email"],
        loginBy: json["LoginBy"],
      );

  Map<String, dynamic> toMap() => {
        "Email": email,
        "LoginBy": loginBy,
      };
}
