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
import 'package:studentcare/Util/Connection.dart';
import 'package:studentcare/Util/MySharedPreferences.dart';
import 'new_institution_controller.dart';

class NewInstitutionPage extends StatefulWidget {
  final String title;
  const NewInstitutionPage({Key key, this.title = "NewInstitution"})
      : super(key: key);

  @override
  _NewInstitutionPageState createState() => _NewInstitutionPageState();
}

class _NewInstitutionPageState
    extends ModularState<NewInstitutionPage, NewInstitutionController> {
  //use 'controller' variable to access controller

  bool hidePassword = true;
  final spaceBetweenShort = SizedBox(height: 8);
  final spaceBetweenMedium = SizedBox(height: 16);
  final spaceBetweenBig = SizedBox(height: 32);
  final outlineInputBorder =
      OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0)));
  final focusNodePassword = FocusNode();
  final focusNodeEmail = FocusNode();
  final focusNodeName = FocusNode();
  final title = Text(
    'Cria uma conta',
    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
  );

  @override
  Widget build(BuildContext context) {
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
                labelText: 'Nome da Instituição',
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
                labelText: 'E-mail',
                errorText: controller.errorEmail,
                prefixIcon: Icon(Icons.email),
                border: outlineInputBorder),
            keyboardType: TextInputType.emailAddress,
            focusNode: focusNodeEmail,
            onEditingComplete: () {
              FocusScope.of(context).requestFocus(focusNodePassword);
            },
          );

          final textFieldPassword = TextField(
            autofocus: false,
            onChanged: (value) {
              controller.password = value;
              controller.isPasswordValid();
            },
            decoration: InputDecoration(
              labelText: 'Senha',
              errorText: controller.errorPassword,
              prefixIcon: Icon(Icons.lock),
              border: outlineInputBorder,
              suffixIcon: GestureDetector(
                dragStartBehavior: DragStartBehavior.down,
                onTap: () {
                  setState(() {
                    hidePassword = !hidePassword;
                  });
                },
                child: Icon(
                    hidePassword ? Icons.visibility : Icons.visibility_off),
              ),
            ),
            obscureText: hidePassword,
            focusNode: focusNodePassword,
          );

          final buttonInstitution = GFButton(
              onPressed: (controller.errorEmail == null &&
                      controller.errorPassword == null &&
                      controller.errorName == null &&
                      controller.email.isNotEmpty &&
                      controller.password.isNotEmpty &&
                      controller.name.isNotEmpty)
                  ? () async {
                      if (controller.isEmailValid() &&
                          controller.isPasswordValid()) {
                        if (await Connection.isConnected()) {
                          final ipSaved = await MySharedPreferences.getIP();
                          var response;
                          try {
                            response = await Requests.post(
                                'http://$ipSaved/institution',
                                body: {
                                  'name': controller.name,
                                  'email': controller.email,
                                  'password': controller.password
                                },
                                bodyEncoding: RequestBodyEncoding.JSON);
                          } catch (e) {
                            showDialog(
                                context: context,
                                barrierDismissible: true,
                                builder: (_) => Alert(
                                    content:
                                        'http://$ipSaved/institution\n ${e.toString()}',
                                    title: 'Erro'));
                          }

                          if (response.statusCode == 201) {
                            Modular.to.pushNamed('/');
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
              text: 'Cadastre-se como Instituição',
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
                      buttonInstitution,
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
