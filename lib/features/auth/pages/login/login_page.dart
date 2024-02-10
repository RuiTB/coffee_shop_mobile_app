import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture_template/core/app_route.dart';
import 'package:flutter_clean_architecture_template/core/resources/dimens.dart';
import 'package:flutter_clean_architecture_template/core/resources/images.dart';
import 'package:flutter_clean_architecture_template/core/widgets/button.dart';
import 'package:flutter_clean_architecture_template/core/widgets/button_text.dart';
import 'package:flutter_clean_architecture_template/core/widgets/parent.dart';
import 'package:flutter_clean_architecture_template/core/widgets/spacer_v.dart';
import 'package:flutter_clean_architecture_template/core/widgets/text_f.dart';
import 'package:flutter_clean_architecture_template/features/auth/domain/usecases/post_login.dart';
import 'package:flutter_clean_architecture_template/features/auth/pages/login/cubit/auth_cubit.dart';
import 'package:flutter_clean_architecture_template/utils/ext/context.dart';
import 'package:flutter_clean_architecture_template/utils/ext/string.dart';
import 'package:go_router/go_router.dart';

///*********************************************
///  flutter_clean_architecture_template |
///  login_page.dart
/// --------------------------------------------
/// Created by Mudassir 🧑🏻‍💻 @ lazycatlabs.com
/// on 📅 13/09/21 🕰 21:21 with ❤️
/// ✉️ : hey.mudassir@gmail.com
/// 🚀 : https://www.github.com/Lzyct
/// 🌐 : https://www.lazycatlabs.com
///*********************************************
/// © 2021 | All Right Reserved
class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  /// Controller
  final _conEmail = TextEditingController();
  final _conPassword = TextEditingController();

  /// Focus Node
  final _fnEmail = FocusNode();
  final _fnPassword = FocusNode();

  /// Global key
  final _keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Parent(
      child: BlocListener<AuthCubit, AuthState>(
        listener: (_, state) {
          state.whenOrNull(
            loading: () => context.show(),
            success: (data) {
              context.dismiss();
              data.toString().toToastSuccess(context);

              TextInput.finishAutofillContext();
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
              child: AutofillGroup(
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
                        autofillHints: const [AutofillHints.email],
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
                        hintText: "eve.holt@reqres.in",
                        hint: tr('email'),
                        validator: (String? value) => value != null
                            ? (!value.isValidEmail()
                                ? tr('errorInvalidEmail')
                                : null)
                            : null,
                      ),
                      BlocBuilder<AuthCubit, AuthState>(
                        builder: (_, state) {
                          return TextF(
                            autofillHints: const [AutofillHints.password],
                            key: const Key("password"),
                            curFocusNode: _fnPassword,
                            textInputAction: TextInputAction.done,
                            controller: _conPassword,
                            keyboardType: TextInputType.text,
                            prefixIcon: Icon(
                              Icons.lock_outline,
                              color:
                                  Theme.of(context).textTheme.bodyLarge?.color,
                            ),
                            obscureText:
                                context.read<AuthCubit>().isPasswordHide ??
                                    false,
                            hintText: '••••••••••••',
                            maxLine: 1,
                            hint: tr('password'),
                            suffixIcon: IconButton(
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                              onPressed: () =>
                                  context.read<AuthCubit>().showHidePassword(),
                              icon: Icon(
                                (context.read<AuthCubit>().isPasswordHide ??
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
                          );
                        },
                      ),
                      SpacerV(value: Dimens.space24),
                      Button(
                        title: tr('login'),
                        onPressed: () {
                          if (_keyForm.currentState?.validate() ?? false) {
                            context.read<AuthCubit>().login(
                                  LoginParams(
                                    email: _conEmail.text,
                                    password: _conPassword.text,
                                  ),
                                );
                          }
                        },
                      ),
                      ButtonText(
                        title: tr('askRegister'),
                        onPressed: () {
                          /// Direct to register page
                          context.pushNamed(Routes.register.name);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
