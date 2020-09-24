// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $SurveyController = BindInject(
  (i) => SurveyController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SurveyController on _SurveyControllerBase, Store {
  final _$currentWidgetAtom = Atom(name: '_SurveyControllerBase.currentWidget');

  @override
  int get currentWidget {
    _$currentWidgetAtom.reportRead();
    return super.currentWidget;
  }

  @override
  set currentWidget(int value) {
    _$currentWidgetAtom.reportWrite(value, super.currentWidget, () {
      super.currentWidget = value;
    });
  }

  final _$widgetsAtom = Atom(name: '_SurveyControllerBase.widgets');

  @override
  ObservableList<Widget> get widgets {
    _$widgetsAtom.reportRead();
    return super.widgets;
  }

  @override
  set widgets(ObservableList<Widget> value) {
    _$widgetsAtom.reportWrite(value, super.widgets, () {
      super.widgets = value;
    });
  }

  final _$surveyAtom = Atom(name: '_SurveyControllerBase.survey');

  @override
  Survey get survey {
    _$surveyAtom.reportRead();
    return super.survey;
  }

  @override
  set survey(Survey value) {
    _$surveyAtom.reportWrite(value, super.survey, () {
      super.survey = value;
    });
  }

  final _$sendDataAsyncAction = AsyncAction('_SurveyControllerBase.sendData');

  @override
  Future sendData() {
    return _$sendDataAsyncAction.run(() => super.sendData());
  }

  final _$_SurveyControllerBaseActionController =
      ActionController(name: '_SurveyControllerBase');

  @override
  void nextWidget() {
    final _$actionInfo = _$_SurveyControllerBaseActionController.startAction(
        name: '_SurveyControllerBase.nextWidget');
    try {
      return super.nextWidget();
    } finally {
      _$_SurveyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void previusWidget() {
    final _$actionInfo = _$_SurveyControllerBaseActionController.startAction(
        name: '_SurveyControllerBase.previusWidget');
    try {
      return super.previusWidget();
    } finally {
      _$_SurveyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentWidget: ${currentWidget},
widgets: ${widgets},
survey: ${survey}
    ''';
  }
}
