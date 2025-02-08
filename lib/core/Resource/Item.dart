import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:to_do/core/Route/Routes.dart';
import 'package:to_do/data/taskModel.dart';
import 'package:to_do/ui/home/Cubit/Homeviewmodel.dart';

class Item extends StatelessWidget {
  Item({
    required this.task,
    super.key,
  });
  final Tasks task;
  var viewmodel = Homeviewmodel();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(7),
      child: Slidable(
        startActionPane: ActionPane(
          extentRatio: 0.50.w,
          motion: ScrollMotion(),
          children: [

            SlidableAction(
              borderRadius: BorderRadius.circular(15.r),
              onPressed: (context) {
                viewmodel.deleteTasks(task);
              },
              backgroundColor: Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              label: 'Delete',
            ),  SlidableAction(
              borderRadius: BorderRadius.circular(15.r),
              onPressed: (context) {
          Navigator.pushNamed(context, AppRoutes.edit, arguments: task);
              },
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              label: 'Edit',
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin:
                    EdgeInsets.only(top: 6, bottom: 6, left: 5, right: 15.w),
                height: 100.h,
                color: Colors.blueAccent,
                width: 4,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      task.title,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      task.descraption,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(11.r),
                ),
                child: Icon(
                  Icons.check,
                  size: 25,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
