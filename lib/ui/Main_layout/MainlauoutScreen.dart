import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do/core/Route/Routes.dart';
import 'package:to_do/ui/Main_layout/Cubit/MainlauoutState.dart';
import 'package:to_do/ui/Main_layout/Cubit/MainlauoutViewModel.dart';
import 'package:to_do/ui/addtask/addTask.dart';

class Mainlauoutscreen extends StatelessWidget {
  Mainlauoutscreen({super.key});
  var viewmodel = Mainlayout();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Mainlayout, MainlayoutState>(
      bloc: viewmodel,
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 233, 230, 230),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.blueAccent,
            title: Text(
              'To Do ',
              style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            toolbarHeight: 70.h,
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white, width: 4),
                borderRadius: BorderRadius.circular(30.r)),
            backgroundColor: Colors.blueAccent,
            onPressed: () => Navigator.pushNamed(context, AppRoutes.addtask),
            child: Icon(Icons.add),
          ),
          bottomNavigationBar: BottomAppBar(
            padding: EdgeInsets.zero,
            color: Colors.white,
            shape: CircularNotchedRectangle(),
            notchMargin: 6,
            child: BottomNavigationBar(
              onTap: (value) => viewmodel.changetab(value),
              currentIndex: viewmodel.index,
              backgroundColor: Colors.transparent,
              elevation: 0,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              iconSize: 35,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.list), label: ''),
                BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
              ],
            ),
          ),
          body: viewmodel.tab[viewmodel.index],
        );
      },
    );
  }
}
