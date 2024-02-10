import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_template/features/auth/data/models/register_response.dart';
import 'package:flutter_clean_architecture_template/features/auth/domain/entities/register.dart';
import 'package:flutter_clean_architecture_template/features/auth/domain/usecases/post_register.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/json_reader.dart';
import '../../../../helpers/paths.dart';
import '../../../../helpers/test_mock.mocks.dart';

void main() {
  late MockAuthRepository mockAuthRepository;
  late PostRegister postRegister;
  late Register register;
  const registerParams =
      RegisterParams(email: 'test@gmail.com', password: 'password');

  setUp(() {
    register = RegisterResponse.fromJson(
      json.decode(jsonReader(successRegisterPath)) as Map<String, dynamic>,
    ).toEntity();
    mockAuthRepository = MockAuthRepository();
    postRegister = PostRegister(mockAuthRepository);
  });

  test("should get register from the repository", () async {
    /// arrange
    when(mockAuthRepository.register(registerParams))
        .thenAnswer((_) async => Right(register));

    /// act
    final result = await postRegister.call(registerParams);

    /// assert
    expect(result, equals(Right(register)));
  });
}
