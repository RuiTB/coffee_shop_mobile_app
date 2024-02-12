import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clean_architecture_template/core/resources/dimens.dart';
import 'package:flutter_clean_architecture_template/core/resources/palette.dart';

/// Light theme
ThemeData themeLight(BuildContext context) => ThemeData(
      fontFamily: 'Sora',
      useMaterial3: true,
      primaryColor: Palette.coffeeBrown,
      disabledColor: Palette.dustyGray,
      scaffoldBackgroundColor: Palette.whiteSmoke,
      colorScheme: const ColorScheme.light().copyWith(
        primary: Palette.coffeeBrown,
        background: Palette.whiteSmoke,
      ),
      textTheme: TextTheme(
        displayLarge: Theme.of(context).textTheme.displayLarge?.copyWith(
              fontSize: Dimens.displayLarge,
              color: Palette.solidBlack,
              fontFamily: 'Sora',
            ),
        displayMedium: Theme.of(context).textTheme.displayMedium?.copyWith(
              fontSize: Dimens.displayMedium,
              color: Palette.gunmetalGray,
              fontFamily: 'Sora',
            ),
        displaySmall: Theme.of(context).textTheme.displaySmall?.copyWith(
              fontSize: Dimens.displaySmall,
              color: Palette.gunmetalGray,
              fontFamily: 'Sora',
            ),
        headlineMedium: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontSize: Dimens.headlineMedium,
              color: Palette.gunmetalGray,
              fontFamily: 'Sora',
            ),
        headlineSmall: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontSize: Dimens.headlineSmall,
              color: Palette.gunmetalGray,
              fontFamily: 'Sora',
            ),
        titleLarge: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontSize: Dimens.titleLarge,
              color: Palette.gunmetalGray,
              fontFamily: 'Sora',
            ),
        titleMedium: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontSize: Dimens.titleMedium,
              color: Palette.gunmetalGray,
              fontFamily: 'Sora',
            ),
        titleSmall: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontSize: Dimens.titleSmall,
              color: Palette.gunmetalGray,
              fontFamily: 'Sora',
            ),
        bodyLarge: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: Dimens.bodyLarge,
              color: Palette.gunmetalGray,
              fontFamily: 'Sora',
            ),
        bodyMedium: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: Dimens.bodyMedium,
              color: Palette.gunmetalGray,
              fontFamily: 'Sora',
            ),
        bodySmall: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: Dimens.bodySmall,
              color: Palette.gunmetalGray,
              fontFamily: 'Sora',
            ),
        labelLarge: Theme.of(context).textTheme.labelLarge?.copyWith(
              fontSize: Dimens.labelLarge,
              color: Palette.gunmetalGray,
              fontFamily: 'Sora',
            ),
        labelSmall: Theme.of(context).textTheme.labelSmall?.copyWith(
              fontSize: Dimens.labelSmall,
              letterSpacing: 0.25,
              color: Palette.gunmetalGray,
              fontFamily: 'Sora',
            ),
      ),
      appBarTheme: const AppBarTheme().copyWith(
        titleTextStyle: Theme.of(context).textTheme.bodyLarge,
        color: Palette.whiteSmoke,
        iconTheme: const IconThemeData(color: Palette.gunmetalGray),
        systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.transparent,
        ),
      ),
      bottomSheetTheme: const BottomSheetThemeData().copyWith(
        backgroundColor: Palette.snowWhite,
        surfaceTintColor: Colors.transparent,
        elevation: Dimens.zero,
      ),
      brightness: Brightness.light,
      iconTheme: const IconThemeData(color: Palette.coffeeBrown),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );

/// Dark theme
ThemeData themeDark(BuildContext context) =>
    themeLight(context).copyWith(brightness: Brightness.dark);
