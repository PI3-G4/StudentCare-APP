// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'institution_new_student_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $InstitutionNewStudentController = BindInject(
  (i) => InstitutionNewStudentController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$InstitutionNewStudentController
    on _InstitutionNewStudentControllerBase, Store {
  final _$nameAtom = Atom(name: '_InstitutionNewStudentControllerBase.name');

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

  final _$errorNameAtom =
      Atom(name: '_InstitutionNewStudentControllerBase.errorName');

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

  final _$emailAtom = Atom(name: '_InstitutionNewStudentControllerBase.email');

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
      Atom(name: '_InstitutionNewStudentControllerBase.errorEmail');

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

  final _$passwordAtom =
      Atom(name: '_InstitutionNewStudentControllerBase.password');

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

  final _$_InstitutionNewStudentControllerBaseActionController =
      ActionController(name: '_InstitutionNewStudentControllerBase');

  @override
  bool isNameValid() {
    final _$actionInfo = _$_InstitutionNewStudentControllerBaseActionController
        .startAction(name: '_InstitutionNewStudentControllerBase.isNameValid');
    try {
      return super.isNameValid();
    } finally {
      _$_InstitutionNewStudentControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  bool isEmailValid() {
    final _$actionInfo = _$_InstitutionNewStudentControllerBaseActionController
        .startAction(name: '_InstitutionNewStudentControllerBase.isEmailValid');
    try {
      return super.isEmailValid();
    } finally {
      _$_InstitutionNewStudentControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void generatePassword() {
    final _$actionInfo =
        _$_InstitutionNewStudentControllerBaseActionController.startAction(
            name: '_InstitutionNewStudentControllerBase.generatePassword');
    try {
      return super.generatePassword();
    } finally {
      _$_InstitutionNewStudentControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
errorName: ${errorName},
email: ${email},
errorEmail: ${errorEmail},
password: ${password}
    ''';
  }
}
