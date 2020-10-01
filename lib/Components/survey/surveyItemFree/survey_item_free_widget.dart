import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:studentcare/model/Question.dart';

import '../survey_controller.dart';

class SurveyItemFreeWidget extends StatefulWidget {
  final Question question;
  SurveyItemFreeWidget({this.question});
  @override
  _SurveyItemFreeWidgetState createState() => _SurveyItemFreeWidgetState();
}

class _SurveyItemFreeWidgetState extends State<SurveyItemFreeWidget> {
  var _choose;
  final textEditingController = TextEditingController();
  @override
  void initState() {
    textEditingController.text =
        widget.question.answer == null ? '' : widget.question.answer;
    _choose = textEditingController.text;
    print('');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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

    final response = TextField(
      controller: textEditingController,
      onChanged: (value) {
        setState(() {
          _choose = value;
          widget.question.answer = value;
        });
      },
      keyboardType: TextInputType.multiline,
      maxLines: 5,
      decoration:
          InputDecoration.collapsed(hintText: 'Digite sua resposta aqui'),
    );

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
        SizedBox(
          child: response,
          height: 100,
          width: 300,
        ),
        continueButton,
        surveyController.currentWidget > 0 ? backButton : Container()
      ],
    );
  }
}
