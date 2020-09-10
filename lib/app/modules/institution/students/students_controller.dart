import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:requests/requests.dart';
import 'package:studentcare/Util/MySharedPreferences.dart';
import 'package:studentcare/app/modules/institution/students/Student.dart';

import '../../../app_controller.dart';

part 'students_controller.g.dart';

@Injectable()
class StudentsController = _StudentsControllerBase with _$StudentsController;

abstract class _StudentsControllerBase with Store {
  @observable
  ObservableList<Student> students = ObservableList<Student>();

  @action
  void loadStudents() {
    final homeController = Modular.get<AppController>();
    Future<String> ip = MySharedPreferences.getIP();
    ip.then((value) => homeController.ipSaved = value);
    final response = Requests.get(
        'http://${homeController.ipSaved}/institution/${homeController.id}/student');

    response.then((value) {
      if (value.statusCode == 200) {
        students.clear();
        for (var item in value.json()) {
          final student = Student();
          student.fromJson(item);
          students.add(student);
        }
      }
    });
  }
}
