import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/getwidget.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:studentcare/model/Question.dart';

import '../survey_controller.dart';

class SurveyItemRangeWidget extends StatefulWidget {
  final Question question;
  SurveyItemRangeWidget({this.question});
  @override
  _SurveyItemRangeWidgetState createState() => _SurveyItemRangeWidgetState();
}

class _SurveyItemRangeWidgetState extends State<SurveyItemRangeWidget> {
  final _range = [];
  var _choose = "";

  @override
  void initState() {
    this.widget.question.data.forEach((element) {
      _range.add(element);
    });
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

    final sleek = SleekCircularSlider(
      min: double.parse(_range.first),
      max: double.parse(_range.last),
      onChangeEnd: (value) {
        setState(() {
          _choose = value.ceil().toString();
          this.widget.question.answer = value.ceil().toString();
        });
      },
      appearance: CircularSliderAppearance(
          infoProperties: InfoProperties(
            modifier: (percentage) => "${percentage.ceil()}",
          ),
          customColors: CustomSliderColors(
            progressBarColor: GFColors.SUCCESS,
            trackColor: GFColors.PRIMARY,
            hideShadow: true,
          )),
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
        sleek,
        continueButton,
        surveyController.currentWidget > 0 ? backButton : Container()
      ],
    );
  }
}
