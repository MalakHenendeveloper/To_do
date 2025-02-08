import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do/core/Resource/custtomalert.dart';
import 'package:to_do/core/Route/Routes.dart';
import 'package:to_do/ui/auth/login/cubit/LoginState.dart';
import 'package:to_do/ui/auth/login/cubit/LoginViewModel.dart';

import '../../../core/Resource/CusttomTextField.dart';

class LoginScrren extends StatelessWidget {
  LoginScrren({super.key});
  var viewmodel = LoginViewModel();
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
              child: BlocListener(
            bloc: viewmodel,
            listener: (context, state) {
              if (state is LoginStateLoading) {
                Custtomalartdialog.Showloading(
                    context: context, Massage: 'Loading');
              } else if (state is LoginStateError) {
                Custtomalartdialog.HideLoading(context);
                Custtomalartdialog.ShowMassage(
                    context: context,
                    massage: 'Email or Password',
                    title: 'Error');
              } else if (state is LoginStateSuccess) {
                Custtomalartdialog.HideLoading(context);
                Custtomalartdialog.ShowMassage(
                    context: context,
                    massage: 'SuccessFuly Login',
                    action: () {
                      Navigator.pushReplacementNamed(context, AppRoutes.home);
                    },
                    nameactions: 'Ok',
                    title: 'Success');
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Custtomtextfield(
                  controller: viewmodel.emial,
                  hint: 'Enter Your Email',
                  label: 'Email',
                ),
                Custtomtextfield(
                  controller: viewmodel.password,
                  label: 'Password',
                  hint: 'Enter Your Password',
                ),
                Container(
                  width: 400.w,
                  height: 40,
                  margin: EdgeInsets.only(bottom: 20.h),
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 20.sp),
                    ),
                    onPressed: () {
                      viewmodel.login();
                    },
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Don`t have account ?',
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.register);
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
        )
      ],
    );
  }
}
