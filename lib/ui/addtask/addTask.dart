import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do/core/Resource/CusttomTextField.dart';
import 'package:to_do/core/Resource/validator.dart';
import 'package:to_do/ui/addtask/Cubit/Addtaskstate.dart';
import 'package:to_do/ui/addtask/Cubit/Addtaskviewmodel.dart';

class AddTaskScreen extends StatelessWidget {
  var viewmodel = Addtaskviewmodel();
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        toolbarHeight: 80.h,
        title: Text(
          'Add Task',
          style: TextStyle(color: Colors.white, fontSize: 20.sp),
        ),
        leadingWidth: 40,

      ),
      body: BlocConsumer<Addtaskviewmodel, AddtaskState>(
        bloc: viewmodel,
        listener: (context, state) {
          if (state is Addtasksuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Task added successfully!')),
            );
          } else if (state is AddtaskError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Failed to add task.')),
            );
          }
        },
        builder: (context, state) {
          if (state is AddtaskSelectdate) {
            state.selectedDate;
          }
          return Form(
            key: viewmodel.key,
            child: SingleChildScrollView(
              child: Container(
                height: 500.h,
                margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 80.h),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20.h),
                      child: Text(
                        'Add New Task',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 28.sp),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Custtomtextfield(
                      hint: 'Enter Your Task Title',
                      label: 'Title',
                      controller: viewmodel.title,
                      validator: (val) {
                        return AppValidator.validatorname(val);
                      },
                    ),
                    Custtomtextfield(
                      hint: 'Enter Your Task Description',
                      label: 'Description',
                      controller: viewmodel.descraption,
                      validator: (val) {
                        return AppValidator.validatorname(val);
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.h),
                      child: Text(
                        'Select Date',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.sp),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15.h, bottom: 20.h),
                      child: TextButton(
                        onPressed: () {
                          viewmodel.showclender(context);
                        },
                        child: Text(
                          '${viewmodel.selectedDate}',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.sp),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent),
                        onPressed: () {
                          viewmodel.validator();
                        },
                        child: Text(
                          'Add',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
