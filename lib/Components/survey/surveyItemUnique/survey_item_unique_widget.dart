import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:studentcare/Components/survey/survey_controller.dart';
import 'package:studentcare/model/Question.dart';

class SurveyItemUniqueWidget extends StatefulWidget {
  final Question question;
  SurveyItemUniqueWidget({this.question});

  @override
  _SurveyItemUniqueWidgetState createState() => _SurveyItemUniqueWidgetState();
}

class _SurveyItemUniqueWidgetState extends State<SurveyItemUniqueWidget> {
  String _choose = "";

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        //this._choose =
        //    widget.question.answer == null ? "" : widget.question.answer;
        final surveyController = Modular.get<SurveyController>();
        final continueButton = GFButton(
          onPressed: _choose.isNotEmpty || !this.widget.question.obligatory
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
            .widget
            .question
            .data
            .map((e) => ListTile(
                  title: Text(e),
                  leading: Radio(
                    value: e,
                    groupValue: _choose,
                    onChanged: (value) {
                      setState(() {
                        _choose = value;
                      });
                      this.widget.question.answer = value;
                    },
                  ),
                ))
            .toList();

        final textStyle = TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        );

        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            Text(
              this.widget.question.name,
              style: textStyle,
              textAlign: TextAlign.center,
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
