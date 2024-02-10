import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture_template/core/resources/dimens.dart';
import 'package:flutter_clean_architecture_template/core/resources/images.dart';
import 'package:flutter_clean_architecture_template/core/widgets/button.dart';
import 'package:flutter_clean_architecture_template/core/widgets/my_appbar.dart';
import 'package:flutter_clean_architecture_template/core/widgets/parent.dart';
import 'package:flutter_clean_architecture_template/core/widgets/spacer_v.dart';
import 'package:flutter_clean_architecture_template/core/widgets/text_f.dart';
import 'package:flutter_clean_architecture_template/features/auth/domain/usecases/post_register.dart';
import 'package:flutter_clean_architecture_template/features/auth/pages/register/cubit/register_cubit.dart';
import 'package:flutter_clean_architecture_template/utils/ext/context.dart';
import 'package:flutter_clean_architecture_template/utils/ext/string.dart';
import 'package:go_router/go_router.dart';

///*********************************************
///  flutter_clean_architecture_template |
///  register_page.dart
/// --------------------------------------------
/// Created by Mudassir 🧑🏻‍💻 @ lazycatlabs.com
/// on 📅 13/09/21 🕰 21:21 with ❤️
/// ✉️ : hey.mudassir@gmail.com
/// 🚀 : https://www.github.com/Lzyct
/// 🌐 : https://www.lazycatlabs.com
///*********************************************
/// © 2021 | All Right Reserved
class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  /// Controller
  final _conEmail = TextEditingController();
  final _conPassword = TextEditingController();
  final _conPasswordRepeat = TextEditingController();

  /// Focus Node
  final _fnEmail = FocusNode();
  final _fnPassword = FocusNode();
  final _fnPasswordRepeat = FocusNode();

  /// Global key form
  final _keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Parent(
      appBar: const MyAppBar().call(),
      child: BlocListener<RegisterCubit, RegisterState>(
        listener: (_, state) {
          state.whenOrNull(
            loading: () => context.show(),
            success: (data) {
              context.dismiss();

              /// back to login page after register success
              context.pop();
            },
            failure: (message) {
              context.dismiss();
              message.toToastError(context);
            },
          );
        },
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(Dimens.space24),
              child: Form(
                key: _keyForm,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Theme.of(context).hintColor,
                      radius: Dimens.profilePicture + Dimens.space4,
                      child: CircleAvatar(
                        backgroundImage: AssetImage(Images.icLauncher),
                        radius: Dimens.profilePicture,
                      ),
                    ),
                    const SpacerV(),
                    TextF(
                      key: const Key("email"),
                      curFocusNode: _fnEmail,
                      nextFocusNode: _fnPassword,
                      textInputAction: TextInputAction.next,
                      controller: _conEmail,
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Icon(
                        Icons.alternate_email,
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                      ),
                      hintText: 'johndoe@gmail.com',
                      hint: tr('email'),
                      validator: (String? value) => value != null
                          ? (!value.isValidEmail()
                              ? tr('errorInvalidEmail')
                              : null)
                          : null,
                    ),
                    BlocBuilder<RegisterCubit, RegisterState>(
                      builder: (_, state) {
                        return Column(
                          children: [
                            TextF(
                              key: const Key("password"),
                              curFocusNode: _fnPassword,
                              nextFocusNode: _fnPasswordRepeat,
                              textInputAction: TextInputAction.next,
                              controller: _conPassword,
                              keyboardType: TextInputType.text,
                              prefixIcon: Icon(
                                Icons.lock_outline,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.color,
                              ),
                              obscureText: context
                                      .read<RegisterCubit>()
                                      .isPasswordHide ??
                                  false,
                              hintText: '••••••••••••',
                              maxLine: 1,
                              hint: tr('password'),
                              suffixIcon: IconButton(
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                                onPressed: () => context
                                    .read<RegisterCubit>()
                                    .showHidePassword(),
                                icon: Icon(
                                  (context
                                              .read<RegisterCubit>()
                                              .isPasswordHide ??
                                          false)
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                              ),
                              validator: (String? value) => value != null
                                  ? (value.length < 6
                                      ? tr('errorPasswordLength')
                                      : null)
                                  : null,
                              semantic: "password",
                            ),
                            TextF(
                              key: const Key("repeat_password"),
                              curFocusNode: _fnPasswordRepeat,
                              textInputAction: TextInputAction.done,
                              controller: _conPasswordRepeat,
                              keyboardType: TextInputType.text,
                              prefixIcon: Icon(
                                Icons.lock_outline,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.color,
                              ),
                              obscureText: context
                                      .read<RegisterCubit>()
                                      .isPasswordRepeatHide ??
                                  false,
                              hintText: '••••••••••••',
                              maxLine: 1,
                              hint: tr('passwordRepeat'),
                              suffixIcon: IconButton(
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                                onPressed: () => context
                                    .read<RegisterCubit>()
                                    .showHidePasswordRepeat(),
                                icon: Icon(
                                  (context
                                              .read<RegisterCubit>()
                                              .isPasswordRepeatHide ??
                                          false)
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                              ),
                              validator: (String? value) => value != null
                                  ? (value != _conPassword.text
                                      ? tr('errorPasswordNotMatch')
                                      : null)
                                  : null,
                              semantic: "repeat_password",
                            ),
                          ],
                        );
                      },
                    ),
                    SpacerV(value: Dimens.space24),
                    Button(
                      key: const Key("btn_register"),
                      title: tr('register'),
                      onPressed: () {
                        /// Validate form first
                        if (_keyForm.currentState?.validate() ?? false) {
                          context.read<RegisterCubit>().register(
                                RegisterParams(
                                  email: _conEmail.text,
                                  password: _conPassword.text,
                                ),
                              );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
