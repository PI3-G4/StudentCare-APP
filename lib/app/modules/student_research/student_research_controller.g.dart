// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_research_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $StudentResearchController = BindInject(
  (i) => StudentResearchController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StudentResearchController on _StudentResearchControllerBase, Store {
  final _$valueAtom = Atom(name: '_StudentResearchControllerBase.value');

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

  final _$_StudentResearchControllerBaseActionController =
      ActionController(name: '_StudentResearchControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_StudentResearchControllerBaseActionController
        .startAction(name: '_StudentResearchControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_StudentResearchControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
