import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:studentcare/app/app_controller.dart';
import 'institution_controller.dart';

class InstitutionPage extends StatefulWidget {
  final String title;
  const InstitutionPage({Key key, this.title = "Institution"})
      : super(key: key);

  @override
  _InstitutionPageState createState() => _InstitutionPageState();
}

class _InstitutionPageState
    extends ModularState<InstitutionPage, InstitutionController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        final homeController = Modular.get<AppController>();
        final drawer = Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Theme.of(context).accentColor),
                child: Center(
                  child: Text(
                    homeController.name,
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Configurações'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.link),
                title: Text('Sobre'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('Sair'),
                onTap: () {},
              ),
            ],
          ),
        );

        final bottomNavigationBar = BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.info), label: 'Informações'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: 'Estudantes')
          ],
          currentIndex: controller.selected,
          selectedItemColor: Colors.black,
          onTap: (index) => {controller.selected = index},
        );

        final floatingActionButton = FloatingActionButton(
          onPressed: () {
            Modular.to.pushNamed('/instituition_new_student');
          },
          child: Icon(Icons.add),
        );

        return Scaffold(
            appBar: AppBar(
              title: Text('StudentCare'),
            ),
            body: controller.pages.elementAt(controller.selected),
            bottomNavigationBar: bottomNavigationBar,
            drawer: drawer,
            floatingActionButton:
                controller.selected == 1 ? floatingActionButton : null);
      },
    );
  }
}
