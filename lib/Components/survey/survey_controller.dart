import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:requests/requests.dart';
import 'package:studentcare/Components/survey/surveyFinal/survey_final_widget.dart';
import 'package:studentcare/Components/survey/surveyItemMultiple/survey_item_multiple_widget.dart';
import 'package:studentcare/Components/survey/surveyItemUnique/survey_item_unique_widget.dart';
import 'package:studentcare/app/app_controller.dart';
import 'package:studentcare/model/Survey.dart';

import '../Alert.dart';

part 'survey_controller.g.dart';

@Injectable()
class SurveyController = _SurveyControllerBase with _$SurveyController;

abstract class _SurveyControllerBase with Store {
  @observable
  int currentWidget = 0;

  @observable
  ObservableList<Widget> widgets = ObservableList<Widget>();

  @observable
  Survey survey;

  @action
  void nextWidget() {
    if (currentWidget + 1 < widgets.length) {
      currentWidget += 1;
    }
  }

  @action
  void previusWidget() {
    if (currentWidget - 1 >= 0) {
      currentWidget -= 1;
    }
  }

  @action
  sendData() async {
    if (survey != null) {
      for (var i = 0; i < widgets.length; i++) {
        final widget = widgets.elementAt(i);
        if (widget is SurveyItemUniqueWidget) {
          survey.questions.elementAt(i).answer = widget.question.answer;
        }
      }

      final appController = Modular.get<AppController>();

      try {
        final answers = [];
        survey.questions.forEach((element) {
          answers.add("\"${element.answer}\"");
        });
        final response = await Requests.post(
            'http://${appController.ipSaved}/surveystudents/',
            body: {
              'IDSURVEY': "${survey.id}",
              'IDSTUDENT': "${appController.id}",
              'json_data': "[${answers.join(',')}]"
              //'json_data': "{\"questions\":${jsonEncode(survey.questions)}}",
            },
            bodyEncoding: RequestBodyEncoding.JSON);
        if (response.statusCode == 201) {
          Modular.to.showDialog(
              barrierDismissible: true,
              builder: (_) => Alert(
                  content: 'Pesquisa respondida com sucesso',
                  title: 'Atenção'));
        } else {
          Modular.to.showDialog(
              barrierDismissible: true,
              builder: (_) => Alert(
                  content: 'Ocorreu um erro ao enviar os dados',
                  title: 'Erro'));
        }
      } catch (e) {
        Modular.to.showDialog(
            barrierDismissible: true,
            builder: (_) => Alert(
                content:
                    'http://${appController.ipSaved}/student\n ${e.toString()}',
                title: 'Erro'));
      }
    }
  }

  void generateWidgets(Survey survey) {
    widgets.clear();
    this.survey = survey;
    for (var question in survey.questions) {
      if (question.type == 1) {
        widgets.add(
          SurveyItemUniqueWidget(
            question: question,
          ),
        );
      } else if (question.type == 2) {
        widgets.add(
          SurveyItemMultipleWidget(
            question: question,
            limit: 2,
          ),
        );
      } else if (question.type == 3) {
        widgets.add(
          SurveyItemMultipleWidget(
            question: question,
            limit: 3,
          ),
        );
      } else if (question.type == 4) {
      } else if (question.type == 5) {
      } else if (question.type == 6) {}
    }
    widgets.add(SurveyFinalWidget());
  }
}
