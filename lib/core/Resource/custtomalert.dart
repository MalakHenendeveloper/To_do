import 'package:flutter/material.dart';

class Custtomalartdialog {
  static Showloading({required BuildContext context, required String Massage}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Row(
              children: [
                CircularProgressIndicator(),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(Massage),
                )
              ],
            ),
          );
        });
  }

  static HideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  static ShowMassage(
      {required BuildContext context,
      required String massage,
      required String title,
      String? nameactions,
      Function? action}) {
    List<Widget>? actions = [];
    if (nameactions != null) {
      actions.add(TextButton(
          onPressed: () {
            //     Navigator.pop(context);
            action?.call();
          },
          child: Text(nameactions)));
    }
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(massage),
            title: Text(title),
            actions: actions,
          );
        });
  }
}
