import 'package:happy_tech_mastering_api_with_flutter/models/user_model.dart';

class UserState {}

final class UserInitial extends UserState {}

final class SignInLoading extends UserState {}

final class SignInSuccses extends UserState {}

final class SignInError extends UserState {
  final String msg;

  SignInError({required this.msg});
}

final class SignUpLoading extends UserState {}

final class SignUpSuccses extends UserState {
  final String message;

  SignUpSuccses({required this.message});
}

final class SignUpError extends UserState {
  final String msg;

  SignUpError({required this.msg});
}

final class UploadProfilePic extends UserState {}

final class GetUserDataLoading extends UserState {}

final class GetUserDataSuccses extends UserState {
  final UserModel user;

  GetUserDataSuccses({required this.user});
}

final class GetUserDataError extends UserState {
  final String msg;

  GetUserDataError({required this.msg});
}

final class UpdateUserDataLoading extends UserState {}

final class UpdateUserDataSUccses extends UserState {}

final class UpdateUserDataError extends UserState {
  final String msg;

  UpdateUserDataError({required this.msg});
}
