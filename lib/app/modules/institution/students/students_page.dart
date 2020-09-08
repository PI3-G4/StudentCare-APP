import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'students_controller.dart';

class StudentsPage extends StatefulWidget {
  final String title;
  const StudentsPage({Key key, this.title = "Students"}) : super(key: key);

  @override
  _StudentsPageState createState() => _StudentsPageState();
}

class _StudentsPageState
    extends ModularState<StudentsPage, StudentsController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    controller.loadStudents();
    return Container(
      child: Observer(
        builder: (_) {
          return Column(
            children: controller.students.isNotEmpty
                ? controller.students
                    .map((element) => GFListTile(
                          title: Text(element.name),
                          subTitle: Text(element.email),
                          icon: Icon(Icons.person),
                        ))
                    .toList()
                : [Container()],
          );
        },
      ),
    );
  }
}
