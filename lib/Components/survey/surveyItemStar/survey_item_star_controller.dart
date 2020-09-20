import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'survey_item_star_controller.g.dart';

@Injectable()
class SurveyItemStarController = _SurveyItemStarControllerBase
    with _$SurveyItemStarController;

abstract class _SurveyItemStarControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
