import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'students_controller.g.dart';

@Injectable()
class StudentsController = _StudentsControllerBase with _$StudentsController;

abstract class _StudentsControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
