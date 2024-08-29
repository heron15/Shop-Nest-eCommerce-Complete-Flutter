import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToast(
  String text,
  Color bgColor,
  Color textColor,
  ToastGravity toastPosition,
) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: toastPosition,
      timeInSecForIosWeb: 1,
      backgroundColor: bgColor,
      textColor: textColor,
      fontSize: 16.0,
    );
