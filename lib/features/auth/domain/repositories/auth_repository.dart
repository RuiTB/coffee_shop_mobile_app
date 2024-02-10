import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_template/core/error/failure.dart';
import 'package:flutter_clean_architecture_template/features/auth/domain/entities/login.dart';
import 'package:flutter_clean_architecture_template/features/auth/domain/entities/register.dart';
import 'package:flutter_clean_architecture_template/features/auth/domain/usecases/post_login.dart';
import 'package:flutter_clean_architecture_template/features/auth/domain/usecases/post_register.dart';

abstract class AuthRepository {
  Future<Either<Failure, Login>> login(LoginParams loginParams);

  Future<Either<Failure, Register>> register(RegisterParams registerParams);
}
