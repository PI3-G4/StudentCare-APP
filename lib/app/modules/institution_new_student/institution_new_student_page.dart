import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:getwidget/size/gf_size.dart';
import 'package:requests/requests.dart';
import 'package:studentcare/Components/Alert.dart';
import 'package:studentcare/Components/AlertShare.dart';
import 'package:studentcare/Util/Connection.dart';
import 'package:studentcare/Util/MySharedPreferences.dart';
import '../../app_controller.dart';
import 'institution_new_student_controller.dart';

class InstitutionNewStudentPage extends StatefulWidget {
  final String title;
  const InstitutionNewStudentPage(
      {Key key, this.title = "InstitutionNewStudent"})
      : super(key: key);

  @override
  _InstitutionNewStudentPageState createState() =>
      _InstitutionNewStudentPageState();
}

class _InstitutionNewStudentPageState extends ModularState<
    InstitutionNewStudentPage, InstitutionNewStudentController> {
  //use 'controller' variable to access controller

  final spaceBetweenShort = SizedBox(height: 8);
  final spaceBetweenMedium = SizedBox(height: 16);
  final spaceBetweenBig = SizedBox(height: 32);
  final outlineInputBorder =
      OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0)));
  final focusNodeEmail = FocusNode();
  final focusNodeName = FocusNode();
  final title = Text(
    'Crie uma conta para um aluno',
    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
  );

  @override
  Widget build(BuildContext context) {
    controller.generatePassword();
    final passwordController = TextEditingController.fromValue(
        TextEditingValue(text: controller.password));
    return Scaffold(
      body: Observer(
        builder: (_) {
          final textFieldName = TextField(
            autofocus: false,
            onChanged: (value) {
              controller.name = value;
              controller.isNameValid();
            },
            decoration: InputDecoration(
                labelText: 'Nome do aluno',
                errorText: controller.errorName,
                prefixIcon: Icon(Icons.business),
                border: outlineInputBorder),
            keyboardType: TextInputType.name,
            onEditingComplete: () {
              FocusScope.of(context).requestFocus(focusNodeEmail);
            },
          );

          final textFieldEmail = TextField(
            autofocus: false,
            onChanged: (value) {
              controller.email = value;
              controller.isEmailValid();
            },
            decoration: InputDecoration(
                labelText: 'E-mail do aluno',
                errorText: controller.errorEmail,
                prefixIcon: Icon(Icons.email),
                border: outlineInputBorder),
            keyboardType: TextInputType.emailAddress,
            focusNode: focusNodeEmail,
          );

          final textFieldPassword = TextField(
            autofocus: false,
            readOnly: true,
            controller: passwordController,
            decoration: InputDecoration(
              labelText: 'Senha',
              prefixIcon: Icon(Icons.lock),
              border: outlineInputBorder,
              suffixIcon: GestureDetector(
                child: Icon(Icons.visibility),
              ),
            ),
          );

          final homeController = Modular.get<AppController>();

          final buttonStudent = GFButton(
              onPressed: (controller.errorEmail == null &&
                      controller.errorName == null &&
                      controller.email.isNotEmpty &&
                      controller.name.isNotEmpty)
                  ? () async {
                      if (controller.isEmailValid()) {
                        if (await Connection.isConnected()) {
                          homeController.ipSaved =
                              await MySharedPreferences.getIP();
                          var response;
                          try {
                            response = await Requests.post(
                                'http://${homeController.ipSaved}/student',
                                body: {
                                  'name': controller.name,
                                  'email': controller.email,
                                  'password': controller.password,
                                  'id_institution': homeController.id
                                },
                                bodyEncoding: RequestBodyEncoding.JSON);
                          } catch (e) {
                            showDialog(
                                context: context,
                                barrierDismissible: true,
                                builder: (_) => Alert(
                                    content:
                                        'http://${homeController.ipSaved}/student\n ${e.toString()}',
                                    title: 'Erro'));
                          }

                          if (response.statusCode == 201) {
                            showDialog(
                                context: context,
                                barrierDismissible: true,
                                builder: (_) => AlertShare(
                                      content:
                                          'O aluno ${controller.name} foi cadastrado.\nCompartilhe os dados de acesso com o aluno',
                                      title: 'Atenção',
                                      textToShare:
                                          'Olá ${controller.name}, você foi convidado para utilizar o StudentCare.\nSuas credenciais são:\nE-mail: ${controller.email}\nSenha: ${controller.password}\nLembre-se de mudar a senha assim que acessar o app',
                                    ));
                          } else if (response.statusCode == 400) {
                            showDialog(
                                context: context,
                                barrierDismissible: true,
                                builder: (_) => Alert(
                                    content: 'Ocorreu um erro com os dados',
                                    title: 'Erro'));
                          } else if (response.statusCode == 500) {
                            showDialog(
                                context: context,
                                barrierDismissible: true,
                                builder: (_) => Alert(
                                    content: 'Ocorreu um erro no servidor',
                                    title: 'Erro'));
                          } else {
                            showDialog(
                                context: context,
                                barrierDismissible: true,
                                builder: (_) => Alert(
                                    content: 'Ocorreu um erro desconhecido',
                                    title: 'Erro'));
                          }
                        } else {
                          showDialog(
                              context: context,
                              barrierDismissible: true,
                              builder: (_) => Alert(
                                  content:
                                      'Você precisa de conexão com a internet para acessar',
                                  title: 'Atenção!'));
                        }
                      }
                    }
                  : null,
              text: 'Cadastre o aluno',
              shape: GFButtonShape.pills,
              color: GFColors.PRIMARY,
              size: GFSize.LARGE);

          return SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      title,
                      spaceBetweenBig,
                      textFieldName,
                      spaceBetweenBig,
                      textFieldEmail,
                      spaceBetweenBig,
                      textFieldPassword,
                      spaceBetweenBig,
                      buttonStudent,
                      spaceBetweenBig,
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
