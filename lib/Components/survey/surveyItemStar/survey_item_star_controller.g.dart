// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_item_star_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $SurveyItemStarController = BindInject(
  (i) => SurveyItemStarController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SurveyItemStarController on _SurveyItemStarControllerBase, Store {
  final _$valueAtom = Atom(name: '_SurveyItemStarControllerBase.value');

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

  final _$_SurveyItemStarControllerBaseActionController =
      ActionController(name: '_SurveyItemStarControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_SurveyItemStarControllerBaseActionController
        .startAction(name: '_SurveyItemStarControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_SurveyItemStarControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
