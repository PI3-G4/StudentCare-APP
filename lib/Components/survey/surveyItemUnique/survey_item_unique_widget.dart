import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:studentcare/Components/survey/surveyItemUnique/survey_item_unique_controller.dart';
import 'package:studentcare/Components/survey/survey_controller.dart';
import 'package:studentcare/model/Question.dart';

class SurveyItemUniqueWidget extends StatelessWidget {
  final Question question;
  SurveyItemUniqueWidget({this.question});
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        final myThingsController = Modular.get<SurveyItemUniqueController>();
        final surveyController = Modular.get<SurveyController>();
        final continueButton = GFButton(
          onPressed:
              myThingsController.choose.isNotEmpty || !this.question.obligatory
                  ? surveyController.nextWidget
                  : null,
          text: 'Continuar',
        );
        final backButton = GFButton(
          onPressed: surveyController.currentWidget > 0
              ? surveyController.previusWidget
              : null,
          text: 'Voltar',
        );

        final List<ListTile> alternatives = this
            .question
            .data
            .map((e) => ListTile(
                  title: Text(e),
                  leading: Radio(
                    value: e,
                    groupValue: myThingsController.choose,
                    onChanged: (value) => myThingsController.choose = value,
                  ),
                ))
            .toList();

        final textStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

        return Column(
          children: [
            SizedBox(height: 10),
            Text(
              this.question.name,
              style: textStyle,
            ),
            SizedBox(height: 10),
            ...alternatives,
            continueButton,
            surveyController.currentWidget > 0 ? backButton : Container()
          ],
        );
      },
    );
  }
}
