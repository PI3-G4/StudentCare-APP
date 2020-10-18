import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:studentcare/model/InfoStudent.dart';
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
    controller.loadInfo();
    final space = SizedBox(
      height: 50,
    );
    final colorGreen =
        MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
      return Colors.green;
    });
    final colorRed =
        MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
      return Colors.red;
    });
    final textStyleSurveyName = TextStyle(fontSize: 25);
    final textStyleTitle = TextStyle(fontSize: 20);
    final textStyleItem = TextStyle(fontSize: 15);
    return Container(
      child: Observer(
        builder: (_) {
          return SingleChildScrollView(
            child: Column(
              children: controller.surveys.isNotEmpty
                  ? controller.surveys.map((InfoSurvey element) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          space,
                          Center(
                              child: Text(
                            element.name,
                            style: textStyleSurveyName,
                          )),
                          space,
                          DataTable(
                              columns: [
                                DataColumn(
                                    label: Text(
                                  'Nome',
                                  style: textStyleTitle,
                                )),
                                DataColumn(
                                    numeric: true,
                                    label: Text(
                                      'Classificação',
                                      style: textStyleTitle,
                                    ))
                              ],
                              rows: element.items
                                  .map((InfoStudent e) => DataRow(
                                          color: e.score >= 2
                                              ? colorGreen
                                              : colorRed,
                                          cells: [
                                            DataCell(Text(
                                              e.name,
                                              style: textStyleItem,
                                            )),
                                            DataCell(Text(
                                              e.score.toString(),
                                              style: textStyleItem,
                                            ))
                                          ]))
                                  .toList()),
                          space,
                        ],
                      );
                    }).toList()
                  : [Container()],
            ),
          );
        },
      ),
    );
  }
}

/*controller.surveys
                      .map(
                        (InfoSurvey element) => DataTable(
                          columns: [
                            DataColumn(label: Text('Nome')),
                            DataColumn(label: Text('Classificação'))
                          ],
                          rows: [
                            DataRow(
                              cells: element.items
                                  .map(
                                    (InfoStudent element2) => DataCell(
                                      Text(element2.name),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ],
                        ),
                      )
                      .toList() 

  */
