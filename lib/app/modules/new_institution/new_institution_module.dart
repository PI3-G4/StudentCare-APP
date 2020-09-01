import 'new_institution_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'new_institution_page.dart';

class NewInstitutionModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $NewInstitutionController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => NewInstitutionPage()),
      ];

  static Inject get to => Inject<NewInstitutionModule>.of();
}
