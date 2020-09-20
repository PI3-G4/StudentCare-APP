import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:studentcare/Components/survey/surveyItemUnique/survey_item_unique_widget.dart';
import 'package:studentcare/app/modules/student/student_controller.dart';
import 'package:studentcare/model/Survey.dart';

part 'survey_controller.g.dart';

@Injectable()
class SurveyController = _SurveyControllerBase with _$SurveyController;

abstract class _SurveyControllerBase with Store {
  @observable
  int currentWidget = 0;

  @observable
  ObservableList<Widget> widgets = ObservableList<Widget>();

  @action
  void nextWidget() {
    if (currentWidget + 1 < widgets.length) {
      currentWidget += 1;
    }
  }

  @action
  void previusWidget() {
    if (currentWidget - 1 > 0) {
      currentWidget -= 1;
    }
  }

  void generateWidgets(Survey survey) {
    for (var question in survey.questions) {
      if (question.type == 1) {
        widgets.add(
          SurveyItemUniqueWidget(
            question: question,
          ),
        );
      } else if (question.type == 2) {
      } else if (question.type == 3) {
      } else if (question.type == 4) {
      } else if (question.type == 5) {
      } else if (question.type == 6) {}
    }
  }
}
