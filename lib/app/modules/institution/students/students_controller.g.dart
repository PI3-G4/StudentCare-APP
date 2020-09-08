// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'students_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $StudentsController = BindInject(
  (i) => StudentsController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StudentsController on _StudentsControllerBase, Store {
  final _$studentsAtom = Atom(name: '_StudentsControllerBase.students');

  @override
  ObservableList<Student> get students {
    _$studentsAtom.reportRead();
    return super.students;
  }

  @override
  set students(ObservableList<Student> value) {
    _$studentsAtom.reportWrite(value, super.students, () {
      super.students = value;
    });
  }

  final _$_StudentsControllerBaseActionController =
      ActionController(name: '_StudentsControllerBase');

  @override
  void loadStudents() {
    final _$actionInfo = _$_StudentsControllerBaseActionController.startAction(
        name: '_StudentsControllerBase.loadStudents');
    try {
      return super.loadStudents();
    } finally {
      _$_StudentsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
students: ${students}
    ''';
  }
}
