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
  final _$valueAtom = Atom(name: '_InstitutionNewStudentControllerBase.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$_InstitutionNewStudentControllerBaseActionController =
      ActionController(name: '_InstitutionNewStudentControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_InstitutionNewStudentControllerBaseActionController
        .startAction(name: '_InstitutionNewStudentControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_InstitutionNewStudentControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
