import 'package:happy_tech_mastering_api_with_flutter/core/end_points.dart';

class UserModel {
  final String name;
  final String profilePic;

  final String email;
  final String phone;
  final Map<String, dynamic> address;
  UserModel(
      {required this.name,
      required this.profilePic,
      required this.address,
      required this.email,
      required this.phone});
  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    return UserModel(
      name: jsonData['user'][ApiKeys().name],
      profilePic: jsonData['user'][ApiKeys().profilePic],
      address: jsonData['user'][ApiKeys().location],
      email: jsonData['user'][ApiKeys().email],
      phone: jsonData['user'][ApiKeys().phoneNumber],
    );
  }
}
