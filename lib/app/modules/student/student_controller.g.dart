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
  final _$surveyToRespondAtom =
      Atom(name: '_StudentControllerBase.surveyToRespond');

  @override
  ObservableList<Survey> get surveyToRespond {
    _$surveyToRespondAtom.reportRead();
    return super.surveyToRespond;
  }

  @override
  set surveyToRespond(ObservableList<Survey> value) {
    _$surveyToRespondAtom.reportWrite(value, super.surveyToRespond, () {
      super.surveyToRespond = value;
    });
  }

  final _$surveyRespondedAtom =
      Atom(name: '_StudentControllerBase.surveyResponded');

  @override
  ObservableList<Survey> get surveyResponded {
    _$surveyRespondedAtom.reportRead();
    return super.surveyResponded;
  }

  @override
  set surveyResponded(ObservableList<Survey> value) {
    _$surveyRespondedAtom.reportWrite(value, super.surveyResponded, () {
      super.surveyResponded = value;
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
surveyToRespond: ${surveyToRespond},
surveyResponded: ${surveyResponded}
    ''';
  }
}
