import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:requests/requests.dart';
import 'package:studentcare/Util/MySharedPreferences.dart';
import 'package:studentcare/model/Survey.dart';
import 'package:studentcare/model/SurveyResponse.dart';

import '../../app_controller.dart';

part 'student_controller.g.dart';

@Injectable()
class StudentController = _StudentControllerBase with _$StudentController;

abstract class _StudentControllerBase with Store {
  @observable
  ObservableList<Survey> surveys = ObservableList<Survey>();

  @action
  void loadSurvey() {
    final homeController = Modular.get<AppController>();
    Future<String> ip = MySharedPreferences.getIP();
    ip.then((value) => homeController.ipSaved = value);
    final response = Requests.get('http://${homeController.ipSaved}/survey/');

    response.then(
      (value) {
        final List<Survey> localSurveys = [];
        if (value.statusCode == 200) {
          for (var item in value.json()) {
            final survey = Survey();
            survey.fromJson(item);
            localSurveys.add(survey);
          }

          final response2 = Requests.get(
              'http://${homeController.ipSaved}/student/${homeController.id}/survey/');

          response2.then(
            (value) {
              if (value.statusCode == 200) {
                surveys.clear();
                for (var item in value.json()) {
                  final answer = SurveyResponse.fromJson(item);
                  for (var i = 0; i < localSurveys.length; i++) {
                    if (localSurveys.elementAt(i).id == answer.id) {
                      localSurveys.elementAt(i).done = true;
                      break;
                    }
                  }
                }
                this.surveys = localSurveys.asObservable();
              }
            },
          );
        }
      },
    );
  }
}
