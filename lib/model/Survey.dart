import 'dart:convert';

import 'package:studentcare/model/Question.dart';

class Survey {
  int id;
  String name;
  List<Question> questions = [];
  bool done = false;

  fromJson(Map<String, dynamic> data) {
    this.id = data['id'];
    this.name = data['name'];
    final preQuestions = jsonDecode(data['survey'])['questions'];
    for (var preQuestion in preQuestions) {
      this.questions.add(Question.fromJson(preQuestion));
    }
  }

  bool equal(Survey other) {
    return (other.id == this.id);
  }
}
