import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_template/core/error/failure.dart';
import 'package:flutter_clean_architecture_template/core/usecase/usecase.dart';
import 'package:flutter_clean_architecture_template/features/auth/domain/entities/login.dart';
import 'package:flutter_clean_architecture_template/features/auth/domain/repositories/auth_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_login.freezed.dart';
part 'post_login.g.dart';

class PostLogin extends UseCase<Login, LoginParams> {
  final AuthRepository _repo;

  PostLogin(this._repo);

  @override
  Future<Either<Failure, Login>> call(LoginParams params) =>
      _repo.login(params);
}

@freezed
class LoginParams with _$LoginParams {
  const factory LoginParams({
    @Default("") String email,
    @Default("") String password,
  }) = _LoginParams;

  factory LoginParams.fromJson(Map<String, dynamic> json) =>
      _$LoginParamsFromJson(json);
}
