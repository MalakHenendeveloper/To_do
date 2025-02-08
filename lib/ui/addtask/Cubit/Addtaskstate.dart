abstract class AddtaskState {}

class AddtaskInatial extends AddtaskState {}

class AddtaskError extends AddtaskState {}

class Addtasksuccess extends AddtaskState {}

class AddtaskSelectdate extends AddtaskState {
  DateTime? selectedDate;

  AddtaskSelectdate({required this.selectedDate});
}
