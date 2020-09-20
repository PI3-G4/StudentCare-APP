import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:studentcare/Components/survey/survey_widget.dart';
import '../../app_controller.dart';
import 'student_controller.dart';

class StudentPage extends StatefulWidget {
  final String title;
  const StudentPage({Key key, this.title = "Student"}) : super(key: key);

  @override
  _StudentPageState createState() => _StudentPageState();
}

class _StudentPageState extends ModularState<StudentPage, StudentController> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    controller.loadSurvey();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      final appController = Modular.get<AppController>();
      final drawer = Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Theme.of(context).accentColor),
              child: Center(
                child: Text(
                  appController.name,
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
              onTap: () {
                SystemChannels.platform.invokeMethod('SystemNavigator.pop');
              },
            ),
          ],
        ),
      );

      final textStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 13);

      return SafeArea(
        child: Scaffold(
          drawer: drawer,
          appBar: AppBar(
            title: Text('StudentCare'),
          ),
          body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                child: Text(
                  'Pesquisas não respondidas',
                  style: textStyle,
                ),
              ),
              Column(
                children: controller.surveyToRespond.isNotEmpty
                    ? controller.surveyToRespond
                        .map((element) => GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    useSafeArea: true,
                                    builder: (_) =>
                                        SurveyWidget(survey: element));
                              },
                              child: GFListTile(
                                title: Text(element.name),
                                avatar: Icon(Icons.check_circle_outline),
                                color: GFColors.WARNING,
                              ),
                            ))
                        .toList()
                    : [Container()],
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                child: Text(
                  'Pesquisas já respondidas',
                  style: textStyle,
                ),
              ),
              Column(
                children: controller.surveyResponded.isNotEmpty
                    ? controller.surveyResponded
                        .map((element) => GestureDetector(
                              onTap: () {},
                              child: GFListTile(
                                title: Text(element.name),
                                avatar: Icon(Icons.check_circle),
                                color: GFColors.SUCCESS,
                              ),
                            ))
                        .toList()
                    : [Container()],
              )
            ]),
          ),
        ),
      );
    });
  }
}
