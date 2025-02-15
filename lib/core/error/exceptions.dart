import 'package:dio/dio.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/error/error_model.dart';

class ServerExcption implements Exception {
  final ErrorModel errorModel;

  ServerExcption({required this.errorModel});
}

void handelDioException(DioException e) {
  switch (e.type) {
    case DioExceptionType.badResponse:
      switch (e.response!.statusCode) {
        case 400:
          throw ServerExcption(
            errorModel: ErrorModel.fromJosn(e.response!.data),
          );
        case 401:
          throw ServerExcption(
            errorModel: ErrorModel.fromJosn(e.response!.data),
          );
        case 402:
          throw ServerExcption(
            errorModel: ErrorModel.fromJosn(e.response!.data),
          );
        case 403:
          throw ServerExcption(
            errorModel: ErrorModel.fromJosn(e.response!.data),
          );
        case 404:
          throw ServerExcption(
            errorModel: ErrorModel.fromJosn(e.response!.data),
          );
        case 409:
          throw ServerExcption(
            errorModel: ErrorModel.fromJosn(e.response!.data),
          );
        case 422:
          throw ServerExcption(
            errorModel: ErrorModel.fromJosn(e.response!.data),
          );
        case 504:
          throw ServerExcption(
            errorModel: ErrorModel.fromJosn(e.response!.data),
          );
      }
    case DioExceptionType.connectionTimeout:
      throw ServerExcption(
        errorModel: ErrorModel.fromJosn(e.response!.data),
      );
    case DioExceptionType.sendTimeout:
      throw ServerExcption(
        errorModel: ErrorModel.fromJosn(e.response!.data),
      );
    case DioExceptionType.receiveTimeout:
      throw ServerExcption(
        errorModel: ErrorModel.fromJosn(e.response!.data),
      );
    case DioExceptionType.badCertificate:
      throw ServerExcption(
        errorModel: ErrorModel.fromJosn(e.response!.data),
      );
    case DioExceptionType.cancel:
      throw ServerExcption(
        errorModel: ErrorModel.fromJosn(e.response!.data),
      );
    case DioExceptionType.connectionError:
      throw ServerExcption(
        errorModel: ErrorModel.fromJosn(e.response!.data),
      );
    case DioExceptionType.unknown:
      throw ServerExcption(
        errorModel: ErrorModel.fromJosn(e.response!.data),
      );
  }
}
