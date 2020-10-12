import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/getwidget.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:studentcare/model/Question.dart';

import '../survey_controller.dart';

class SurveyItemRangeWidget extends StatefulWidget {
  final Question question;
  SurveyItemRangeWidget({this.question, Key key}) : super(key: key);
  @override
  _SurveyItemRangeWidgetState createState() => _SurveyItemRangeWidgetState();
}

class _SurveyItemRangeWidgetState extends State<SurveyItemRangeWidget> {
  final _range = [];
  var _canBeInicial;
  var _choose = "";

  @override
  void initState() {
    this.widget.question.data.forEach((element) {
      _range.add(element);
    });
    if (this.widget.question.answer != null) {
      this._canBeInicial = double.parse(this.widget.question.answer);
      this._choose = this._canBeInicial.ceil().toString();
    } else {
      _canBeInicial = double.parse(this._range.first);
    }
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
      initialValue: this._canBeInicial,
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
