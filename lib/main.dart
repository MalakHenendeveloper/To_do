import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do/core/Resource/Bloc.dart';
import 'package:to_do/core/Route/RotueManger.dart';
import 'package:to_do/core/Route/Routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyC4UoOrgTIbrZqXNq7yTUYnO_qlS6Vyo8c",
              appId: "com.example.to_do",
              messagingSenderId: "324131504715",
              projectId: "todo-96748"))
      : await Firebase.initializeApp();

  User? user = FirebaseAuth.instance.currentUser;
  String? route;
  if (user != null) {
    route = AppRoutes.main;
  } else {
    route = AppRoutes.login;
  }
  Bloc.observer = MyBlocObserver();
  runApp(MyApp(
    route: route,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.route});
  final String route;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 930),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => SafeArea(
        child: MaterialApp(
          home: child,
          initialRoute: route,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RouteManger.getroute,
        ),
      ),
    );
  }
}
