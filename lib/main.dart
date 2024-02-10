import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clean_architecture_template/app.dart';
import 'package:flutter_clean_architecture_template/dependencies_injection.dart';
import 'package:flutter_clean_architecture_template/utils/services/firebase/firebase_services.dart';
import 'package:flutter_config/flutter_config.dart';

void main() {
  runZonedGuarded(
    /// Lock device orientation to portrait
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await FlutterConfig.loadEnvVariables();

      /// Register Service locator
      await serviceLocator();
      await FirebaseServices.init();

      await EasyLocalization.ensureInitialized();

      return SystemChrome.setPreferredOrientations(
        [
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ],
      ).then(
        (_) => runApp(
          EasyLocalization(
            supportedLocales: const [
              Locale('en'),
              Locale('ar'),
            ],
            path: 'assets/localization',
            fallbackLocale: const Locale('en'),
            useOnlyLangCode: true,
            child: App(),
          ),
        ),
      );
    },
    (error, stackTrace) async {
      FirebaseCrashlytics.instance.recordError(error, stackTrace);
    },
  );
}
