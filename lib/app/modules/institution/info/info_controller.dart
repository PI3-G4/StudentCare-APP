import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:requests/requests.dart';
import 'package:studentcare/Util/MySharedPreferences.dart';
import 'package:studentcare/app/app_controller.dart';
import 'package:studentcare/model/InfoStudent.dart';

part 'info_controller.g.dart';

@Injectable()
class InfoController = _InfoControllerBase with _$InfoController;

abstract class _InfoControllerBase with Store {
  @observable
  ObservableList<InfoSurvey> surveys = ObservableList<InfoSurvey>();

  @action
  void loadInfo() {
    final homeController = Modular.get<AppController>();
    Future<String> ip = MySharedPreferences.getIP();
    ip.then((value) => homeController.ipSaved = value);
    final response = Requests.get(
        'http://${homeController.ipSaved}/student/${homeController.id}/surveys');

    response.then((value) {
      if (value.statusCode == 200) {
        surveys.clear();

        for (var item in value.json()) {
          final survey = InfoSurvey.fromJson(item);
          surveys.add(survey);
        }
      }
    });
  }
}
