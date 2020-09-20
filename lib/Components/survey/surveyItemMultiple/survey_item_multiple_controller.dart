import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'survey_item_multiple_controller.g.dart';

@Injectable()
class SurveyItemMultipleController = _SurveyItemMultipleControllerBase
    with _$SurveyItemMultipleController;

abstract class _SurveyItemMultipleControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
