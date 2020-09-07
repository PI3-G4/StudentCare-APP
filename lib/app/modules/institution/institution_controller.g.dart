// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'institution_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $InstitutionController = BindInject(
  (i) => InstitutionController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$InstitutionController on _InstitutionControllerBase, Store {
  final _$selectedAtom = Atom(name: '_InstitutionControllerBase.selected');

  @override
  int get selected {
    _$selectedAtom.reportRead();
    return super.selected;
  }

  @override
  set selected(int value) {
    _$selectedAtom.reportWrite(value, super.selected, () {
      super.selected = value;
    });
  }

  final _$pagesAtom = Atom(name: '_InstitutionControllerBase.pages');

  @override
  ObservableList<Widget> get pages {
    _$pagesAtom.reportRead();
    return super.pages;
  }

  @override
  set pages(ObservableList<Widget> value) {
    _$pagesAtom.reportWrite(value, super.pages, () {
      super.pages = value;
    });
  }

  @override
  String toString() {
    return '''
selected: ${selected},
pages: ${pages}
    ''';
  }
}
