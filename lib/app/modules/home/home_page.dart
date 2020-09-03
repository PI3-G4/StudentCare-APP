import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/getwidget.dart';
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Observer(
          builder: (_) => Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      child: Image(image: AssetImage('assets/images/logo.png')),
                      width: 150,
                    ),
                    spaceBetweenShort,
                    Text(
                      'StudentCare',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    spaceBetweenBig,
                    TextField(
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
                    ),
                    spaceBetweenBig,
                    TextField(
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
                          child: Icon(hidePassword
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                      ),
                      obscureText: hidePassword,
                      focusNode: focusNodePassword,
                    ),
                    spaceBetweenBig,
                    GFButton(
                        onPressed: (controller.errorEmail == null &&
                                controller.errorPassword == null &&
                                controller.email.isNotEmpty &&
                                controller.password.isNotEmpty)
                            ? () {}
                            : null,
                        text: 'Login como Estudante',
                        shape: GFButtonShape.pills,
                        color: GFColors.PRIMARY,
                        size: GFSize.LARGE),
                    spaceBetweenMedium,
                    GFButton(
                        onPressed: (controller.errorEmail == null &&
                                controller.errorPassword == null &&
                                controller.email.isNotEmpty &&
                                controller.password.isNotEmpty)
                            ? () {}
                            : null,
                        text: 'Login como Insituição',
                        shape: GFButtonShape.pills,
                        color: GFColors.SECONDARY,
                        size: GFSize.LARGE),
                    spaceBetweenBig,
                    GFButton(
                        onPressed: () {},
                        text: 'Cadastre-se como insituição',
                        color: GFColors.DARK,
                        type: GFButtonType.transparent,
                        shape: GFButtonShape.pills,
                        size: GFSize.LARGE),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
