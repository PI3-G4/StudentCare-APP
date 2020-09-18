import 'dart:convert';

class Survey {
  int id;
  String name;
  Map<dynamic, dynamic> data;

  Survey({this.id, this.name, this.data});

  fromJson(Map<String, dynamic> data) {
    this.id = data['id'];
    this.name = data['name'];
    this.data = jsonDecode(data['survey']);
  }

  bool equal(Survey other) {
    return (other.id == this.id);
  }
}
