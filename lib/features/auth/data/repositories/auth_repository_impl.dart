import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_template/core/error/failure.dart';
import 'package:flutter_clean_architecture_template/features/auth/data/datasources/auth_remote_datasources.dart';
import 'package:flutter_clean_architecture_template/features/auth/domain/entities/login.dart';
import 'package:flutter_clean_architecture_template/features/auth/domain/entities/register.dart';
import 'package:flutter_clean_architecture_template/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_clean_architecture_template/features/auth/domain/usecases/post_login.dart';
import 'package:flutter_clean_architecture_template/features/auth/domain/usecases/post_register.dart';
import 'package:flutter_clean_architecture_template/utils/services/hive/main_box.dart';

class AuthRepositoryImpl implements AuthRepository {
  /// Data Source
  final AuthRemoteDatasource authRemoteDatasource;
  final MainBoxMixin mainBoxMixin;

  const AuthRepositoryImpl(this.authRemoteDatasource, this.mainBoxMixin);

  @override
  Future<Either<Failure, Login>> login(LoginParams loginParams) async {
    final response = await authRemoteDatasource.login(loginParams);

    return response.fold(
      (failure) => Left(failure),
      (loginResponse) {
        mainBoxMixin.addData(MainBoxKeys.isLogin, true);
        mainBoxMixin.addData(MainBoxKeys.token, loginResponse.token);

        return Right(loginResponse.toEntity());
      },
    );
  }

  @override
  Future<Either<Failure, Register>> register(
    RegisterParams registerParams,
  ) async {
    final response = await authRemoteDatasource.register(registerParams);

    return response.fold(
      (failure) => Left(failure),
      (registerResponse) {
        return Right(registerResponse.toEntity());
      },
    );
  }
}
