import 'info/info_controller.dart';
import 'students/students_controller.dart';
import 'institution_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'institution_page.dart';

class InstitutionModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $InfoController,
        $StudentsController,
        $InstitutionController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => InstitutionPage()),
      ];

  static Inject get to => Inject<InstitutionModule>.of();
}
