import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture_template/core/app_route.dart';
import 'package:flutter_clean_architecture_template/core/resources/styles.dart';
import 'package:flutter_clean_architecture_template/dependencies_injection.dart';
import 'package:flutter_clean_architecture_template/features/auth/pages/login/cubit/auth_cubit.dart';
import 'package:flutter_clean_architecture_template/utils/helper/common.dart';
import 'package:flutter_clean_architecture_template/utils/helper/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );

    log.d(const String.fromEnvironment('ENV'));
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<AuthCubit>()),
      ],
      child: OKToast(
        child: ScreenUtilInit(
          /// Set screen size to make responsive
          /// Almost all device

          designSize: const Size(375, 667),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, __) {
            /// Pass context to appRoute
            AppRoute.setStream(context);

            return MaterialApp.router(
              routerConfig: AppRoute.router,
              localizationsDelegates: context.localizationDelegates,
              debugShowCheckedModeBanner: false,
              builder: (BuildContext context, Widget? child) {
                final MediaQueryData data = MediaQuery.of(context);

                return MediaQuery(
                  data: data.copyWith(
                    alwaysUse24HourFormat: true,
                    textScaler: TextScaler.noScaling,
                  ),
                  child: child!,
                );
              },
              title: Constants.get.appName,
              theme: themeLight(context),
              darkTheme: themeDark(context),
              locale: context.locale,
              supportedLocales: context.supportedLocales,
            );
          },
        ),
      ),
    );
  }
}
