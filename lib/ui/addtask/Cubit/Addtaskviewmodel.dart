import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:to_do/data/fierbase.dart';
import 'package:to_do/data/taskModel.dart';
import 'package:to_do/ui/addtask/Cubit/Addtaskstate.dart';

class Addtaskviewmodel extends Cubit<AddtaskState> {
  Addtaskviewmodel() : super(AddtaskInatial());
  var key = GlobalKey<FormState>();
  var title = TextEditingController();
  var descraption = TextEditingController();
  var selectedDate = DateTime.now();

  Future<void> validator() async {
    if (key.currentState!.validate()) {
      emit(AddtaskInatial());
      Tasks task = Tasks(
          title: title.text,
          dateTime: selectedDate,
          descraption: descraption.text);
      await Fierbasedata.addtask(task);
      emit(Addtasksuccess());
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
      emit(AddtaskSelectdate(selectedDate: selectedDate));
    }
  }
}
