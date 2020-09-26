import '../Components/survey/survey_controller.dart';
import 'package:studentcare/app/modules/institution/institution_module.dart';
import 'package:studentcare/app/modules/institution_new_student/institution_new_student_module.dart';
import 'package:studentcare/app/modules/new_institution/new_institution_module.dart';
import 'package:studentcare/app/modules/student/student_module.dart';
import 'package:studentcare/app/modules/student_research/student_research_module.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:studentcare/app/app_widget.dart';
import 'package:studentcare/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        $SurveyController,
        $AppController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: HomeModule()),
        ModularRouter('/new_instituition',
            module: NewInstitutionModule(), transition: TransitionType.fadeIn),
        ModularRouter('/instituition',
            module: InstitutionModule(), transition: TransitionType.fadeIn),
        ModularRouter('/instituition_new_student',
            module: InstitutionNewStudentModule(),
            transition: TransitionType.fadeIn),
        ModularRouter('/student',
            module: StudentModule(), transition: TransitionType.fadeIn),
        ModularRouter('/student_research',
            module: StudentResearchModule(), transition: TransitionType.fadeIn),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
