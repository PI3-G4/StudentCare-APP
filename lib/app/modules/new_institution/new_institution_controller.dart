import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'new_institution_controller.g.dart';

@Injectable()
class NewInstitutionController = _NewInstitutionControllerBase
    with _$NewInstitutionController;

abstract class _NewInstitutionControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
