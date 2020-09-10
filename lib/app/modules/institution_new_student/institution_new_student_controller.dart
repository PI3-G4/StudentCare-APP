import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:studentcare/validators/validators.dart';

part 'institution_new_student_controller.g.dart';

@Injectable()
class InstitutionNewStudentController = _InstitutionNewStudentControllerBase
    with _$InstitutionNewStudentController;

abstract class _InstitutionNewStudentControllerBase with Store {
  @observable
  String name = '';

  @observable
  String errorName;

  @observable
  String email = '';

  @observable
  String errorEmail;

  @observable
  String password = '';

  @action
  bool isNameValid() {
    if (name.isNotEmpty) {
      errorName = null;
      return true;
    } else {
      errorName = 'Nome vazio';
    }
    return false;
  }

  @action
  bool isEmailValid() {
    if (email.isNotEmpty) {
      if (Util.isEmailValid(email)) {
        errorEmail = null;
        return true;
      } else {
        errorEmail = 'E-mail inválido';
      }
    } else {
      errorEmail = 'E-mail vazio';
    }
    return false;
  }

  @action
  void generatePassword() {
    if (this.password.isEmpty) {
      final random = Random.secure();
      var passwordString = random.nextInt(9999).toString();
      for (var i = passwordString.length; i < 4; i++) {
        passwordString = '${random.nextInt(9)}$password';
      }
      this.password = passwordString;
    }
  }
}
