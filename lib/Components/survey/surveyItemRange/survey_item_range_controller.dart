import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'survey_item_range_controller.g.dart';

@Injectable()
class SurveyItemRangeController = _SurveyItemRangeControllerBase
    with _$SurveyItemRangeController;

abstract class _SurveyItemRangeControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
