import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_template/core/api/dio_client.dart';
import 'package:flutter_clean_architecture_template/core/api/list_api.dart';
import 'package:flutter_clean_architecture_template/core/error/failure.dart';
import 'package:flutter_clean_architecture_template/features/auth/data/models/login_response.dart';
import 'package:flutter_clean_architecture_template/features/auth/data/models/register_response.dart';
import 'package:flutter_clean_architecture_template/features/auth/domain/usecases/post_login.dart';
import 'package:flutter_clean_architecture_template/features/auth/domain/usecases/post_register.dart';

abstract class AuthRemoteDatasource {
  Future<Either<Failure, RegisterResponse>> register(
    RegisterParams registerParams,
  );

  Future<Either<Failure, LoginResponse>> login(LoginParams loginParams);
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final DioClient _client;

  AuthRemoteDatasourceImpl(this._client);

  @override
  Future<Either<Failure, RegisterResponse>> register(
    RegisterParams registerParams,
  ) async {
    final response = await _client.postRequest(
      ListAPI.register,
      data: registerParams.toJson(),
      converter: (response) =>
          RegisterResponse.fromJson(response as Map<String, dynamic>),
    );

    return response;
  }

  @override
  Future<Either<Failure, LoginResponse>> login(LoginParams loginParams) async {
    final response = await _client.postRequest(
      ListAPI.login,
      data: loginParams.toJson(),
      converter: (response) =>
          LoginResponse.fromJson(response as Map<String, dynamic>),
    );

    return response;
  }
}
