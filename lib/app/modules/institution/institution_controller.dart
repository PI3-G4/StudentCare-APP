import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:studentcare/app/modules/institution/info/info_page.dart';
import 'package:studentcare/app/modules/institution/students/students_page.dart';

part 'institution_controller.g.dart';

@Injectable()
class InstitutionController = _InstitutionControllerBase
    with _$InstitutionController;

abstract class _InstitutionControllerBase with Store {
  @observable
  int selected = 0;

  @observable
  var pages = ObservableList<Widget>.of([InfoPage(), StudentsPage()]);
}
