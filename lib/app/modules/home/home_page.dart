import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:studentcare/blocs/login_blocs.dart';
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

  final _loginBloc  = LoginBloc();

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
                      stream: _loginBloc.outEmail,
                      onChanged: _loginBloc.changeEmail,
                    ),
                    InputField(
                      icon: Icons.lock_outline,
                      hint: "Senha",
                      obscure: true,
                      stream: _loginBloc.outPassword,
                      onChanged: _loginBloc.changePassword,
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    StreamBuilder<bool>(
                      stream: _loginBloc.outSubmitValid,
                      builder: (context, snapshot) {
                        return SizedBox(
                          height: 36,
                          child: RaisedButton(
                            color: Colors.pinkAccent,
                            child: Text("Entrar"),
                            onPressed: snapshot.hasData ? () {} : null,
                            textColor: Colors.white,
                            disabledColor: Colors.pinkAccent.withAlpha(140),
                          ),
                        );
                      }
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    SizedBox(
                      height: 35,
                      child: RaisedButton(
                        color: Colors.pinkAccent,
                        child: Text("Cadastrar"),
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
