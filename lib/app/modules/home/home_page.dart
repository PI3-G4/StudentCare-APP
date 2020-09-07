import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/getwidget.dart';
import 'package:requests/requests.dart';
import 'package:studentcare/Components/Alert.dart';
import 'package:studentcare/Util/Connection.dart';
import 'package:studentcare/Util/MySharedPreferences.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  bool hidePassword = true;
  final spaceBetweenShort = SizedBox(height: 8);
  final spaceBetweenMedium = SizedBox(height: 16);
  final spaceBetweenBig = SizedBox(height: 32);
  final outlineInputBorder =
      OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0)));
  final focusNodePassword = FocusNode();
  final focusNodeEmail = FocusNode();
  final logoImage = SizedBox(
    child: Image(image: AssetImage('assets/images/logo.png')),
    width: 150,
  );
  final title = Text(
    'StudentCare',
    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) {
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

          final buttonStudent = GFButton(
              onPressed: (controller.errorEmail == null &&
                      controller.errorPassword == null &&
                      controller.email.isNotEmpty &&
                      controller.password.isNotEmpty)
                  ? () async {
                      if (controller.isEmailValid() &&
                          controller.isPasswordValid()) {
                        if (await Connection.isConnected()) {
                          controller.ipSaved =
                              await MySharedPreferences.getIP();
                          var response;
                          try {
                            response = await Requests.post(
                                'http://${controller.ipSaved}/student-login',
                                body: {
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
                                        'http://${controller.ipSaved}/student-login\n ${e.toString()}',
                                    title: 'Erro'));
                          }

                          if (response.statusCode == 200) {
                            Modular.to.popAndPushNamed('/instituition');
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
              text: 'Login como Estudante',
              shape: GFButtonShape.pills,
              color: GFColors.PRIMARY,
              size: GFSize.LARGE);

          final buttonInstitution = GFButton(
              onPressed: (controller.errorEmail == null &&
                      controller.errorPassword == null &&
                      controller.email.isNotEmpty &&
                      controller.password.isNotEmpty)
                  ? () async {
                      if (controller.isEmailValid() &&
                          controller.isPasswordValid()) {
                        if (await Connection.isConnected()) {
                          controller.ipSaved =
                              await MySharedPreferences.getIP();
                          var response;
                          try {
                            response = await Requests.post(
                                'http://${controller.ipSaved}/institution-login',
                                body: {
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
                                        'http://${controller.ipSaved}/institution-login\n ${e.toString()}',
                                    title: 'Erro'));
                          }

                          if (response.statusCode == 200) {
                            Modular.to.popAndPushNamed('/instituition');
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
              text: 'Login como Insituição',
              shape: GFButtonShape.pills,
              color: GFColors.SECONDARY,
              size: GFSize.LARGE);

          final buttonSignUp = GFButton(
              onPressed: () {
                Modular.to.pushNamed('/new_instituition');
              },
              text: 'Cadastre-se como insituição',
              color: GFColors.DARK,
              type: GFButtonType.transparent,
              shape: GFButtonShape.pills,
              size: GFSize.LARGE);

          final ipConfig = GFIconButton(
              onPressed: () async {
                controller.ipSaved = await MySharedPreferences.getIP();
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (_) => AlertDialog(
                    title: Text("Defina o  IP da API"),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    content: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                                labelText: 'IP atual: ${controller.ipSaved}',
                                hintText: '192.168.0.101'),
                            onChanged: (value) =>
                                controller.ipAPItoSave = value,
                          ),
                        )
                      ],
                    ),
                    actions: [
                      GFButton(
                          onPressed: () {
                            Modular.to.pop();
                          },
                          text: 'Cancelar'),
                      GFButton(
                          onPressed: () async {
                            MySharedPreferences.saveIP(controller.ipAPItoSave);
                            controller.ipSaved =
                                await MySharedPreferences.getIP();
                            Modular.to.pop();
                          },
                          text: 'Salvar'),
                    ],
                  ),
                );
              },
              icon: Icon(Icons.settings),
              shape: GFIconButtonShape.circle,
              color: GFColors.DARK,
              size: GFSize.SMALL);

          return SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      logoImage,
                      spaceBetweenShort,
                      title,
                      spaceBetweenBig,
                      textFieldEmail,
                      spaceBetweenBig,
                      textFieldPassword,
                      spaceBetweenBig,
                      buttonStudent,
                      spaceBetweenMedium,
                      buttonInstitution,
                      spaceBetweenBig,
                      buttonSignUp,
                      spaceBetweenMedium,
                      ipConfig,
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
