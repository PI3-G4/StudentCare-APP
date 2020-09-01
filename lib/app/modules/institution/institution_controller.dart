import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'institution_controller.g.dart';

@Injectable()
class InstitutionController = _InstitutionControllerBase
    with _$InstitutionController;

abstract class _InstitutionControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
