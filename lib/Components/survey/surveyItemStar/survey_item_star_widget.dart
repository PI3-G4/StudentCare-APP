import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/components/rating/gf_rating.dart';
import 'package:studentcare/model/Question.dart';

import '../survey_controller.dart';

class SurveyItemStarWidget extends StatefulWidget {
  final Question question;
  SurveyItemStarWidget({this.question});
  @override
  _SurveyItemStarWidgetState createState() => _SurveyItemStarWidgetState();
}

class _SurveyItemStarWidgetState extends State<SurveyItemStarWidget> {
  var _choose;
  final _textController = TextEditingController(text: "3.0");

  @override
  void initState() {
    if (this.widget.question.answer == null) {
      _choose = 3.0;
      this.widget.question.answer = 3.0.toString();
    } else {
      _choose = double.parse(this.widget.question.answer);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final surveyController = Modular.get<SurveyController>();
    final continueButton = GFButton(
      onPressed: surveyController.nextWidget,
      text: 'Continuar',
    );
    final backButton = GFButton(
      onPressed: surveyController.currentWidget > 0
          ? surveyController.previusWidget
          : null,
      text: 'Voltar',
    );

    final stars = GFRating(
      value: _choose,
      controller: _textController,
      color: GFColors.SUCCESS,
      padding: EdgeInsets.all(10),
      allowHalfRating: false,
      onChanged: (rating) {
        setState(() {
          _choose = rating;
          this.widget.question.answer = rating.toString();
        });
      },
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
        stars,
        continueButton,
        surveyController.currentWidget > 0 ? backButton : Container()
      ],
    );
  }
}
