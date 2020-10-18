import 'dart:convert';

class InfoStudent {
  String name;
  int score;
  InfoStudent({this.name, this.score});

  InfoStudent.fromJson(Map<dynamic, dynamic> json)
      : this.name = json['name'],
        this.score = json['score'];
}

class InfoSurvey {
  String name;
  List<InfoStudent> items = [];
  var aaa;
  InfoSurvey({this.name, this.items});

  InfoSurvey.fromJson(Map<dynamic, dynamic> json) : this.name = json['name'] {
    for (var element in json['itens']) {
      final infoStudent =
          InfoStudent(name: element['name'], score: element['score']);
      this.items.add(infoStudent);
    }
  }
}
