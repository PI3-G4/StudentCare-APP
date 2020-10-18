import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
    return Container(
      child: Observer(
        builder: (_) {
          return SingleChildScrollView(
            child: Column(
              children: controller.surveys.isNotEmpty
                  ? controller.surveys.map((InfoSurvey element) {
                      return Column(
                        children: [
                          Text(element.name),
                          DataTable(
                              columns: [
                                DataColumn(label: Text('Nome')),
                                DataColumn(label: Text('Classificação'))
                              ],
                              rows: element.items
                                  .map((InfoStudent e) => DataRow(cells: [
                                        DataCell(Text(e.name)),
                                        DataCell(Text(e.score.toString()))
                                      ]))
                                  .toList())
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
