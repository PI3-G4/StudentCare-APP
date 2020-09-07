// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'students_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $StudentsController = BindInject(
  (i) => StudentsController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StudentsController on _StudentsControllerBase, Store {
  final _$valueAtom = Atom(name: '_StudentsControllerBase.value');

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

  final _$_StudentsControllerBaseActionController =
      ActionController(name: '_StudentsControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_StudentsControllerBaseActionController.startAction(
        name: '_StudentsControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_StudentsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
