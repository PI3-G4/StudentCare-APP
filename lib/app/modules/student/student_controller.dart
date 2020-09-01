import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'student_controller.g.dart';

@Injectable()
class StudentController = _StudentControllerBase with _$StudentController;

abstract class _StudentControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
