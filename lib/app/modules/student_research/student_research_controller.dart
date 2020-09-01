import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'student_research_controller.g.dart';

@Injectable()
class StudentResearchController = _StudentResearchControllerBase
    with _$StudentResearchController;

abstract class _StudentResearchControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
