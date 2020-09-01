import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'institution_new_student_controller.g.dart';

@Injectable()
class InstitutionNewStudentController = _InstitutionNewStudentControllerBase
    with _$InstitutionNewStudentController;

abstract class _InstitutionNewStudentControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
