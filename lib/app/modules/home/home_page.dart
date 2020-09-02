import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';
import 'package:studentcare/app/modules/widgets/input_field.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: Observer(
        builder: (_) => Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(),
            SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Icon(
                      Icons.store_mall_directory,
                      color: Colors.pinkAccent,
                      size: 160,
                    ),
                    InputField(
                      icon: Icons.person_outline,
                      hint: "Usuário",
                      obscure: false,
                    ),
                    InputField(
                      icon: Icons.lock_outline,
                      hint: "Senha",
                      obscure: true,
                    ),
                    RaisedButton(
                      color: Colors.pinkAccent,
                      child: Text("Entrar"),
                      onPressed: () {},
                      textColor: Colors.white,
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    SizedBox(
                      height: 50,
                      child: RaisedButton(
                        color: Colors.pinkAccent,
                        child: Text("Cadastrar "),
                        onPressed: () {},
                        textColor: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
