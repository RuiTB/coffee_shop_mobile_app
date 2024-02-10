import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_architecture_template/features/auth/data/datasources/auth_remote_datasources.dart';
import 'package:flutter_clean_architecture_template/features/auth/domain/repositories/auth_repository.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  AuthRepository,
  AuthRemoteDatasource,
])
@GenerateNiceMocks([MockSpec<BuildContext>()])
void main() {}
