import 'package:flutter_clean_architecture_template/core/api/dio_client.dart';
import 'package:flutter_clean_architecture_template/features/auth/data/datasources/auth_remote_datasources.dart';
import 'package:flutter_clean_architecture_template/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:flutter_clean_architecture_template/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_clean_architecture_template/features/auth/domain/usecases/post_login.dart';
import 'package:flutter_clean_architecture_template/features/auth/domain/usecases/post_register.dart';
import 'package:flutter_clean_architecture_template/features/auth/pages/login/cubit/auth_cubit.dart';
import 'package:flutter_clean_architecture_template/features/auth/pages/register/cubit/register_cubit.dart';
import 'package:flutter_clean_architecture_template/utils/services/hive/main_box.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

Future<void> serviceLocator({
  bool isUnitTest = false,
  bool isHiveEnable = true,
  String prefixBox = '',
}) async {
  /// For unit testing only
  if (isUnitTest) {
    await sl.reset();
  }
  sl.registerSingleton<DioClient>(DioClient(isUnitTest: isUnitTest));
  _dataSources();
  _repositories();
  _useCase();
  _cubit();
  if (isHiveEnable) {
    await _initHiveBoxes(
      isUnitTest: isUnitTest,
      prefixBox: prefixBox,
    );
  }
}

Future<void> _initHiveBoxes({
  bool isUnitTest = false,
  String prefixBox = '',
}) async {
  await MainBoxMixin.initHive(prefixBox);
  sl.registerSingleton<MainBoxMixin>(MainBoxMixin());
}

/// Register repositories
void _repositories() {
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(sl(), sl()),
  );
}

/// Register dataSources
void _dataSources() {
  sl.registerLazySingleton<AuthRemoteDatasource>(
    () => AuthRemoteDatasourceImpl(sl()),
  );
}

void _useCase() {
  /// Auth
  sl.registerLazySingleton(() => PostLogin(sl()));
  sl.registerLazySingleton(() => PostRegister(sl()));

  /// Users
}

void _cubit() {
  /// Auth
  sl.registerFactory(() => RegisterCubit(sl()));
  sl.registerFactory(() => AuthCubit(sl()));
}
