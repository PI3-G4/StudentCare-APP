import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
