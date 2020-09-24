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
  final _$surveysAtom = Atom(name: '_StudentControllerBase.surveys');

  @override
  ObservableList<Survey> get surveys {
    _$surveysAtom.reportRead();
    return super.surveys;
  }

  @override
  set surveys(ObservableList<Survey> value) {
    _$surveysAtom.reportWrite(value, super.surveys, () {
      super.surveys = value;
    });
  }

  final _$_StudentControllerBaseActionController =
      ActionController(name: '_StudentControllerBase');

  @override
  void loadSurvey() {
    final _$actionInfo = _$_StudentControllerBaseActionController.startAction(
        name: '_StudentControllerBase.loadSurvey');
    try {
      return super.loadSurvey();
    } finally {
      _$_StudentControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
surveys: ${surveys}
    ''';
  }
}
