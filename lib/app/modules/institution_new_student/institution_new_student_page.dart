import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'institution_new_student_controller.dart';

class InstitutionNewStudentPage extends StatefulWidget {
  final String title;
  const InstitutionNewStudentPage(
      {Key key, this.title = "InstitutionNewStudent"})
      : super(key: key);

  @override
  _InstitutionNewStudentPageState createState() =>
      _InstitutionNewStudentPageState();
}

class _InstitutionNewStudentPageState extends ModularState<
    InstitutionNewStudentPage, InstitutionNewStudentController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
