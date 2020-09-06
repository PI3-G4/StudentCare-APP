// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_institution_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $NewInstitutionController = BindInject(
  (i) => NewInstitutionController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewInstitutionController on _NewInstitutionControllerBase, Store {
  final _$nameAtom = Atom(name: '_NewInstitutionControllerBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$errorNameAtom = Atom(name: '_NewInstitutionControllerBase.errorName');

  @override
  String get errorName {
    _$errorNameAtom.reportRead();
    return super.errorName;
  }

  @override
  set errorName(String value) {
    _$errorNameAtom.reportWrite(value, super.errorName, () {
      super.errorName = value;
    });
  }

  final _$emailAtom = Atom(name: '_NewInstitutionControllerBase.email');

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

  final _$errorEmailAtom =
      Atom(name: '_NewInstitutionControllerBase.errorEmail');

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

  final _$passwordAtom = Atom(name: '_NewInstitutionControllerBase.password');

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

  final _$errorPasswordAtom =
      Atom(name: '_NewInstitutionControllerBase.errorPassword');

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

  final _$_NewInstitutionControllerBaseActionController =
      ActionController(name: '_NewInstitutionControllerBase');

  @override
  bool isNameValid() {
    final _$actionInfo = _$_NewInstitutionControllerBaseActionController
        .startAction(name: '_NewInstitutionControllerBase.isNameValid');
    try {
      return super.isNameValid();
    } finally {
      _$_NewInstitutionControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool isEmailValid() {
    final _$actionInfo = _$_NewInstitutionControllerBaseActionController
        .startAction(name: '_NewInstitutionControllerBase.isEmailValid');
    try {
      return super.isEmailValid();
    } finally {
      _$_NewInstitutionControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool isPasswordValid() {
    final _$actionInfo = _$_NewInstitutionControllerBaseActionController
        .startAction(name: '_NewInstitutionControllerBase.isPasswordValid');
    try {
      return super.isPasswordValid();
    } finally {
      _$_NewInstitutionControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
errorName: ${errorName},
email: ${email},
errorEmail: ${errorEmail},
password: ${password},
errorPassword: ${errorPassword}
    ''';
  }
}
