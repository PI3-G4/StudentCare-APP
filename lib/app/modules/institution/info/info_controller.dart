import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'info_controller.g.dart';

@Injectable()
class InfoController = _InfoControllerBase with _$InfoController;

abstract class _InfoControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
