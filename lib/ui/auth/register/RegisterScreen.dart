import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do/core/Resource/CusttomTextField.dart';
import 'package:to_do/core/Resource/custtomalert.dart';
import 'package:to_do/core/Route/Routes.dart';
import 'package:to_do/ui/auth/register/cubit/RegisterState.dart';
import 'package:to_do/ui/auth/register/cubit/RegisterViewModel.dart';

class Registerscreen extends StatelessWidget {
  Registerscreen({super.key});
  var viewmodel = Registerviewmodel();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
        ),
        Image.asset(
          'assets/background.png',
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Form(
              child: BlocListener<Registerviewmodel, RegisterState>(
            bloc: viewmodel,
            listener: (context, state) {
              if (state is RegisterSuccess) {
                Custtomalartdialog.HideLoading(context);
                Custtomalartdialog.ShowMassage(
                    context: context,
                    action: () {
                      Navigator.pushReplacementNamed(context, AppRoutes.main);
                    },
                    nameactions: 'Ok',
                    massage: 'RegisterSuccessfuly ',
                    title: 'Success');
              } else if (state is RegisterError) {
                Custtomalartdialog.HideLoading(context);
                Custtomalartdialog.ShowMassage(
                    context: context,
                    massage: 'Error ',
                    title: 'Email or Password invalid');
              } else if (state is Registerloading) {
                Custtomalartdialog.Showloading(
                    context: context, Massage: 'Loading');
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //  crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Custtomtextfield(
                  controller: viewmodel.emial,
                  hint: 'Enter Your Name',
                  label: 'Name',
                ),
                Custtomtextfield(
                  controller: viewmodel.emial,
                  hint: 'Enter Your Email',
                  label: 'Email',
                ),
                Custtomtextfield(
                  controller: viewmodel.password,
                  label: 'Phone',
                  hint: 'Enter Your Phone',
                ),
                Custtomtextfield(
                  controller: viewmodel.password,
                  label: 'Password',
                  hint: 'Enter Your Password',
                ),
                Container(
                  width: 400.w,
                  height: 50,
                  child: ElevatedButton(
                    style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 20.sp),
                    ),
                    onPressed: () {
                      viewmodel.Register();
                    },
                  ),
                ),
              ],
            ),
          )),
        )
      ],
    );
  }
}
