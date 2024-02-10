import 'dart:convert';

import 'package:flutter_clean_architecture_template/core/api/dio_client.dart';
import 'package:flutter_clean_architecture_template/core/api/list_api.dart';
import 'package:flutter_clean_architecture_template/core/error/failure.dart';
import 'package:flutter_clean_architecture_template/dependencies_injection.dart';
import 'package:flutter_clean_architecture_template/features/auth/data/datasources/auth_remote_datasources.dart';
import 'package:flutter_clean_architecture_template/features/auth/data/models/login_response.dart';
import 'package:flutter_clean_architecture_template/features/auth/data/models/register_response.dart';
import 'package:flutter_clean_architecture_template/features/auth/domain/usecases/post_login.dart';
import 'package:flutter_clean_architecture_template/features/auth/domain/usecases/post_register.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

import '../../../../../helpers/fake_path_provider_platform.dart';
import '../../../../../helpers/json_reader.dart';
import '../../../../../helpers/paths.dart';

void main() {
  late DioAdapter dioAdapter;
  late AuthRemoteDatasourceImpl dataSource;

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    PathProviderPlatform.instance = FakePathProvider();
    await serviceLocator(
      isUnitTest: true,
      prefixBox: 'auth_remote_datasource_test_',
    );
    dioAdapter = DioAdapter(dio: sl<DioClient>().dio);
    dataSource = AuthRemoteDatasourceImpl(sl<DioClient>());
  });

  group('register', () {
    const registerParams =
        RegisterParams(email: "eve.holt@reqres.in", password: "pistol");
    final registerModel = RegisterResponse.fromJson(
      json.decode(jsonReader(successRegisterPath)) as Map<String, dynamic>,
    );

    test(
      'should return register success model when response code is 200',
      () async {
        /// arrange
        dioAdapter.onPost(
          ListAPI.register,
          (server) => server.reply(
            200,
            json.decode(jsonReader(successRegisterPath)),
          ),
          data: registerParams.toJson(),
        );

        /// act
        final result = await dataSource.register(registerParams);

        /// assert
        result.fold(
          (l) => expect(l, null),
          (r) => expect(r, registerModel),
        );
      },
    );

    test(
      'should return register unsuccessful model when response code is 400',
      () async {
        /// arrange

        dioAdapter.onPost(
          ListAPI.register,
          (server) => server.reply(
            400,
            json.decode(jsonReader(unSuccessRegisterPath)),
          ),
          data: registerParams.toJson(),
        );

        /// act
        final result = await dataSource.register(registerParams);

        /// assert
        result.fold(
          (l) => expect(l, isA<ServerFailure>()),
          (r) => expect(r, null),
        );
      },
    );
  });

  group('login', () {
    const loginParams =
        LoginParams(email: "eve.holt@reqres.in", password: "cityslicka");
    final loginModel = LoginResponse.fromJson(
      json.decode(jsonReader(successLoginPath)) as Map<String, dynamic>,
    );

    test(
      'should return login success model when response code is 200',
      () async {
        /// arrange
        dioAdapter.onPost(
          ListAPI.login,
          (server) => server.reply(
            200,
            json.decode(jsonReader(successLoginPath)),
          ),
          data: loginParams.toJson(),
        );

        /// act
        final result = await dataSource.login(loginParams);

        /// assert
        result.fold(
          (l) => expect(l, null),
          (r) => expect(r, loginModel),
        );
      },
    );

    test(
      'should return login unsuccessful model when response code is 400',
      () async {
        /// arrange
        dioAdapter.onPost(
          ListAPI.login,
          (server) => server.reply(
            400,
            json.decode(jsonReader(unSuccessfulLoginPath)),
          ),
          data: loginParams.toJson(),
        );

        /// act
        final result = await dataSource.login(loginParams);

        /// assert
        result.fold(
          (l) => expect(l, isA<ServerFailure>()),
          (r) => expect(r, null),
        );
      },
    );
  });
}
