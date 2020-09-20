import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'survey_item_free_controller.g.dart';

@Injectable()
class SurveyItemFreeController = _SurveyItemFreeControllerBase
    with _$SurveyItemFreeController;

abstract class _SurveyItemFreeControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
