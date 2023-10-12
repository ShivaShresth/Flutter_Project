
import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    final int id;
    final String token;
    final String email;
    final String phonenumber;
    final String username;

    UserModel({
        required this.id,
        required this.token,
        required this.email,
        required this.phonenumber,
        required this.username,
    });

    UserModel copyWith({
        int? id,
        String? token,
        String? email,
        String? phonenumber,
        String? username,
    }) => 
        UserModel(
            id: id ?? this.id,
            token: token ?? this.token,
            email: email ?? this.email,
            phonenumber: phonenumber ?? this.phonenumber,
            username: username ?? this.username,
        );

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        token: json["token"],
        email: json["email"],
        phonenumber: json["phonenumber"],
        username: json["username"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "token": token,
        "email": email,
        "phonenumber": phonenumber,
        "username": username,
    };
}
