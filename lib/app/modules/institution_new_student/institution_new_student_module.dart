import 'institution_new_student_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'institution_new_student_page.dart';

class InstitutionNewStudentModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $InstitutionNewStudentController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => InstitutionNewStudentPage()),
      ];

  static Inject get to => Inject<InstitutionNewStudentModule>.of();
}
