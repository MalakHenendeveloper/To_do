import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do/core/Resource/CusttomTextField.dart';
import 'package:to_do/core/Resource/validator.dart';
import 'package:to_do/data/taskModel.dart';
import 'package:to_do/ui/Edit/EditState.dart';
import 'package:to_do/ui/Edit/Editviewmodel.dart';

class Edittask extends StatelessWidget {
  Edittask({super.key, required this.task});
  Tasks task;
  var viewmodel = EditViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        toolbarHeight: 85.h,
        elevation: 0,
        backgroundColor: Colors.blue,
        title: Text(
          'Edit Task',
          style: TextStyle(
              color: Colors.white,
              fontSize: 25.sp,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: BlocListener<EditViewModel, EditState>(
          bloc: viewmodel,
          listener: (context, state) {
            if (state is EditError) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.ErrorMasege)));
            }
            else if(state is EditSuccess){
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('Edit , Success')));
            }
          },
          child: Container(
            height: 400.h,
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
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 28.sp),
                    textAlign: TextAlign.center,
                  ),
                ),
                Custtomtextfield(
                  hint: 'Enter Your Task Title',
                  label: 'Title',
                  value: task.title,
                  onChanged: (val) {
                    task.title = val;
                  },
                ),
                Custtomtextfield(
                  hint: 'Enter Your Task Description',
                  label: 'Description',
                  value: task.descraption,
                  onChanged: (val) {
                    task.descraption = val;
                  },
                ),
              Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent),
                    onPressed: () {
                      viewmodel.updateTask(task);
                    },
                    child: Text(
                      'Add',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Spacer(flex: 3,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
