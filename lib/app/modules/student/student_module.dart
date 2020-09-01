import 'student_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'student_page.dart';

class StudentModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $StudentController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => StudentPage()),
      ];

  static Inject get to => Inject<StudentModule>.of();
}
