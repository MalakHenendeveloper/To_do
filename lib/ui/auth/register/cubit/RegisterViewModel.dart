import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_do/data/User.dart';
import 'package:to_do/ui/auth/register/cubit/RegisterState.dart';

class Registerviewmodel extends Cubit<RegisterState> {
  Registerviewmodel() : super(RegisterInataial());
  var emial = TextEditingController(text: 'malakhenen@gmail.com');
  var password = TextEditingController(text: 'malakhen');
  var name = TextEditingController(text: 'malakhen');
  var phone = TextEditingController(text: 'malakhen');
  void Register() async {
    emit(Registerloading());
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emial.text,
        password: password.text,
      );
      var user = UserModel(
        id: credential.user?.uid,
        email: emial.text,
        name: name.text,
        phone: phone.text,
      );
      await FirebaseFirestore.instance
          .collection('users')
          .doc(credential.user?.uid)
          .set({
        'id': user.id,
        'email': user.email,
        'name': user.name,
        'phone': user.phone,
      });
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (e) {
      emit(RegisterError());
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      emit(RegisterError());
      print(e);
    }
  }
}
