import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/progress_bar/gf_progress_bar.dart';
import 'package:studentcare/Components/survey/survey_controller.dart';
import 'package:studentcare/app/app_controller.dart';
import 'package:studentcare/app/modules/student/student_controller.dart';
import 'package:studentcare/model/Survey.dart';

class SurveyWidget extends StatefulWidget {
  final Survey survey;
  SurveyWidget({this.survey});

  @override
  _SurveyWidgetState createState() => _SurveyWidgetState();
}

class _SurveyWidgetState extends State<SurveyWidget> {
  final surveyController = Modular.get<SurveyController>();
  final appController = Modular.get<AppController>();
  final studentController = Modular.get<StudentController>();

  @override
  void initState() {
    surveyController.currentWidget = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    surveyController.generateWidgets(widget.survey);

    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      content: Observer(
        builder: (_) {
          return Wrap(
            alignment: WrapAlignment.center,
            children: [
              GFProgressBar(
                lineHeight: 20,
                backgroundColor: Colors.black26,
                progressBarColor: GFColors.SUCCESS,
                percentage: (((surveyController.currentWidget + 1) * 100) /
                        surveyController.widgets.length) /
                    100,
              ),
              surveyController.widgets[surveyController.currentWidget],
            ],
          );
        },
      ),
    );
  }
}
