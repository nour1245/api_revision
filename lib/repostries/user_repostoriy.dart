import 'package:dartz/dartz.dart';
import 'package:happy_tech_mastering_api_with_flutter/cache/cache_helper.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/api_consumer.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/end_points.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/error/exceptions.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/functions/upload_pic_to_api.dart';
import 'package:happy_tech_mastering_api_with_flutter/models/signin_model.dart';
import 'package:happy_tech_mastering_api_with_flutter/models/signup_model.dart';
import 'package:happy_tech_mastering_api_with_flutter/models/user_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class UserRepostoriy {
  final ApiConsumer api;

  UserRepostoriy({required this.api});
  Future<Either<String, SignInModel>> signIn(
      String signInEmail, String signInPassword) async {
    try {
      final response = await api.post(
        EndPoints().signIn,
        data: {
          ApiKeys().email: signInEmail,
          ApiKeys().password: signInPassword,
        },
      );
      final user = SignInModel.fromJson(response);
      final decodedToken = JwtDecoder.decode(user.token);
      CacheHelper().saveData(key: ApiKeys().token, value: user.token);
      CacheHelper().saveData(
        key: ApiKeys().id,
        value: decodedToken[ApiKeys().id],
      );
      return Right(user);
    } on ServerExcption catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }

  Future<Either<String, SignupModel>> signUp(
    String signUpName,
    String signUpEmail,
    String signUpPhoneNumber,
    String signUpPassword,
    String confirmPassword,
    XFile profilePic,
  ) async {
    try {
      final response = await api.post(
        EndPoints().signUp,
        isFormData: true,
        data: {
          ApiKeys().name: signUpName,
          ApiKeys().email: signUpEmail,
          ApiKeys().phoneNumber: signUpPhoneNumber,
          ApiKeys().password: signUpPassword,
          ApiKeys().confirmPassword: confirmPassword,
          ApiKeys().location:
              '{"name":"methalfa","address":"meet halfa","coordinates":[30.1572709,31.224779]}',
          ApiKeys().profilePic: await uploadPicToApi(profilePic),
        },
      );
      final signupModel = SignupModel.fromJson(response);
      return Right(signupModel);
    } on ServerExcption catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }

  Future<Either<String, UserModel>> getUserProfile() async {
    try {
      final respons = await api.get(
        EndPoints.getUserDataEndpoint(
          CacheHelper().getData(key: 'id'),
        ),
      );
      return Right(
        UserModel.fromJson(respons),
      );
    } on ServerExcption catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }
}
