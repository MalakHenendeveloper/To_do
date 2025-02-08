import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/data/fierbase.dart';
import 'package:to_do/data/taskModel.dart';
import 'package:to_do/ui/home/Cubit/Homestate.dart';

class Homeviewmodel extends Cubit<Homestate> {
  Homeviewmodel() : super(HomeInatial()) {
    selectdate = DateTime.now(); // تهيئة selectdate بقيمة افتراضية
  }

  StreamSubscription? taskSubscription;
  DateTime? selectdate;
//get task
  void gettask() {
    emit(HomeLoading());
    try {
      taskSubscription = Fierbasedata.getallcollections().listen(
        (tasklist) {
          if (selectdate == null) {
            emit(HomeError(ErrorMasege: 'Select date is null.'));
            return;
          }
//filter
          var task = tasklist.where(
            (task) {
              return selectdate!.day == task.dateTime.day &&
                  selectdate!.month == task.dateTime.month &&
                  selectdate!.year == task.dateTime.year;
            },
          ).toList();
//sorting
          task.sort(
            (Tasks task1, Tasks task2) {
              return task1.dateTime.compareTo(task2.dateTime);
            },
          );
          emit(HomeSuccess(task));
        },
        onError: (error) {
          emit(HomeError(ErrorMasege: error.toString()));
        },
      );
    } catch (e) {
      emit(HomeError(ErrorMasege: e.toString()));
    }
  }

  void changeday(DateTime newdate) {
    selectdate = newdate;
    gettask();
  }
//delet
  void deleteTasks(Tasks task) async {
    emit(HomeLoading());
    try {
      await Fierbasedata.deleteTask(task);

      gettask();
    } catch (e) {
      emit(HomeError(ErrorMasege: e.toString()));
    }
  }

}
