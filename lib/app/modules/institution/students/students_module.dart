import 'students_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'students_page.dart';

class StudentsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $StudentsController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => StudentsPage()),
      ];

  static Inject get to => Inject<StudentsModule>.of();
}
