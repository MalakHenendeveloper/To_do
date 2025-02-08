import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Custtomtextfield extends StatelessWidget {
  Custtomtextfield(
      {super.key,
      this.label,
      this.hint,
      this.controller,
      this.value,
      this.onChanged,
      this.validator});
  final String? label;
  String? value;
  Function(String)? onChanged;
  String? Function(String?)? validator;
  final String? hint;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: TextFormField(
          onChanged: onChanged,
          validator: validator,
          controller: controller,
          initialValue: value,
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20.r)),
              labelText: label,
              hintText: hint,
              hintStyle:
                  TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500))),
    );
  }
}
