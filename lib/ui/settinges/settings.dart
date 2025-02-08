import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do/core/Resource/CusttomTextField.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: 800.h,
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
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
                'Account Profile',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28.sp),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/background.png'),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30.w),
              child: Text(
                'Name',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
            ),
            Custtomtextfield(
              hint: 'Name',
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30.w),
              child: Text(
                'Phone',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
            ),
            Custtomtextfield(
              hint: 'Phone',
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30.w),
              child: Text(
                'Email',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
            ),
            Custtomtextfield(
              hint: 'Email',
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30.w),
              child: Text(
                'Password',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
            ),
            Custtomtextfield(
              hint: 'Password',
            ),

          ],
        ),
      ),
    );
  }
}
