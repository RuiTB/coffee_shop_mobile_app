import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture_template/core/error/failure.dart';
import 'package:flutter_clean_architecture_template/features/auth/domain/entities/register.dart';
import 'package:flutter_clean_architecture_template/features/auth/domain/usecases/post_register.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_cubit.freezed.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final PostRegister _postRegister;

  /// Handle state visibility password
  bool? isPasswordHide = true;
  bool? isPasswordRepeatHide = true;

  RegisterCubit(this._postRegister) : super(const _Loading());

  void showHidePassword() {
    emit(const _Init());
    isPasswordHide = !(isPasswordHide ?? false);
    emit(const _ShowHidePassword());
  }

  void showHidePasswordRepeat() {
    emit(const _Init());
    isPasswordRepeatHide = !(isPasswordRepeatHide ?? false);
    emit(const _ShowHidePassword());
  }

  Future<void> register(RegisterParams params) async {
    emit(const _Loading());
    final data = await _postRegister.call(params);
    data.fold(
      (l) {
        if (l is ServerFailure) {
          emit(_Failure(l.message ?? ""));
        }
      },
      (r) => emit(_Success(r)),
    );
  }
}
