// Mocks generated by Mockito 5.4.4 from annotations
// in flutter_clean_architecture_template/test/helpers/test_mock.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:dartz/dartz.dart' as _i2;
import 'package:flutter/foundation.dart' as _i4;
import 'package:flutter/src/widgets/framework.dart' as _i3;
import 'package:flutter/src/widgets/notification_listener.dart' as _i15;
import 'package:flutter_clean_architecture_template/core/error/failure.dart'
    as _i7;
import 'package:flutter_clean_architecture_template/features/auth/data/datasources/auth_remote_datasources.dart'
    as _i12;
import 'package:flutter_clean_architecture_template/features/auth/data/models/login_response.dart'
    as _i14;
import 'package:flutter_clean_architecture_template/features/auth/data/models/register_response.dart'
    as _i13;
import 'package:flutter_clean_architecture_template/features/auth/domain/entities/login.dart'
    as _i8;
import 'package:flutter_clean_architecture_template/features/auth/domain/entities/register.dart'
    as _i10;
import 'package:flutter_clean_architecture_template/features/auth/domain/repositories/auth_repository.dart'
    as _i5;
import 'package:flutter_clean_architecture_template/features/auth/domain/usecases/post_login.dart'
    as _i9;
import 'package:flutter_clean_architecture_template/features/auth/domain/usecases/post_register.dart'
    as _i11;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeWidget_1 extends _i1.SmartFake implements _i3.Widget {
  _FakeWidget_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );

  @override
  String toString({_i4.DiagnosticLevel? minLevel = _i4.DiagnosticLevel.info}) =>
      super.toString();
}

class _FakeInheritedWidget_2 extends _i1.SmartFake
    implements _i3.InheritedWidget {
  _FakeInheritedWidget_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );

  @override
  String toString({_i4.DiagnosticLevel? minLevel = _i4.DiagnosticLevel.info}) =>
      super.toString();
}

class _FakeDiagnosticsNode_3 extends _i1.SmartFake
    implements _i4.DiagnosticsNode {
  _FakeDiagnosticsNode_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );

  @override
  String toString({
    _i4.TextTreeConfiguration? parentConfiguration,
    _i4.DiagnosticLevel? minLevel = _i4.DiagnosticLevel.info,
  }) =>
      super.toString();
}

/// A class which mocks [AuthRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthRepository extends _i1.Mock implements _i5.AuthRepository {
  MockAuthRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i2.Either<_i7.Failure, _i8.Login>> login(
          _i9.LoginParams? loginParams) =>
      (super.noSuchMethod(
        Invocation.method(
          #login,
          [loginParams],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, _i8.Login>>.value(
            _FakeEither_0<_i7.Failure, _i8.Login>(
          this,
          Invocation.method(
            #login,
            [loginParams],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, _i8.Login>>);

  @override
  _i6.Future<_i2.Either<_i7.Failure, _i10.Register>> register(
          _i11.RegisterParams? registerParams) =>
      (super.noSuchMethod(
        Invocation.method(
          #register,
          [registerParams],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, _i10.Register>>.value(
            _FakeEither_0<_i7.Failure, _i10.Register>(
          this,
          Invocation.method(
            #register,
            [registerParams],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, _i10.Register>>);
}

/// A class which mocks [AuthRemoteDatasource].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthRemoteDatasource extends _i1.Mock
    implements _i12.AuthRemoteDatasource {
  MockAuthRemoteDatasource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i2.Either<_i7.Failure, _i13.RegisterResponse>> register(
          _i11.RegisterParams? registerParams) =>
      (super.noSuchMethod(
        Invocation.method(
          #register,
          [registerParams],
        ),
        returnValue:
            _i6.Future<_i2.Either<_i7.Failure, _i13.RegisterResponse>>.value(
                _FakeEither_0<_i7.Failure, _i13.RegisterResponse>(
          this,
          Invocation.method(
            #register,
            [registerParams],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, _i13.RegisterResponse>>);

  @override
  _i6.Future<_i2.Either<_i7.Failure, _i14.LoginResponse>> login(
          _i9.LoginParams? loginParams) =>
      (super.noSuchMethod(
        Invocation.method(
          #login,
          [loginParams],
        ),
        returnValue:
            _i6.Future<_i2.Either<_i7.Failure, _i14.LoginResponse>>.value(
                _FakeEither_0<_i7.Failure, _i14.LoginResponse>(
          this,
          Invocation.method(
            #login,
            [loginParams],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, _i14.LoginResponse>>);
}

/// A class which mocks [BuildContext].
///
/// See the documentation for Mockito's code generation for more information.
class MockBuildContext extends _i1.Mock implements _i3.BuildContext {
  @override
  _i3.Widget get widget => (super.noSuchMethod(
        Invocation.getter(#widget),
        returnValue: _FakeWidget_1(
          this,
          Invocation.getter(#widget),
        ),
        returnValueForMissingStub: _FakeWidget_1(
          this,
          Invocation.getter(#widget),
        ),
      ) as _i3.Widget);

  @override
  bool get mounted => (super.noSuchMethod(
        Invocation.getter(#mounted),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  bool get debugDoingBuild => (super.noSuchMethod(
        Invocation.getter(#debugDoingBuild),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  _i3.InheritedWidget dependOnInheritedElement(
    _i3.InheritedElement? ancestor, {
    Object? aspect,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #dependOnInheritedElement,
          [ancestor],
          {#aspect: aspect},
        ),
        returnValue: _FakeInheritedWidget_2(
          this,
          Invocation.method(
            #dependOnInheritedElement,
            [ancestor],
            {#aspect: aspect},
          ),
        ),
        returnValueForMissingStub: _FakeInheritedWidget_2(
          this,
          Invocation.method(
            #dependOnInheritedElement,
            [ancestor],
            {#aspect: aspect},
          ),
        ),
      ) as _i3.InheritedWidget);

  @override
  void visitAncestorElements(_i3.ConditionalElementVisitor? visitor) =>
      super.noSuchMethod(
        Invocation.method(
          #visitAncestorElements,
          [visitor],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void visitChildElements(_i3.ElementVisitor? visitor) => super.noSuchMethod(
        Invocation.method(
          #visitChildElements,
          [visitor],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void dispatchNotification(_i15.Notification? notification) =>
      super.noSuchMethod(
        Invocation.method(
          #dispatchNotification,
          [notification],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i4.DiagnosticsNode describeElement(
    String? name, {
    _i4.DiagnosticsTreeStyle? style = _i4.DiagnosticsTreeStyle.errorProperty,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #describeElement,
          [name],
          {#style: style},
        ),
        returnValue: _FakeDiagnosticsNode_3(
          this,
          Invocation.method(
            #describeElement,
            [name],
            {#style: style},
          ),
        ),
        returnValueForMissingStub: _FakeDiagnosticsNode_3(
          this,
          Invocation.method(
            #describeElement,
            [name],
            {#style: style},
          ),
        ),
      ) as _i4.DiagnosticsNode);

  @override
  _i4.DiagnosticsNode describeWidget(
    String? name, {
    _i4.DiagnosticsTreeStyle? style = _i4.DiagnosticsTreeStyle.errorProperty,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #describeWidget,
          [name],
          {#style: style},
        ),
        returnValue: _FakeDiagnosticsNode_3(
          this,
          Invocation.method(
            #describeWidget,
            [name],
            {#style: style},
          ),
        ),
        returnValueForMissingStub: _FakeDiagnosticsNode_3(
          this,
          Invocation.method(
            #describeWidget,
            [name],
            {#style: style},
          ),
        ),
      ) as _i4.DiagnosticsNode);

  @override
  List<_i4.DiagnosticsNode> describeMissingAncestor(
          {required Type? expectedAncestorType}) =>
      (super.noSuchMethod(
        Invocation.method(
          #describeMissingAncestor,
          [],
          {#expectedAncestorType: expectedAncestorType},
        ),
        returnValue: <_i4.DiagnosticsNode>[],
        returnValueForMissingStub: <_i4.DiagnosticsNode>[],
      ) as List<_i4.DiagnosticsNode>);

  @override
  _i4.DiagnosticsNode describeOwnershipChain(String? name) =>
      (super.noSuchMethod(
        Invocation.method(
          #describeOwnershipChain,
          [name],
        ),
        returnValue: _FakeDiagnosticsNode_3(
          this,
          Invocation.method(
            #describeOwnershipChain,
            [name],
          ),
        ),
        returnValueForMissingStub: _FakeDiagnosticsNode_3(
          this,
          Invocation.method(
            #describeOwnershipChain,
            [name],
          ),
        ),
      ) as _i4.DiagnosticsNode);
}
