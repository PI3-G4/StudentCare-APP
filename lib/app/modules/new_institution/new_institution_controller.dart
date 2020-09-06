import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:studentcare/validators/validators.dart';

part 'new_institution_controller.g.dart';

@Injectable()
class NewInstitutionController = _NewInstitutionControllerBase
    with _$NewInstitutionController;

abstract class _NewInstitutionControllerBase with Store {
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

  @observable
  String errorPassword;

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
  bool isPasswordValid() {
    if (password.isNotEmpty) {
      if (password.length >= 4 && password.length <= 64) {
        errorPassword = null;
        return true;
      } else {
        errorPassword = 'Senha inválida';
      }
    } else {
      errorPassword = 'Senha vazia';
    }
    return false;
  }
}
