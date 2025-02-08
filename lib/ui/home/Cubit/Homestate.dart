import 'package:to_do/data/taskModel.dart';

abstract class Homestate {}

class HomeInatial extends Homestate {}

class HomeLoading extends Homestate {}

class HomeError extends Homestate {
  final String ErrorMasege;

  HomeError({required this.ErrorMasege});
}

class HomeSuccess extends Homestate {
  final List<Tasks> tasks;
  HomeSuccess(this.tasks);
}
