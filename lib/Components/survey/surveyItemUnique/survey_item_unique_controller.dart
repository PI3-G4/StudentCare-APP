import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'survey_item_unique_controller.g.dart';

@Injectable()
class SurveyItemUniqueController = _SurveyItemUniqueControllerBase
    with _$SurveyItemUniqueController;

abstract class _SurveyItemUniqueControllerBase with Store {
  @observable
  String choose = '';
}
