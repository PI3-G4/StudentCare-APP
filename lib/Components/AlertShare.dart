import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/getwidget.dart';
import 'package:share/share.dart';

class AlertShare extends StatelessWidget {
  String title;
  String content;
  String textToShare;
  AlertShare({Key key, this.title, this.content, this.textToShare})
      : super(key: key);

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
            Share.share(this.textToShare);
          },
          shape: GFButtonShape.pills,
          icon: Icon(
            Icons.keyboard_arrow_right,
            color: GFColors.SUCCESS,
          ),
          text: 'Compartilhar',
        ),
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
