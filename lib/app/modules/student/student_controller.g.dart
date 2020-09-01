// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $StudentController = BindInject(
  (i) => StudentController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StudentController on _StudentControllerBase, Store {
  final _$valueAtom = Atom(name: '_StudentControllerBase.value');

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

  final _$_StudentControllerBaseActionController =
      ActionController(name: '_StudentControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_StudentControllerBaseActionController.startAction(
        name: '_StudentControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_StudentControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
