import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_template/core/error/failure.dart';
import 'package:flutter_clean_architecture_template/dependencies_injection.dart';
import 'package:flutter_clean_architecture_template/features/auth/data/models/login_response.dart';
import 'package:flutter_clean_architecture_template/features/auth/domain/entities/login.dart';
import 'package:flutter_clean_architecture_template/features/auth/domain/usecases/post_login.dart';
import 'package:flutter_clean_architecture_template/features/auth/pages/login/cubit/auth_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

import '../../../../../helpers/fake_path_provider_platform.dart';
import '../../../../../helpers/json_reader.dart';
import '../../../../../helpers/paths.dart';
import 'auth_cubit_test.mocks.dart';

@GenerateMocks([PostLogin])
void main() {
  late AuthCubit authCubit;
  late Login login;
  late MockPostLogin mockPostLogin;

  const loginParams = LoginParams(
    email: "dummy@gmail.com",
    password: "dummyPassword",
  );
  const errorMessage = "Wrong username or password";

  /// Initialize data
  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    PathProviderPlatform.instance = FakePathProvider();
    await serviceLocator(isUnitTest: true, prefixBox: 'auth_cubit_test_');
    login = LoginResponse.fromJson(
      json.decode(jsonReader(successLoginPath)) as Map<String, dynamic>,
    ).toEntity();
    mockPostLogin = MockPostLogin();
    authCubit = AuthCubit(mockPostLogin);
  });

  /// Dispose bloc
  tearDown(() {
    authCubit.close();
  });

  ///  Initial data should be loading
  test("Initial data should be AuthStatus.loading", () {
    expect(authCubit.state, const AuthState.loading());
  });

  blocTest<AuthCubit, AuthState>(
    "When repo success get data should be return AuthState",
    build: () {
      when(mockPostLogin.call(loginParams))
          .thenAnswer((_) async => Right(login));

      return authCubit;
    },
    act: (cubit) => cubit.login(loginParams),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      const AuthState.loading(),
      AuthState.success(login.token),
    ],
  );

  blocTest<AuthCubit, AuthState>(
    "When user input wrong credential should be return ServerFailure",
    build: () {
      when(mockPostLogin.call(loginParams))
          .thenAnswer((_) async => const Left(ServerFailure(errorMessage)));

      return authCubit;
    },
    act: (AuthCubit authCubit) => authCubit.login(loginParams),
    wait: const Duration(milliseconds: 100),
    expect: () => const [
      AuthState.loading(),
      AuthState.failure(errorMessage),
    ],
  );
}
