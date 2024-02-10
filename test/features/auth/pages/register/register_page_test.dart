import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture_template/core/resources/styles.dart';
import 'package:flutter_clean_architecture_template/dependencies_injection.dart';
import 'package:flutter_clean_architecture_template/features/auth/domain/usecases/post_register.dart';
import 'package:flutter_clean_architecture_template/features/auth/pages/register/cubit/register_cubit.dart';
import 'package:flutter_clean_architecture_template/features/auth/pages/register/register_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
// ignore: depend_on_referenced_packages
import 'package:mocktail/mocktail.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

import '../../../../helpers/fake_path_provider_platform.dart';
import '../../../../helpers/test_mock.mocks.dart';

class MockRegisterCubit extends MockCubit<RegisterState>
    implements RegisterCubit {}

class FakeRegisterState extends Fake implements RegisterState {}

void main() {
  late RegisterCubit registerCubit;
  late MockBuildContext context;

  setUpAll(() {
    HttpOverrides.global = null;
    registerFallbackValue(FakeRegisterState());
    registerFallbackValue(const RegisterParams());
  });

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    PathProviderPlatform.instance = FakePathProvider();
    await EasyLocalization.ensureInitialized();
    await serviceLocator(isUnitTest: true);
    context = MockBuildContext();
    registerCubit = MockRegisterCubit();
  });

  Widget rootWidget(Widget body) {
    return BlocProvider<RegisterCubit>.value(
      value: registerCubit,
      child: ScreenUtilInit(
        designSize: const Size(375, 667),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, __) => MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          locale: const Locale("en"),
          theme: themeLight(context),
          home: body,
        ),
      ),
    );
  }

  testWidgets(
    'renders RegisterPage for form validation blank',
    (tester) async {
      when(() => registerCubit.state)
          .thenReturn(const RegisterState.success(null));
      await tester.pumpWidget(rootWidget(RegisterPage()));
      await tester.pumpAndSettle();
      await tester.dragUntilVisible(
        find.byKey(const Key('btn_register')), // what you want to find
        find.byType(SingleChildScrollView), // widget you want to scroll
        const Offset(0, 50), // delta to move
      );

      /// validate email
      await tester.tap(find.byKey(const Key('btn_register')));
      await tester.pump(const Duration(milliseconds: 100));
      expect(find.text("Email is not valid"), findsOneWidget);
      expect(
        find.text("Password must be at least 6 characters"),
        findsOneWidget,
      );
    },
  );

  testWidgets(
    'renders RegisterPage for form validation fill email',
    (tester) async {
      const email = "test@gmail.com";

      when(() => registerCubit.state)
          .thenReturn(const RegisterState.success(null));

      await tester.pumpWidget(rootWidget(RegisterPage()));
      await tester.pumpAndSettle();
      await tester.enterText(find.byKey(const Key('email')), email);
      await tester.pumpAndSettle();
      await tester.dragUntilVisible(
        find.byKey(const Key('btn_register')), // what you want to find
        find.byType(SingleChildScrollView), // widget you want to scroll
        const Offset(0, 50), // delta to move
      );

      /// validate email
      await tester.tap(find.byKey(const Key('btn_register')));
      await tester.pump(const Duration(milliseconds: 100));
      expect(find.text("Email is not valid"), findsNothing);
      expect(
        find.text("Password must be at least 6 characters"),
        findsOneWidget,
      );
    },
  );

  testWidgets(
    'renders RegisterPage for form validation fill email,password',
    (tester) async {
      const email = "test@gmail.com";
      const password = "password";

      when(() => registerCubit.state)
          .thenReturn(const RegisterState.success(null));
      await tester.pumpWidget(rootWidget(RegisterPage()));
      await tester.pumpAndSettle();
      await tester.enterText(find.byKey(const Key('email')), email);
      await tester.enterText(find.byKey(const Key('password')), password);

      await tester.dragUntilVisible(
        find.byKey(const Key('btn_register')), // what you want to find
        find.byType(SingleChildScrollView), // widget you want to scroll
        const Offset(0, 50), // delta to move
      );

      /// validate email
      await tester.tap(find.byKey(const Key('btn_register')));
      await tester.pump(const Duration(milliseconds: 100));
      expect(find.text("Email is not valid"), findsNothing);
      expect(find.text("Password must be at least 6 characters"), findsNothing);
      expect(find.text("Password doesn't match"), findsOneWidget);
    },
  );

  testWidgets(
    'renders RegisterPage for form validation fill email,' +
        'password, repeat password (not match)',
    (tester) async {
      const email = "test@gmail.com";
      const password = "password";

      when(() => registerCubit.state)
          .thenReturn(const RegisterState.success(null));
      await tester.pumpWidget(rootWidget(RegisterPage()));
      await tester.pumpAndSettle();
      await tester.enterText(find.byKey(const Key('email')), email);
      await tester.enterText(find.byKey(const Key('password')), password);
      await tester.enterText(find.byKey(const Key('repeat_password')), '');

      await tester.pumpAndSettle();
      await tester.dragUntilVisible(
        find.byKey(const Key('btn_register')), // what you want to find
        find.byType(SingleChildScrollView), // widget you want to scroll
        const Offset(0, 50), // delta to move
      );

      /// validate email
      await tester.tap(find.byKey(const Key('btn_register')));
      await tester.pump(const Duration(milliseconds: 100));
      expect(find.text("Email is not valid"), findsNothing);
      expect(find.text("Password must be at least 6 characters"), findsNothing);
      expect(find.text("Password doesn't match"), findsOneWidget);
    },
  );

  testWidgets(
    'renders RegisterPage for form validation fill email,' +
        'password, repeat password ( match) and call register cubit',
    (tester) async {
      const email = "test@gmail.com";
      const password = "password";

      when(() => registerCubit.state).thenReturn(const RegisterState.loading());
      when(() => registerCubit.register(any())).thenAnswer((_) async {});

      await tester.pumpWidget(rootWidget(RegisterPage()));
      await tester.pumpAndSettle();
      await tester.enterText(find.byKey(const Key('email')), email);
      await tester.pumpAndSettle();
      await tester.enterText(find.byKey(const Key('password')), password);
      await tester.pumpAndSettle();
      await tester.enterText(
        find.byKey(const Key('repeat_password')),
        password,
      );
      await tester.pumpAndSettle();
      await tester.dragUntilVisible(
        find.byKey(const Key('btn_register')), // what you want to find
        find.byType(SingleChildScrollView), // widget you want to scroll
        const Offset(0, 50), // delta to move
      );

      /// validate email
      await tester.tap(find.byKey(const Key('btn_register')));
      await tester.pump(const Duration(milliseconds: 100));
      expect(find.text("Email is not valid"), findsNothing);
      expect(find.text("Password must be at least 6 characters"), findsNothing);
      expect(find.text("Password doesn't match"), findsNothing);

      for (int i = 0; i < 5; i++) {
        await tester.pump(const Duration(milliseconds: 100));
      }

      verify(() => registerCubit.register(any())).called(1);
    },
  );
}
