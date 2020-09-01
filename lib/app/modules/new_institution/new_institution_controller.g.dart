// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_institution_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $NewInstitutionController = BindInject(
  (i) => NewInstitutionController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewInstitutionController on _NewInstitutionControllerBase, Store {
  final _$valueAtom = Atom(name: '_NewInstitutionControllerBase.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$_NewInstitutionControllerBaseActionController =
      ActionController(name: '_NewInstitutionControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_NewInstitutionControllerBaseActionController
        .startAction(name: '_NewInstitutionControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_NewInstitutionControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
