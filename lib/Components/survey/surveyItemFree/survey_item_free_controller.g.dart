// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_item_free_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $SurveyItemFreeController = BindInject(
  (i) => SurveyItemFreeController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SurveyItemFreeController on _SurveyItemFreeControllerBase, Store {
  final _$valueAtom = Atom(name: '_SurveyItemFreeControllerBase.value');

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

  final _$_SurveyItemFreeControllerBaseActionController =
      ActionController(name: '_SurveyItemFreeControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_SurveyItemFreeControllerBaseActionController
        .startAction(name: '_SurveyItemFreeControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_SurveyItemFreeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
