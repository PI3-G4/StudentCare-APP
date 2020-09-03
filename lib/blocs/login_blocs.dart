import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';

import 'package:rxdart/rxdart.dart';
import 'package:studentcare/validators/login_validators.dart';
class LoginBloc extends BlocBase with LoginValidators {

  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Stream<String> get outEmail => _emailController.stream.transform(validateEmail);
  Stream<String> get outPassword => _passwordController.stream.transform(validatePassword);

  Stream<bool> get outSubmitValid => Rx.combineLatest2(
    outEmail, outPassword, (a,b) => true
  );

  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;
  
  @override
  void dispose(){
    _emailController.close();
    _passwordController.close();

  }



}