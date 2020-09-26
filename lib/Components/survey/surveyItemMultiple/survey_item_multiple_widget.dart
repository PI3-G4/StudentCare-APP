import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:studentcare/model/ItemMultiple.dart';
import 'package:studentcare/model/Question.dart';

import '../survey_controller.dart';

class SurveyItemMultipleWidget extends StatefulWidget {
  final Question question;
  final int limit;
  SurveyItemMultipleWidget({this.question, this.limit});
  @override
  _SurveyItemMultipleWidgetState createState() =>
      _SurveyItemMultipleWidgetState();
}

class _SurveyItemMultipleWidgetState extends State<SurveyItemMultipleWidget> {
  var _choices = <String>{};
  var _state = List<ItemMultiple>();

  @override
  void initState() {
    _state.clear();
    _choices.clear();
    this.widget.question.data.forEach((element) {
      final item = ItemMultiple(title: element);
      if (_state.contains(element)) {
        item.value = true;
      }
      _state.add(item);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final surveyController = Modular.get<SurveyController>();
    final continueButton = GFButton(
      onPressed: ((_choices.isNotEmpty &&
                  this.widget.question.obligatory &&
                  _choices.length > 0 &&
                  _choices.length <= widget.limit) ||
              !this.widget.question.obligatory)
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
    final alternatives = ListView.builder(
      itemCount: _state.length,
      itemBuilder: (context, index) {
        return CheckboxListTile(
          title: Text(_state.elementAt(index).title),
          value: _state.elementAt(index).value,
          onChanged: (value) {
            setState(() {
              _state.elementAt(index).value = value;
              value
                  ? _choices.add(_state.elementAt(index).title)
                  : _choices.remove(_state.elementAt(index).title);
              widget.question.answer = _choices.toString();
            });
          },
        );
      },
    );

    /*final List<CheckboxListTile> alternatives = this
        .widget
        .question
        .data
        .map((e) => CheckboxListTile(
              title: Text(e),
              value: _state[e],
              onChanged: (value) {
                setState(() {
                  _state[e] = value;
                  value ? _choices.add(e) : _choices.remove(e);
                  widget.question.answer = _choices.toString();
                });
              },
            ))
        .toList();*/

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
        Text("Selecione no máximo ${widget.limit} opções"),
        SizedBox(height: 10),
        Container(
          height: 200,
          width: 300,
          child: alternatives,
        ),
        continueButton,
        surveyController.currentWidget > 0 ? backButton : Container()
      ],
    );
  }
}
