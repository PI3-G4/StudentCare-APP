class Question {
  String name;
  int type;
  List<dynamic> data;
  bool obligatory;

  Question({this.name, this.type, this.data, this.obligatory});
  Question.fromJson(Map<dynamic, dynamic> json)
      : name = json['name'],
        type = json['type'],
        data = json['data'],
        obligatory = json['obligatory'];
}
