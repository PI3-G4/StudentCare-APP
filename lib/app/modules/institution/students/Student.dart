class Student {
  int id;
  String name;
  String email;

  Student({this.id, this.name, this.email});

  fromJson(Map<String, dynamic> data) {
    this.id = data['id'];
    this.name = data['name'];
    this.email = data['email'];
  }
}
