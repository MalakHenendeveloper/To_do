abstract class EditState {}

class EditInatial extends EditState {}

class EditLoading extends EditState {}

class EditError extends EditState {
 String ErrorMasege ;
 EditError({required this.ErrorMasege});
}

class EditSuccess extends EditState {}

class Selectdate extends EditState {
  DateTime? selectedDate;
  Selectdate({required this.selectedDate});
}
