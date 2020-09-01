import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
