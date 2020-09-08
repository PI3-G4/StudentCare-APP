// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $HomeController = BindInject(
  (i) => HomeController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$emailAtom = Atom(name: '_HomeControllerBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$errorEmailAtom = Atom(name: '_HomeControllerBase.errorEmail');

  @override
  String get errorEmail {
    _$errorEmailAtom.reportRead();
    return super.errorEmail;
  }

  @override
  set errorEmail(String value) {
    _$errorEmailAtom.reportWrite(value, super.errorEmail, () {
      super.errorEmail = value;
    });
  }

  final _$passwordAtom = Atom(name: '_HomeControllerBase.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$errorPasswordAtom = Atom(name: '_HomeControllerBase.errorPassword');

  @override
  String get errorPassword {
    _$errorPasswordAtom.reportRead();
    return super.errorPassword;
  }

  @override
  set errorPassword(String value) {
    _$errorPasswordAtom.reportWrite(value, super.errorPassword, () {
      super.errorPassword = value;
    });
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  bool isEmailValid() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.isEmailValid');
    try {
      return super.isEmailValid();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool isPasswordValid() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.isPasswordValid');
    try {
      return super.isPasswordValid();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
errorEmail: ${errorEmail},
password: ${password},
errorPassword: ${errorPassword}
    ''';
  }
}
