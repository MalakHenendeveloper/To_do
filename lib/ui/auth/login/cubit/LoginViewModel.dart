import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_do/ui/auth/login/cubit/LoginState.dart';

class LoginViewModel extends Cubit<LoginState> {
  LoginViewModel() : super(LoginStateinatial());
  var emial = TextEditingController(text: 'malakhenen@gmail.com');
  var password = TextEditingController(text: 'malakhen');
  void login() async {
    emit(LoginStateLoading());
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emial.text, password: password.text);
      emit(LoginStateSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginStateError());
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        emit(LoginStateError());
        print('Wrong password provided for that user.');
      }
    }
  }
}
