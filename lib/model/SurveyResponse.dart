class SurveyResponse {
  int id;
  String name;
  String answers;

  SurveyResponse({this.id, this.name, this.answers});
  SurveyResponse.fromJson(Map<dynamic, dynamic> json)
      : id = json['id'],
        name = json['name'],
        answers = json['answers'];

}
