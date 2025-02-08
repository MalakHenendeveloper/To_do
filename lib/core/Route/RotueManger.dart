import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do/core/Route/Routes.dart';
import 'package:to_do/data/taskModel.dart';
import 'package:to_do/ui/Edit/EditTask.dart';
import 'package:to_do/ui/Main_layout/MainlauoutScreen.dart';
import 'package:to_do/ui/addtask/addTask.dart';
import 'package:to_do/ui/auth/login/LoginScreen.dart';
import 'package:to_do/ui/auth/register/RegisterScreen.dart';
import 'package:to_do/ui/home/HomeScreen.dart';
import 'package:to_do/ui/settinges/settings.dart';

class RouteManger {
  static Route<dynamic> getroute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => LoginScrren());
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => Homescreen());
      case AppRoutes.register:
        return MaterialPageRoute(builder: (_) => Registerscreen());
      case AppRoutes.settings:
        return MaterialPageRoute(builder: (_) => Settings());
      case AppRoutes.main:
        return MaterialPageRoute(builder: (_) => Mainlauoutscreen());
      case AppRoutes.addtask:
        return MaterialPageRoute(builder: (_) => AddTaskScreen());
        case AppRoutes.edit:
          var task=settings.arguments as Tasks;
        return MaterialPageRoute(builder: (_) => Edittask(task: task,));
      default:
        return error();
    }
  }

  static Route<dynamic> error() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              body: Center(
                child: Text('Not Found Route'),
              ),
            ));
  }
}
