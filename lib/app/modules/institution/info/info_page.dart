import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'info_controller.dart';

class InfoPage extends StatefulWidget {
  final String title;
  const InfoPage({Key key, this.title = "Info"}) : super(key: key);

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends ModularState<InfoPage, InfoController> {
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
