import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:studentcare/Components/survey/survey_controller.dart';
import 'package:studentcare/app/modules/student/student_controller.dart';

class SurveyFinalWidget extends StatelessWidget {
  void action() {
    final surveyController = Modular.get<SurveyController>();
    final studentController = Modular.get<StudentController>();
    surveyController.sendData();
    Modular.to.pop();
    studentController.loadSurvey();
  }

  @override
  Widget build(BuildContext context) {
    return GFButton(
      onPressed: action,
      text: "Enviar e finalizar",
    );
  }
}
