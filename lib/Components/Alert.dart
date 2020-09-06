import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:getwidget/components/alert/gf_alert.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/components/floating_widget/gf_floating_widget.dart';
import 'package:getwidget/getwidget.dart';

class Alert extends StatelessWidget {
  String title;
  String content;
  Alert({Key key, this.title, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(this.title),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      content:
          Wrap(alignment: WrapAlignment.center, children: [Text(this.content)]),
      actions: [
        GFButton(
          onPressed: () {
            Modular.to.pop();
          },
          shape: GFButtonShape.pills,
          icon: Icon(
            Icons.keyboard_arrow_right,
            color: GFColors.WHITE,
          ),
          text: 'OK',
        ),
      ],
    );
  }
}
