import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_template/core/error/failure.dart';
import 'package:flutter_clean_architecture_template/core/usecase/usecase.dart';
import 'package:flutter_clean_architecture_template/features/auth/domain/entities/register.dart';
import 'package:flutter_clean_architecture_template/features/auth/domain/repositories/auth_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_register.freezed.dart';
part 'post_register.g.dart';

class PostRegister extends UseCase<Register, RegisterParams> {
  final AuthRepository _repo;

  PostRegister(this._repo);

  @override
  Future<Either<Failure, Register>> call(RegisterParams params) =>
      _repo.register(params);
}

@freezed
class RegisterParams with _$RegisterParams {
  const factory RegisterParams({
    @Default("") String email,
    @Default("") String password,
  }) = _RegisterParams;

  factory RegisterParams.fromJson(Map<String, dynamic> json) =>
      _$RegisterParamsFromJson(json);
}
