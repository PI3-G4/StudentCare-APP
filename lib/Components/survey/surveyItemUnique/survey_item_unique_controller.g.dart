// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_item_unique_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $SurveyItemUniqueController = BindInject(
  (i) => SurveyItemUniqueController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SurveyItemUniqueController on _SurveyItemUniqueControllerBase, Store {
  final _$chooseAtom = Atom(name: '_SurveyItemUniqueControllerBase.choose');

  @override
  String get choose {
    _$chooseAtom.reportRead();
    return super.choose;
  }

  @override
  set choose(String value) {
    _$chooseAtom.reportWrite(value, super.choose, () {
      super.choose = value;
    });
  }

  @override
  String toString() {
    return '''
choose: ${choose}
    ''';
  }
}
