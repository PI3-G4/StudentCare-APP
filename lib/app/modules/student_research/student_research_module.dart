import 'student_research_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'student_research_page.dart';

class StudentResearchModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $StudentResearchController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => StudentResearchPage()),
      ];

  static Inject get to => Inject<StudentResearchModule>.of();
}
