import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/core/Resource/Item.dart';
import 'package:to_do/ui/home/Cubit/Homestate.dart';
import 'package:to_do/ui/home/Cubit/Homeviewmodel.dart';

class Homescreen extends StatelessWidget {
  Homescreen({super.key});

  var viewmodel = Homeviewmodel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          DatePicker(
            DateTime.now(),
            height: 100,
            initialSelectedDate: viewmodel.selectdate ?? DateTime.now(),
            selectionColor: Colors.blue,
            selectedTextColor: Colors.white,
            dayTextStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            monthTextStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
            dateTextStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            onDateChange: (date) {
              viewmodel.changeday(date);
            },
          ),
          Expanded(
            child: BlocBuilder<Homeviewmodel, Homestate>(
              bloc: viewmodel..gettask(),
              builder: (context, state) {
                if (state is HomeLoading) {
                  return Center(
                      child: CircularProgressIndicator(
                    color: Colors.black,
                  ));
                } else if (state is HomeError) {
                  return Center(
                    child: Text(
                      'Error: ${state.ErrorMasege}',
                      style: TextStyle(color: Colors.red),
                    ),
                  );
                } else if (state is HomeSuccess) {
                  if (state.tasks.isEmpty) {
                    return Center(
                      child: Text(
                        'Not Found Task',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: state.tasks.length,
                      itemBuilder: (context, index) {
                        return Item(
                          task: state.tasks[index],
                        );
                      },
                    );
                  }
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
