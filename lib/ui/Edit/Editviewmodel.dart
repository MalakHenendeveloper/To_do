import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do/data/fierbase.dart';
import 'package:to_do/data/taskModel.dart';
import 'package:to_do/ui/Edit/EditState.dart';
import 'package:to_do/ui/addtask/Cubit/Addtaskviewmodel.dart';
import 'package:to_do/ui/home/Cubit/Homeviewmodel.dart';

class EditViewModel extends Cubit<EditState> {
  EditViewModel() : super(EditInatial());
  Homeviewmodel view = Homeviewmodel();
  var selectedDate = DateTime.now();

  void updateTask(Tasks task) async {
    emit(EditLoading());
    try {
      await Fierbasedata.updateTask(task);
      emit(EditSuccess());
    } catch (e) {
      emit(EditError(ErrorMasege: e.toString()));
    }
  }

  void showclender(BuildContext context) async {
    var chossedate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (chossedate != null) {
      selectedDate = chossedate;
      emit(Selectdate(selectedDate: selectedDate));
    }
  }
}
