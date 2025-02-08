import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/ui/Main_layout/Cubit/MainlauoutState.dart';
import 'package:to_do/ui/home/HomeScreen.dart';
import 'package:to_do/ui/settinges/settings.dart';

class Mainlayout extends Cubit<MainlayoutState> {
  Mainlayout() : super(MainlayoutStateinatial());
  int index = 0;
  List<Widget> tab = [
    Homescreen(),
    const Settings(),
  ];
  void changetab(int Selectedindex) {
    index = Selectedindex;
    emit(changeindex());
  }
}
