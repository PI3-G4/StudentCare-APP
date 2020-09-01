import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'new_institution_controller.dart';

class NewInstitutionPage extends StatefulWidget {
  final String title;
  const NewInstitutionPage({Key key, this.title = "NewInstitution"})
      : super(key: key);

  @override
  _NewInstitutionPageState createState() => _NewInstitutionPageState();
}

class _NewInstitutionPageState
    extends ModularState<NewInstitutionPage, NewInstitutionController> {
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
