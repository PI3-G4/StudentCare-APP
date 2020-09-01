import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'student_research_controller.dart';

class StudentResearchPage extends StatefulWidget {
  final String title;
  const StudentResearchPage({Key key, this.title = "StudentResearch"})
      : super(key: key);

  @override
  _StudentResearchPageState createState() => _StudentResearchPageState();
}

class _StudentResearchPageState
    extends ModularState<StudentResearchPage, StudentResearchController> {
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
